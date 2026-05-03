
  
  create view "dev"."main"."agg_clientes_por_segmento__dbt_tmp" as (
    

with clientes as (
    select
        dc.cliente_id,
        coalesce(dc.segmento, 'nao_informado') as segmento,
        dc.status_cliente,
        dc.is_cliente_ativo,
        dc.faixa_score_fidelidade,
        dc.score_fidelidade
    from "dev"."main"."dim_clientes" dc
),

pedidos_por_cliente as (
    select
        fv.cliente_id,
        count(distinct fv.pedido_id) as pedidos_faturados,
        sum(fv.quantidade_vendida) as quantidade_total_vendida,
        cast(sum(fv.receita_liquida_item) as decimal(18, 2)) as receita_total
    from "dev"."main"."fact_vendas" fv
    where fv.is_pedido_cancelado = false
    group by 1
),

clientes_enriquecidos as (
    select
        c.cliente_id,
        c.segmento,
        c.status_cliente,
        c.is_cliente_ativo,
        c.faixa_score_fidelidade,
        c.score_fidelidade,
        coalesce(p.pedidos_faturados, 0) as pedidos_faturados,
        coalesce(p.quantidade_total_vendida, 0) as quantidade_total_vendida,
        coalesce(p.receita_total, 0) as receita_total,
        coalesce(p.pedidos_faturados, 0) > 0 as realizou_compra
    from clientes c
    left join pedidos_por_cliente p
        on c.cliente_id = p.cliente_id
),

agregado as (
    select
        segmento,
        count(*) as total_clientes,
        count(case when is_cliente_ativo then 1 end) as clientes_ativos,
        count(case when not is_cliente_ativo then 1 end) as clientes_inativos,
        count(case when realizou_compra then 1 end) as clientes_com_compra,
        count(case when not realizou_compra then 1 end) as clientes_sem_compra,
        count(case when faixa_score_fidelidade = 'alta' then 1 end) as clientes_score_alta,
        count(case when faixa_score_fidelidade = 'media' then 1 end) as clientes_score_media,
        count(case when faixa_score_fidelidade = 'baixa' then 1 end) as clientes_score_baixa,
        sum(pedidos_faturados) as pedidos_faturados,
        sum(quantidade_total_vendida) as quantidade_total_vendida,
        cast(sum(receita_total) as decimal(18, 2)) as receita_total,
        cast(avg(score_fidelidade) as decimal(18, 2)) as score_medio_fidelidade,
        cast(
            sum(receita_total) / nullif(sum(pedidos_faturados), 0)
            as decimal(18, 2)
        ) as ticket_medio_pedido,
        cast(
            sum(receita_total) / nullif(count(case when realizou_compra then 1 end), 0)
            as decimal(18, 2)
        ) as receita_media_por_cliente_com_compra
    from clientes_enriquecidos
    group by 1
),

rankeado as (
    select
        dense_rank() over (order by receita_total desc) as ranking_receita,
        segmento,
        total_clientes,
        clientes_ativos,
        clientes_inativos,
        clientes_com_compra,
        clientes_sem_compra,
        clientes_score_alta,
        clientes_score_media,
        clientes_score_baixa,
        pedidos_faturados,
        quantidade_total_vendida,
        receita_total,
        score_medio_fidelidade,
        ticket_medio_pedido,
        receita_media_por_cliente_com_compra
    from agregado
)

select
    ranking_receita,
    segmento,
    total_clientes,
    clientes_ativos,
    clientes_inativos,
    clientes_com_compra,
    clientes_sem_compra,
    clientes_score_alta,
    clientes_score_media,
    clientes_score_baixa,
    pedidos_faturados,
    quantidade_total_vendida,
    receita_total,
    score_medio_fidelidade,
    ticket_medio_pedido,
    receita_media_por_cliente_com_compra
from rankeado
  );
