
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select valor_total_pedido
from "dev"."main"."int_pedidos_enriquecidos"
where valor_total_pedido is null



  
  
      
    ) dbt_internal_test