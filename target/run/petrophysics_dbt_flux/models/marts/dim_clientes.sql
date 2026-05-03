
  
  create view "dev"."main"."dim_clientes__dbt_tmp" as (
    

with source as (
    select *
    from "dev"."main"."int_clientes_com_endereco"
),

enriched as (
    select
        cliente_id,
        nome_cliente,
        email,
        dt_cadastro,
        date_trunc('month', dt_cadastro)::date as mes_cadastro,
        extract(year from dt_cadastro) as ano_cadastro,
        status_cliente,
        status_cliente = 'ativo' as is_cliente_ativo,
        segmento,
        canal_preferido,
        score_fidelidade,
        case
            when score_fidelidade >= 80 then 'alta'
            when score_fidelidade >= 60 then 'media'
            else 'baixa'
        end as faixa_score_fidelidade,
        endereco_id,
        uf as uf_cadastro,
        cidade as cidade_cadastro,
        cep,
        logradouro,
        bairro,
        numero,
        complemento
    from source
)

select
    cliente_id,
    nome_cliente,
    email,
    dt_cadastro,
    mes_cadastro,
    ano_cadastro,
    status_cliente,
    is_cliente_ativo,
    segmento,
    canal_preferido,
    score_fidelidade,
    faixa_score_fidelidade,
    endereco_id,
    uf_cadastro,
    cidade_cadastro,
    cep,
    logradouro,
    bairro,
    numero,
    complemento
from enriched
  );
