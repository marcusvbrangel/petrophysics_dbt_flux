
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select nome_cliente
from "dev"."main"."int_pedidos_enriquecidos"
where nome_cliente is null



  
  
      
    ) dbt_internal_test