
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select dt_pedido
from "dev"."main"."fact_vendas"
where dt_pedido is null



  
  
      
    ) dbt_internal_test