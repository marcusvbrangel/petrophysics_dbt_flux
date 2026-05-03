
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select status_pedido
from "dev"."main"."agg_pedidos_por_status"
where status_pedido is null



  
  
      
    ) dbt_internal_test