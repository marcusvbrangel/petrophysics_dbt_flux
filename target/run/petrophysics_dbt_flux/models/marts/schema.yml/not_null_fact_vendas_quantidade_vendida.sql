
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select quantidade_vendida
from "dev"."main"."fact_vendas"
where quantidade_vendida is null



  
  
      
    ) dbt_internal_test