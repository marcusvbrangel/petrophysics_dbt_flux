
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select ticket_medio_mensal
from "dev"."main"."agg_vendas_mensal"
where ticket_medio_mensal is null



  
  
      
    ) dbt_internal_test