
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select cep
from "dev"."main"."stg_endereco"
where cep is null



  
  
      
    ) dbt_internal_test