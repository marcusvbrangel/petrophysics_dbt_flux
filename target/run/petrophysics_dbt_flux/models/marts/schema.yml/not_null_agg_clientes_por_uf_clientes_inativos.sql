
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select clientes_inativos
from "dev"."main"."agg_clientes_por_uf"
where clientes_inativos is null



  
  
      
    ) dbt_internal_test