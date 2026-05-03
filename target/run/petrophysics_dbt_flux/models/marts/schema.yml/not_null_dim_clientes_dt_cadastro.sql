
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select dt_cadastro
from "dev"."main"."dim_clientes"
where dt_cadastro is null



  
  
      
    ) dbt_internal_test