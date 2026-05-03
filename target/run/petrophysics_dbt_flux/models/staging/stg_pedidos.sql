
  
  create view "dev"."main"."stg_pedidos__dbt_tmp" as (
    with source as (
    select *
    from "dev"."main"."pedidos"
),

renamed as (
    select
        pedido_id,
        cliente_id,
        trim("DtPedido") as dt_pedido_raw,
        trim("Status Pedido") as status_pedido_raw,
        trim("Forma Pgto") as forma_pagamento_raw,
        vl_frete as valor_frete_raw,
        vl_desconto_pedido as valor_desconto_pedido_raw,
        trim(cupom_codigo) as cupom_codigo_raw,
        trim("Canal Venda") as canal_venda_raw,
        trim(uf_entrega) as uf_entrega_raw,
        trim("CidadeEntrega") as cidade_entrega_raw
    from source
),

standardized as (
    select
        pedido_id,
        cliente_id,
        coalesce(
            try_strptime(dt_pedido_raw, '%Y-%m-%d %H:%M:%S'),
            try_strptime(dt_pedido_raw, '%Y-%m-%d'),
            try_strptime(dt_pedido_raw, '%d/%m/%Y'),
            try_strptime(dt_pedido_raw, '%Y/%m/%d')
        ) as dt_pedido,
        case
            when lower(status_pedido_raw) = 'concluido' then 'concluido'
            when lower(status_pedido_raw) = 'cancelado' then 'cancelado'
            when lower(status_pedido_raw) = 'entregue' then 'entregue'
            when lower(status_pedido_raw) = 'faturado' then 'faturado'
            when lower(status_pedido_raw) = 'em transporte' then 'em_transporte'
            when lower(status_pedido_raw) = 'em separacao' then 'em_separacao'
            else regexp_replace(lower(status_pedido_raw), '\s+', '_', 'g')
        end as status_pedido,
        case
            when lower(forma_pagamento_raw) = 'pix' then 'pix'
            when lower(forma_pagamento_raw) = 'boleto' then 'boleto'
            when lower(forma_pagamento_raw) in ('cartao_credito', 'cartao de credito') then 'cartao_credito'
            when lower(forma_pagamento_raw) = 'cartao_debito' then 'cartao_debito'
            else regexp_replace(lower(forma_pagamento_raw), '\s+', '_', 'g')
        end as forma_pagamento,
        cast(valor_frete_raw as decimal(18,2)) as valor_frete,
        cast(valor_desconto_pedido_raw as decimal(18,2)) as valor_desconto_pedido,
        nullif(upper(cupom_codigo_raw), '') as cupom_codigo,
        lower(canal_venda_raw) as canal_venda,
        upper(uf_entrega_raw) as uf_entrega,
        nullif(lower(regexp_replace(cidade_entrega_raw, '\s+', ' ', 'g')), '') as cidade_entrega
    from renamed
)

select
    pedido_id,
    cliente_id,
    dt_pedido,
    status_pedido,
    forma_pagamento,
    valor_frete,
    valor_desconto_pedido,
    cupom_codigo,
    canal_venda,
    uf_entrega,
    cidade_entrega
from standardized
  );
