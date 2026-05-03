

with clientes as (
    select
        dc.cliente_id,
        dc.uf_cadastro,
        dc.status_cliente,
        dc.is_cliente_ativo,
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
        c.uf_cadastro,
        c.status_cliente,
        c.is_cliente_ativo,
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
        uf_cadastro,
        count(*) as total_clientes,
        count(case when is_cliente_ativo then 1 end) as clientes_ativos,
        count(case when not is_cliente_ativo then 1 end) as clientes_inativos,
        count(case when realizou_compra then 1 end) as clientes_com_compra,
        count(case when not realizou_compra then 1 end) as clientes_sem_compra,
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
        uf_cadastro,
        total_clientes,
        clientes_ativos,
        clientes_inativos,
        clientes_com_compra,
        clientes_sem_compra,
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
    uf_cadastro,
    total_clientes,
    clientes_ativos,
    clientes_inativos,
    clientes_com_compra,
    clientes_sem_compra,
    pedidos_faturados,
    quantidade_total_vendida,
    receita_total,
    score_medio_fidelidade,
    ticket_medio_pedido,
    receita_media_por_cliente_com_compra
from rankeado