
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select clientes_score_baixa
from "dev"."main"."agg_clientes_por_segmento"
where clientes_score_baixa is null



  
  
      
    ) dbt_internal_test