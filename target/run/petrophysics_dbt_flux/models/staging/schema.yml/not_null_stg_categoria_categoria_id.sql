
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select categoria_id
from "dev"."main"."stg_categoria"
where categoria_id is null



  
  
      
    ) dbt_internal_test