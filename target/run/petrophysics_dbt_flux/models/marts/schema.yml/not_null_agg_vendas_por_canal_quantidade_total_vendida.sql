
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select quantidade_total_vendida
from "dev"."main"."agg_vendas_por_canal"
where quantidade_total_vendida is null



  
  
      
    ) dbt_internal_test