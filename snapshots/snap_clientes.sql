{% snapshot snap_clientes %}

{{
    config(
        target_schema='snapshots',
        unique_key='cliente_id',
        strategy='check',
        check_cols=[
            'nome_cliente',
            'email',
            'dt_cadastro',
            'status_cliente',
            'segmento',
            'canal_preferido',
            'score_fidelidade'
        ],
        hard_deletes='invalidate'
    )
}}

select
    cliente_id,
    nome_cliente,
    email,
    dt_cadastro,
    status_cliente,
    segmento,
    canal_preferido,
    score_fidelidade
from {{ ref('stg_cliente') }}

{% endsnapshot %}
