select *
from "dev"."main"."fact_vendas"
where is_pedido_cancelado
  and (
    quantidade_vendida <> 0
    or receita_liquida_item <> 0
  )