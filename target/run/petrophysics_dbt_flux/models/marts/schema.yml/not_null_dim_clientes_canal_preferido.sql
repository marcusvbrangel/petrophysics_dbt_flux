
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select canal_preferido
from "dev"."main"."dim_clientes"
where canal_preferido is null



  
  
      
    ) dbt_internal_test