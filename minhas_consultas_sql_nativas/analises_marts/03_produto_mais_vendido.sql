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
        dp.nome_produto,
        dp.nome_categoria,
        dp.marca
    from dim_produtos dp
),

ranking_produto as (
    select
        p.produto_id,
        p.nome_produto,
        p.nome_categoria,
        p.marca,
        sum(v.quantidade_vendida) as quantidade_total_vendida,
        round(sum(v.receita_liquida_item), 2) as faturamento_total,
        count(distinct v.pedido_id) as pedidos_com_produto,
        dense_rank() over (
            order by
                sum(v.quantidade_vendida) desc,
                sum(v.receita_liquida_item) desc
        ) as ranking_quantidade
    from vendas_validas v
    inner join produtos p
        on v.produto_id = p.produto_id
    group by 1, 2, 3, 4
)

select
    ranking_quantidade,
    produto_id,
    nome_produto,
    nome_categoria,
    marca,
    quantidade_total_vendida,
    faturamento_total,
    pedidos_com_produto
from ranking_produto
order by ranking_quantidade, nome_produto;
