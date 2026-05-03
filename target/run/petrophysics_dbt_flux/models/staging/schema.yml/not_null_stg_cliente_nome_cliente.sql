
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select nome_cliente
from "dev"."main"."stg_cliente"
where nome_cliente is null



  
  
      
    ) dbt_internal_test