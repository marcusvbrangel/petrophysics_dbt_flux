
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select valor_desconto_item
from "dev"."main"."stg_item_pedido"
where valor_desconto_item is null



  
  
      
    ) dbt_internal_test