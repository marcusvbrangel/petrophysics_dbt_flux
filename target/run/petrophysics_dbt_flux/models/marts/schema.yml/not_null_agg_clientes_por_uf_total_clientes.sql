
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select total_clientes
from "dev"."main"."agg_clientes_por_uf"
where total_clientes is null



  
  
      
    ) dbt_internal_test