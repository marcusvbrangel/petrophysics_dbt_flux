{% snapshot snap_produtos %}

{{
    config(
        target_schema='snapshots',
        unique_key='produto_id',
        strategy='check',
        check_cols=[
            'nome_produto',
            'status_produto',
            'quantidade_estoque',
            'preco_atual',
            'categoria_id',
            'marca',
            'dt_cadastro'
        ],
        hard_deletes='invalidate'
    )
}}

select
    produto_id,
    nome_produto,
    status_produto,
    quantidade_estoque,
    preco_atual,
    categoria_id,
    marca,
    dt_cadastro
from {{ ref('stg_produto') }}

{% endsnapshot %}
