with pedidos_validos as (
    select
        fv.pedido_id,
        fv.canal_venda,
        dc.segmento,
        sum(fv.receita_liquida_item) as valor_pedido
    from fact_vendas fv
    inner join dim_clientes dc
        on fv.cliente_id = dc.cliente_id
    where fv.is_pedido_cancelado = false
    group by 1, 2, 3
),

ticket_geral as (
    select
        0 as ordem_exibicao,
        'geral' as recorte,
        'todos' as valor_recorte,
        count(*) as quantidade_pedidos,
        cast(sum(valor_pedido) as decimal(18, 2)) as receita_total,
        cast(avg(valor_pedido) as decimal(18, 2)) as ticket_medio
    from pedidos_validos
),

ticket_por_canal as (
    select
        1 as ordem_exibicao,
        'canal_venda' as recorte,
        canal_venda as valor_recorte,
        count(*) as quantidade_pedidos,
        cast(sum(valor_pedido) as decimal(18, 2)) as receita_total,
        cast(avg(valor_pedido) as decimal(18, 2)) as ticket_medio
    from pedidos_validos
    group by 1, 2, 3
),

ticket_por_segmento as (
    select
        2 as ordem_exibicao,
        'segmento_cliente' as recorte,
        segmento as valor_recorte,
        count(*) as quantidade_pedidos,
        cast(sum(valor_pedido) as decimal(18, 2)) as receita_total,
        cast(avg(valor_pedido) as decimal(18, 2)) as ticket_medio
    from pedidos_validos
    group by 1, 2, 3
),

consolidado as (
    select
        ordem_exibicao,
        recorte,
        valor_recorte,
        quantidade_pedidos,
        receita_total,
        ticket_medio
    from ticket_geral

    union all

    select
        ordem_exibicao,
        recorte,
        valor_recorte,
        quantidade_pedidos,
        receita_total,
        ticket_medio
    from ticket_por_canal

    union all

    select
        ordem_exibicao,
        recorte,
        valor_recorte,
        quantidade_pedidos,
        receita_total,
        ticket_medio
    from ticket_por_segmento
)

select
    recorte,
    valor_recorte,
    quantidade_pedidos,
    receita_total,
    ticket_medio
from consolidado

order by
    ordem_exibicao,
    ticket_medio desc,
    valor_recorte;
