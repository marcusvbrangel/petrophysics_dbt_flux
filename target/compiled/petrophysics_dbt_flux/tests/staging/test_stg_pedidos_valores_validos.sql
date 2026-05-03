select *
from "dev"."main"."stg_pedidos"
where valor_frete < 0
   or valor_desconto_pedido < 0