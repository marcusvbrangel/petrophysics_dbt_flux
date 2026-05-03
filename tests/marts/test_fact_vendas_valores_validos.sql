select *
from {{ ref('fact_vendas') }}
where quantidade < 0
   or quantidade_vendida < 0
   or quantidade_vendida > quantidade
   or preco_unitario < 0
   or preco_unitario_liquido < 0
   or valor_bruto_item < 0
   or valor_desconto_item < 0
   or valor_liquido_item < 0
   or receita_liquida_item < 0
   or valor_desconto_item > valor_bruto_item
   or valor_liquido_item > valor_bruto_item
