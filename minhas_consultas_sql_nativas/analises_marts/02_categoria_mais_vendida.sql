with vendas_validas as (
    select
        fv.pedido_id,
        fv.produto_id,
        fv.quantidade_vendida,
        fv.receita_liquida_item
    from fact_vendas fv
    where fv.quantidade_vendida > 0
),

produtos as (
    select
        dp.produto_id,
        dp.categoria_id,
        dp.nome_categoria
    from dim_produtos dp
),

ranking_categoria as (
    select
        p.categoria_id,
        p.nome_categoria,
        sum(v.quantidade_vendida) as quantidade_total_vendida,
        round(sum(v.receita_liquida_item), 2) as faturamento_total,
        count(distinct v.pedido_id) as pedidos_com_categoria,
        dense_rank() over (
            order by
                sum(v.quantidade_vendida) desc,
                sum(v.receita_liquida_item) desc
        ) as ranking_quantidade
    from vendas_validas v
    inner join produtos p
        on v.produto_id = p.produto_id
    group by 1, 2
)

select
    ranking_quantidade,
    categoria_id,
    nome_categoria,
    quantidade_total_vendida,
    faturamento_total,
    pedidos_com_categoria
from ranking_categoria
order by ranking_quantidade, nome_categoria;
