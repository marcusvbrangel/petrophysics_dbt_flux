
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select quantidade_total_itens
from "dev"."main"."int_pedidos_enriquecidos"
where quantidade_total_itens is null



  
  
      
    ) dbt_internal_test