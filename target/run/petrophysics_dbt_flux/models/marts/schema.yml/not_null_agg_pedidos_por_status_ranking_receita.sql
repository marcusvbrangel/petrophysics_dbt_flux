
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select ranking_receita
from "dev"."main"."agg_pedidos_por_status"
where ranking_receita is null



  
  
      
    ) dbt_internal_test