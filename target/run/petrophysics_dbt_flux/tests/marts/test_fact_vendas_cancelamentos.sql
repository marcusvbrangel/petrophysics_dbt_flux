
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select *
from "dev"."main"."fact_vendas"
where is_pedido_cancelado
  and (
    quantidade_vendida <> 0
    or receita_liquida_item <> 0
  )
  
  
      
    ) dbt_internal_test