with clientes as (
    select *
    from "dev"."main"."stg_cliente"
),

enderecos as (
    select *
    from "dev"."main"."stg_endereco"
),

joined as (
    select
        c.cliente_id,
        c.nome_cliente,
        c.email,
        c.dt_cadastro,
        c.status_cliente,
        c.segmento,
        c.canal_preferido,
        c.score_fidelidade,
        e.endereco_id,
        e.uf,
        e.cidade,
        e.cep,
        e.logradouro,
        e.bairro,
        e.numero,
        e.complemento
    from clientes c
    left join enderecos e
        on c.cliente_id = e.cliente_id
)

select
    cliente_id,
    nome_cliente,
    email,
    dt_cadastro,
    status_cliente,
    segmento,
    canal_preferido,
    score_fidelidade,
    endereco_id,
    uf,
    cidade,
    cep,
    logradouro,
    bairro,
    numero,
    complemento
from joined