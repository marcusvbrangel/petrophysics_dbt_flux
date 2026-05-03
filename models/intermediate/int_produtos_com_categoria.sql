with produtos as (
    select *
    from {{ ref('stg_produto') }}
),

categorias as (
    select *
    from {{ ref('stg_categoria') }}
),

joined as (
    select
        p.produto_id,
        p.nome_produto,
        p.status_produto,
        p.quantidade_estoque,
        p.preco_atual,
        p.categoria_id,
        c.sigla_categoria,
        c.nome_categoria,
        p.marca,
        p.dt_cadastro,
        cast(p.quantidade_estoque * p.preco_atual as decimal(18,2)) as valor_estoque_atual
    from produtos p
    left join categorias c
        on p.categoria_id = c.categoria_id
)

select
    produto_id,
    nome_produto,
    status_produto,
    quantidade_estoque,
    preco_atual,
    categoria_id,
    sigla_categoria,
    nome_categoria,
    marca,
    dt_cadastro,
    valor_estoque_atual
from joined
