select *
from "dev"."main"."int_pedidos_enriquecidos"
where quantidade_itens_distintos <= 0
   or quantidade_total_itens <= 0
   or valor_frete < 0
   or valor_desconto_pedido < 0
   or valor_bruto_itens < 0
   or valor_desconto_itens < 0
   or valor_liquido_itens < 0
   or valor_total_pedido < 0