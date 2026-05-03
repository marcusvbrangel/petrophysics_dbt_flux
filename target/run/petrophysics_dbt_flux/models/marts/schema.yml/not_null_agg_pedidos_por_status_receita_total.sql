
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select receita_total
from "dev"."main"."agg_pedidos_por_status"
where receita_total is null



  
  
      
    ) dbt_internal_test