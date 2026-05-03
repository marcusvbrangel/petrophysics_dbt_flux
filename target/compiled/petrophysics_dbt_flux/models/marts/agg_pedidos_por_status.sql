

with base_pedidos as (
    select
        fv.pedido_id,
        fv.status_pedido,
        fv.cliente_id,
        sum(fv.quantidade_vendida) as quantidade_total_vendida,
        cast(sum(fv.receita_liquida_item) as decimal(18, 2)) as receita_total_pedido
    from "dev"."main"."fact_vendas" fv
    group by 1, 2, 3
),

totais as (
    select
        count(*) as total_pedidos
    from base_pedidos
),

agregado as (
    select
        bp.status_pedido,
        count(*) as quantidade_pedidos,
        count(distinct bp.cliente_id) as clientes_distintos,
        sum(bp.quantidade_total_vendida) as quantidade_total_vendida,
        cast(sum(bp.receita_total_pedido) as decimal(18, 2)) as receita_total,
        cast(
            sum(bp.receita_total_pedido) / nullif(count(*), 0)
            as decimal(18, 2)
        ) as ticket_medio_pedido,
        cast(
            count(*) * 1.0 / nullif((select total_pedidos from totais), 0)
            as decimal(18, 4)
        ) as percentual_pedidos
    from base_pedidos bp
    group by 1
),

rankeado as (
    select
        dense_rank() over (order by quantidade_pedidos desc) as ranking_quantidade_pedidos,
        dense_rank() over (order by receita_total desc) as ranking_receita,
        status_pedido,
        quantidade_pedidos,
        clientes_distintos,
        quantidade_total_vendida,
        receita_total,
        ticket_medio_pedido,
        percentual_pedidos
    from agregado
)

select
    ranking_quantidade_pedidos,
    ranking_receita,
    status_pedido,
    quantidade_pedidos,
    clientes_distintos,
    quantidade_total_vendida,
    receita_total,
    ticket_medio_pedido,
    percentual_pedidos
from rankeado