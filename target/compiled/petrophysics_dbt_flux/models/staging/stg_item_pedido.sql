with source as (
    select *
    from "dev"."main"."item_pedido"
),

renamed as (
    select
        pedido_id,
        item_seq,
        codigo_produto as produto_id,
        "Qtde" as quantidade_raw,
        "Preco Unit." as preco_unitario_raw,
        "Desc Item" as valor_desconto_item_raw,
        "Subtotal Item" as subtotal_item_raw
    from source
),

standardized as (
    select
        pedido_id,
        item_seq,
        produto_id,
        cast(quantidade_raw as integer) as quantidade,
        cast(preco_unitario_raw as decimal(18,2)) as preco_unitario,
        cast(valor_desconto_item_raw as decimal(18,2)) as valor_desconto_item,
        cast(subtotal_item_raw as decimal(18,2)) as subtotal_item
    from renamed
),

enriched as (
    select
        pedido_id,
        item_seq,
        produto_id,
        quantidade,
        preco_unitario,
        valor_desconto_item,
        subtotal_item,
        cast(quantidade * preco_unitario as decimal(18,2)) as valor_bruto_item
    from standardized
)

select
    pedido_id,
    item_seq,
    produto_id,
    quantidade,
    preco_unitario,
    valor_desconto_item,
    subtotal_item,
    valor_bruto_item
from enriched