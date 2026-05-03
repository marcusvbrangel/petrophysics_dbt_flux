with source as (
    select *
    from {{ ref('endereco') }}
),

renamed as (
    select
        endereco_id,
        cliente_id,
        trim("UF") as uf_raw,
        trim("Nome Cidade") as cidade_raw,
        trim("CEP") as cep_raw,
        trim("Logradouro") as logradouro_raw,
        trim(bairro) as bairro_raw,
        numero,
        trim(complemento) as complemento_raw
    from source
),

standardized as (
    select
        endereco_id,
        cliente_id,
        upper(uf_raw) as uf,
        lower(regexp_replace(cidade_raw, '\s+', ' ', 'g')) as cidade,
        cep_raw as cep,
        regexp_replace(logradouro_raw, '\s+', ' ', 'g') as logradouro,
        regexp_replace(bairro_raw, '\s+', ' ', 'g') as bairro,
        numero,
        nullif(regexp_replace(complemento_raw, '\s+', ' ', 'g'), '') as complemento
    from renamed
)

select
    endereco_id,
    cliente_id,
    uf,
    cidade,
    cep,
    logradouro,
    bairro,
    numero,
    complemento
from standardized
