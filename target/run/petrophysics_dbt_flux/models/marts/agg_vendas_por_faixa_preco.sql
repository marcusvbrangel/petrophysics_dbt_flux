
  
  create view "dev"."main"."agg_vendas_por_faixa_preco__dbt_tmp" as (
    

with vendas_validas as (
    select
        fv.pedido_id,
        fv.cliente_id,
        fv.produto_id,
        fv.quantidade_vendida,
        fv.receita_liquida_item
    from "dev"."main"."fact_vendas" fv
    where fv.quantidade_vendida > 0
),

produtos as (
    select
        dp.produto_id,
        dp.faixa_preco
    from "dev"."main"."dim_produtos" dp
),

agregado as (
    select
        p.faixa_preco,
        count(distinct p.produto_id) as produtos_distintos,
        count(distinct v.pedido_id) as pedidos_com_venda,
        count(distinct v.cliente_id) as clientes_com_compra,
        sum(v.quantidade_vendida) as quantidade_total_vendida,
        cast(sum(v.receita_liquida_item) as decimal(18, 2)) as faturamento_total,
        cast(
            sum(v.receita_liquida_item) / nullif(count(distinct v.pedido_id), 0)
            as decimal(18, 2)
        ) as ticket_medio_pedido
    from vendas_validas v
    inner join produtos p
        on v.produto_id = p.produto_id
    group by 1
),

rankeado as (
    select
        dense_rank() over (order by quantidade_total_vendida desc, faturamento_total desc) as ranking_quantidade,
        dense_rank() over (order by faturamento_total desc, quantidade_total_vendida desc) as ranking_faturamento,
        faixa_preco,
        produtos_distintos,
        pedidos_com_venda,
        clientes_com_compra,
        quantidade_total_vendida,
        faturamento_total,
        ticket_medio_pedido
    from agregado
)

select
    ranking_quantidade,
    ranking_faturamento,
    faixa_preco,
    produtos_distintos,
    pedidos_com_venda,
    clientes_com_compra,
    quantidade_total_vendida,
    faturamento_total,
    ticket_medio_pedido
from rankeado
  );
