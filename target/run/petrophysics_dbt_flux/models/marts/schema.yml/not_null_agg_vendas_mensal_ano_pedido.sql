
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select ano_pedido
from "dev"."main"."agg_vendas_mensal"
where ano_pedido is null



  
  
      
    ) dbt_internal_test