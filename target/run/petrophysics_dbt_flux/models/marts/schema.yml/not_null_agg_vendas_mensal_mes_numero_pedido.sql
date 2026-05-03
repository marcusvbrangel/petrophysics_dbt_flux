
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select mes_numero_pedido
from "dev"."main"."agg_vendas_mensal"
where mes_numero_pedido is null



  
  
      
    ) dbt_internal_test