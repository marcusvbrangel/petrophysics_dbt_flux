
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select subtotal_item
from "dev"."main"."int_itens_pedido_enriquecidos"
where subtotal_item is null



  
  
      
    ) dbt_internal_test