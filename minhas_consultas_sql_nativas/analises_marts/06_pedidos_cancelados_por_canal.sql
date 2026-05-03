with pedidos_cancelados as (
    select distinct
        fv.pedido_id,
        fv.canal_venda,
        fv.cliente_id
    from fact_vendas fv
    where fv.is_pedido_cancelado = true
),

clientes_impactados as (
    select
        pc.pedido_id,
        pc.canal_venda,
        dc.segmento,
        dc.uf_cadastro
    from pedidos_cancelados pc
    left join dim_clientes dc
        on pc.cliente_id = dc.cliente_id
),

resumo_cancelamentos as (
    select
        canal_venda,
        count(distinct pedido_id) as pedidos_cancelados,
        count(distinct case
            when segmento = 'pf' then pedido_id
        end) as pedidos_cancelados_pf,
        count(distinct case
            when segmento = 'b2b' then pedido_id
        end) as pedidos_cancelados_b2b,
        count(distinct uf_cadastro) as ufs_impactadas
    from clientes_impactados
    group by 1
)

select
    canal_venda,
    pedidos_cancelados,
    pedidos_cancelados_pf,
    pedidos_cancelados_b2b,
    ufs_impactadas
from resumo_cancelamentos
order by pedidos_cancelados desc, canal_venda;
