
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select preco_atual
from "dev"."main"."stg_produto"
where preco_atual is null



  
  
      
    ) dbt_internal_test