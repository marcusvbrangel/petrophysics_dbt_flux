
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select cliente_id
from "dev"."main"."int_pedidos_enriquecidos"
where cliente_id is null



  
  
      
    ) dbt_internal_test