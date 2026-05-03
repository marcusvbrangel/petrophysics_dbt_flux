
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select quantidade
from "dev"."main"."fact_vendas"
where quantidade is null



  
  
      
    ) dbt_internal_test