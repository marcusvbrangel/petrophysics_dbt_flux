
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select preco_unitario
from "dev"."main"."stg_item_pedido"
where preco_unitario is null



  
  
      
    ) dbt_internal_test