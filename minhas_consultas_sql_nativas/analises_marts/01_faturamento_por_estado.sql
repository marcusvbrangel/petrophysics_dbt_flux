with base_vendas as (
    select
        fv.pedido_id,
        fv.cliente_id,
        coalesce(fv.uf_entrega, dc.uf_cadastro) as uf_analise,
        fv.receita_liquida_item
    from fact_vendas fv
    left join dim_clientes dc
        on fv.cliente_id = dc.cliente_id
),

faturamento_por_estado as (
    select
        uf_analise as uf,
        count(distinct case
            when receita_liquida_item > 0 then pedido_id
        end) as pedidos_faturados,
        count(distinct case
            when receita_liquida_item > 0 then cliente_id
        end) as clientes_com_compra,
        round(sum(receita_liquida_item), 2) as faturamento_total,
        round(
            sum(receita_liquida_item)
            / nullif(
                count(distinct case
                    when receita_liquida_item > 0 then pedido_id
                end),
                0
            ),
            2
        ) as ticket_medio_pedido
    from base_vendas
    group by 1
)

select
    uf,
    pedidos_faturados,
    clientes_com_compra,
    faturamento_total,
    ticket_medio_pedido
from faturamento_por_estado
order by faturamento_total desc, uf;
