
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select clientes_ativos
from "dev"."main"."agg_clientes_por_uf"
where clientes_ativos is null



  
  
      
    ) dbt_internal_test