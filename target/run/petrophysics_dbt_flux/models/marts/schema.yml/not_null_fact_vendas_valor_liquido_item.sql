
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select valor_liquido_item
from "dev"."main"."fact_vendas"
where valor_liquido_item is null



  
  
      
    ) dbt_internal_test