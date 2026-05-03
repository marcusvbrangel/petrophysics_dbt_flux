
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select item_seq
from "dev"."main"."int_itens_pedido_enriquecidos"
where item_seq is null



  
  
      
    ) dbt_internal_test