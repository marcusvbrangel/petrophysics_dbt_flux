with source as (
    select *
    from "dev"."main"."produto"
),

renamed as (
    select
        produto_id,
        trim("Nome Produto") as nome_produto_raw,
        trim("ativo?") as status_produto_raw,
        "Qtd Estoque" as quantidade_estoque,
        "Preco Atual" as preco_atual_raw,
        categoria_id,
        trim("Marca") as marca_raw,
        trim("Dt Cadastro") as dt_cadastro_raw
    from source
),

standardized as (
    select
        produto_id,
        regexp_replace(nome_produto_raw, '\s+', ' ', 'g') as nome_produto,
        case
            when lower(status_produto_raw) in ('ativo', 'a') then 'ativo'
            when lower(status_produto_raw) = 'inativo' then 'inativo'
            else lower(status_produto_raw)
        end as status_produto,
        cast(quantidade_estoque as integer) as quantidade_estoque,
        cast(preco_atual_raw as decimal(18,2)) as preco_atual,
        categoria_id,
        regexp_replace(marca_raw, '\s+', ' ', 'g') as marca,
        coalesce(
            try_strptime(dt_cadastro_raw, '%Y-%m-%d'),
            try_strptime(dt_cadastro_raw, '%d/%m/%Y'),
            try_strptime(dt_cadastro_raw, '%Y/%m/%d')
        )::date as dt_cadastro
    from renamed
)

select
    produto_id,
    nome_produto,
    status_produto,
    quantidade_estoque,
    preco_atual,
    categoria_id,
    marca,
    dt_cadastro
from standardized