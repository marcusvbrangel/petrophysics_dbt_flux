
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select clientes_distintos
from "dev"."main"."agg_pedidos_por_status"
where clientes_distintos is null



  
  
      
    ) dbt_internal_test