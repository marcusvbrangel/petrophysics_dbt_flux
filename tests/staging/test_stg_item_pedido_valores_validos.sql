select *
from {{ ref('stg_item_pedido') }}
where quantidade <= 0
   or preco_unitario < 0
   or valor_desconto_item < 0
   or subtotal_item < 0
   or valor_bruto_item < 0
   or valor_desconto_item > valor_bruto_item
   or subtotal_item > valor_bruto_item
