
  
  create view "dev"."main"."stg_cliente__dbt_tmp" as (
    with 
source as (
    select *
    from "dev"."main"."cliente"
),

renamed as (
    select
        cliente_id,
        trim("Nome Cliente") as nome_cliente_raw,
        trim("E-mail") as email_raw,
        trim("Dt Cadastro") as dt_cadastro_raw,
        trim("Status Cliente") as status_cliente_raw,
        trim("Segmento") as segmento_raw,
        trim("Canal Preferido") as canal_preferido_raw,
        "Score Fidelidade" as score_fidelidade
    from source
),

standardized as (
    select
        cliente_id,
        regexp_replace(nome_cliente_raw, '\s+', ' ', 'g') as nome_cliente,
        lower(email_raw) as email,
        coalesce(
            try_strptime(dt_cadastro_raw, '%Y-%m-%d'),
            try_strptime(dt_cadastro_raw, '%d/%m/%Y'),
            try_strptime(dt_cadastro_raw, '%Y/%m/%d')
        )::date as dt_cadastro,
        case
            when lower(status_cliente_raw) in ('ativo', 'a') then 'ativo'
            when lower(status_cliente_raw) in ('inativo', 'i') then 'inativo'
            else lower(status_cliente_raw)
        end as status_cliente,
        case
            when lower(segmento_raw) in ('pf', 'pessoa fisica') then 'pf'
            when lower(segmento_raw) = 'b2b' then 'b2b'
            when segmento_raw = '' then null
            else lower(segmento_raw)
        end as segmento,
        case
            when lower(canal_preferido_raw) = 'site' then 'site'
            when lower(canal_preferido_raw) = 'app' then 'app'
            when lower(canal_preferido_raw) = 'marketplace' then 'marketplace'
            when canal_preferido_raw = '' then null
            else lower(canal_preferido_raw)
        end as canal_preferido,
        score_fidelidade
    from renamed
)

select
    cliente_id,
    nome_cliente,
    email,
    dt_cadastro,
    status_cliente,
    segmento,
    canal_preferido,
    score_fidelidade
from standardized
  );
