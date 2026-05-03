

with base_vendas as (
    select
        fv.mes_pedido,
        fv.ano_pedido,
        fv.mes_numero_pedido,
        fv.pedido_id,
        fv.cliente_id,
        fv.quantidade_vendida,
        fv.receita_liquida_item
    from "dev"."main"."fact_vendas" fv
    where fv.is_pedido_cancelado = false
),

agregado as (
    select
        mes_pedido,
        ano_pedido,
        mes_numero_pedido,
        count(distinct pedido_id) as pedidos_faturados,
        count(distinct cliente_id) as clientes_com_compra,
        sum(quantidade_vendida) as quantidade_total_vendida,
        cast(sum(receita_liquida_item) as decimal(18, 2)) as receita_total,
        cast(
            sum(receita_liquida_item) / nullif(count(distinct pedido_id), 0)
            as decimal(18, 2)
        ) as ticket_medio_mensal
    from base_vendas
    group by 1, 2, 3
),

enriquecido as (
    select
        dense_rank() over (order by receita_total desc) as ranking_receita,
        mes_pedido,
        ano_pedido,
        mes_numero_pedido,
        pedidos_faturados,
        clientes_com_compra,
        quantidade_total_vendida,
        receita_total,
        ticket_medio_mensal
    from agregado
)

select
    ranking_receita,
    mes_pedido,
    ano_pedido,
    mes_numero_pedido,
    pedidos_faturados,
    clientes_com_compra,
    quantidade_total_vendida,
    receita_total,
    ticket_medio_mensal
from enriquecido