
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select percentual_cancelamento
from "dev"."main"."agg_vendas_por_canal"
where percentual_cancelamento is null



  
  
      
    ) dbt_internal_test