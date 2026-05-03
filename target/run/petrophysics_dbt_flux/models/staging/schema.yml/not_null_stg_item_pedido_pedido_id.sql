
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select pedido_id
from "dev"."main"."stg_item_pedido"
where pedido_id is null



  
  
      
    ) dbt_internal_test