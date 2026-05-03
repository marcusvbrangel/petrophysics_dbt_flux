
  
  create view "dev"."main"."agg_vendas_por_canal__dbt_tmp" as (
    

with pedidos as (
    select
        fv.pedido_id,
        fv.canal_venda,
        fv.cliente_id,
        max(case when fv.is_pedido_cancelado then 1 else 0 end) as is_pedido_cancelado,
        sum(fv.quantidade_vendida) as quantidade_total_vendida,
        cast(sum(fv.receita_liquida_item) as decimal(18, 2)) as receita_total_pedido
    from "dev"."main"."fact_vendas" fv
    group by 1, 2, 3
),

agregado as (
    select
        canal_venda,
        count(*) as pedidos_totais,
        count(case when is_pedido_cancelado = 0 then 1 end) as pedidos_faturados,
        count(case when is_pedido_cancelado = 1 then 1 end) as pedidos_cancelados,
        count(distinct case when is_pedido_cancelado = 0 then cliente_id end) as clientes_com_compra,
        sum(quantidade_total_vendida) as quantidade_total_vendida,
        cast(sum(receita_total_pedido) as decimal(18, 2)) as faturamento_total,
        cast(
            sum(receita_total_pedido) / nullif(count(case when is_pedido_cancelado = 0 then 1 end), 0)
            as decimal(18, 2)
        ) as ticket_medio_pedido,
        cast(
            count(case when is_pedido_cancelado = 1 then 1 end) * 1.0 / nullif(count(*), 0)
            as decimal(18, 4)
        ) as percentual_cancelamento
    from pedidos
    group by 1
),

rankeado as (
    select
        dense_rank() over (order by faturamento_total desc) as ranking_faturamento,
        dense_rank() over (order by quantidade_total_vendida desc) as ranking_quantidade,
        canal_venda,
        pedidos_totais,
        pedidos_faturados,
        pedidos_cancelados,
        clientes_com_compra,
        quantidade_total_vendida,
        faturamento_total,
        ticket_medio_pedido,
        percentual_cancelamento
    from agregado
)

select
    ranking_faturamento,
    ranking_quantidade,
    canal_venda,
    pedidos_totais,
    pedidos_faturados,
    pedidos_cancelados,
    clientes_com_compra,
    quantidade_total_vendida,
    faturamento_total,
    ticket_medio_pedido,
    percentual_cancelamento
from rankeado
  );
