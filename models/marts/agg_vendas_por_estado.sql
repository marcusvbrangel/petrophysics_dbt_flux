{{ config(materialized='view') }}

with base_vendas as (
    select
        fv.pedido_id,
        fv.cliente_id,
        coalesce(fv.uf_entrega, dc.uf_cadastro) as uf,
        fv.quantidade_vendida,
        fv.receita_liquida_item
    from {{ ref('fact_vendas') }} fv
    left join {{ ref('dim_clientes') }} dc
        on fv.cliente_id = dc.cliente_id
),

agregado as (
    select
        uf,
        count(distinct pedido_id) as pedidos_totais,
        count(distinct case
            when receita_liquida_item > 0 then pedido_id
        end) as pedidos_faturados,
        count(distinct case
            when receita_liquida_item > 0 then cliente_id
        end) as clientes_com_compra,
        sum(quantidade_vendida) as quantidade_total_vendida,
        cast(sum(receita_liquida_item) as decimal(18, 2)) as faturamento_total,
        cast(
            sum(receita_liquida_item)
            / nullif(
                count(distinct case
                    when receita_liquida_item > 0 then pedido_id
                end),
                0
            )
            as decimal(18, 2)
        ) as ticket_medio_pedido
    from base_vendas
    group by 1
    having sum(receita_liquida_item) > 0
),

rankeado as (
    select
        dense_rank() over (order by faturamento_total desc) as ranking_faturamento,
        dense_rank() over (order by quantidade_total_vendida desc) as ranking_quantidade,
        uf,
        pedidos_totais,
        pedidos_faturados,
        clientes_com_compra,
        quantidade_total_vendida,
        faturamento_total,
        ticket_medio_pedido
    from agregado
)

select
    ranking_faturamento,
    ranking_quantidade,
    uf,
    pedidos_totais,
    pedidos_faturados,
    clientes_com_compra,
    quantidade_total_vendida,
    faturamento_total,
    ticket_medio_pedido
from rankeado
