
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select segmento
from "dev"."main"."agg_clientes_por_segmento"
where segmento is null



  
  
      
    ) dbt_internal_test