
  
  create view "dev"."main"."dim_produtos__dbt_tmp" as (
    

with source as (
    select *
    from "dev"."main"."int_produtos_com_categoria"
),

enriched as (
    select
        produto_id,
        nome_produto,
        status_produto,
        status_produto = 'ativo' as is_produto_ativo,
        quantidade_estoque,
        case
            when quantidade_estoque = 0 then 'sem_estoque'
            when quantidade_estoque <= 10 then 'baixo_estoque'
            when quantidade_estoque <= 50 then 'estoque_medio'
            else 'estoque_alto'
        end as situacao_estoque,
        preco_atual,
        case
            when preco_atual < 100 then 'ate_99'
            when preco_atual < 300 then '100_a_299'
            when preco_atual < 600 then '300_a_599'
            else '600_ou_mais'
        end as faixa_preco,
        categoria_id,
        sigla_categoria,
        nome_categoria,
        marca,
        dt_cadastro,
        valor_estoque_atual
    from source
)

select
    produto_id,
    nome_produto,
    status_produto,
    is_produto_ativo,
    quantidade_estoque,
    situacao_estoque,
    preco_atual,
    faixa_preco,
    categoria_id,
    sigla_categoria,
    nome_categoria,
    marca,
    dt_cadastro,
    valor_estoque_atual
from enriched
  );
