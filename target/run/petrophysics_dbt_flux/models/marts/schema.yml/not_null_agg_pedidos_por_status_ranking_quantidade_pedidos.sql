
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select ranking_quantidade_pedidos
from "dev"."main"."agg_pedidos_por_status"
where ranking_quantidade_pedidos is null



  
  
      
    ) dbt_internal_test