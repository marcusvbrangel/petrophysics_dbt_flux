with source as (
    select *
    from "dev"."main"."categoria"
),

renamed as (
    select
        categoria_id,
        trim(sigla) as sigla_raw,
        trim("Nome Categoria") as nome_categoria_raw
    from source
),

standardized as (
    select
        categoria_id,
        upper(sigla_raw) as sigla_categoria,
        regexp_replace(nome_categoria_raw, '\s+', ' ', 'g') as nome_categoria
    from renamed
)

select
    categoria_id,
    sigla_categoria,
    nome_categoria
from standardized