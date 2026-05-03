
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select ticket_medio_pedido
from "dev"."main"."agg_pedidos_por_status"
where ticket_medio_pedido is null



  
  
      
    ) dbt_internal_test