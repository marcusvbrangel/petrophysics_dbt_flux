
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select quantidade
from "dev"."main"."stg_item_pedido"
where quantidade is null



  
  
      
    ) dbt_internal_test