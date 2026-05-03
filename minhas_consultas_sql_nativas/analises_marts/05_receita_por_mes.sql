with base_vendas as (
    select
        fv.mes_pedido,
        fv.pedido_id,
        fv.cliente_id,
        fv.receita_liquida_item
    from fact_vendas fv
    where fv.is_pedido_cancelado = false
),

receita_mensal as (
    select
        mes_pedido,
        extract(year from mes_pedido) as ano_referencia,
        extract(month from mes_pedido) as mes_referencia,
        count(distinct pedido_id) as pedidos_faturados,
        count(distinct cliente_id) as clientes_com_compra,
        round(sum(receita_liquida_item), 2) as receita_total,
        round(
            sum(receita_liquida_item) / nullif(count(distinct pedido_id), 0),
            2
        ) as ticket_medio_mensal
    from base_vendas
    group by 1, 2, 3
)

select
    mes_pedido,
    ano_referencia,
    mes_referencia,
    pedidos_faturados,
    clientes_com_compra,
    receita_total,
    ticket_medio_mensal
from receita_mensal
order by mes_pedido;
