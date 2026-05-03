
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select quantidade_estoque
from "dev"."main"."stg_produto"
where quantidade_estoque is null



  
  
      
    ) dbt_internal_test