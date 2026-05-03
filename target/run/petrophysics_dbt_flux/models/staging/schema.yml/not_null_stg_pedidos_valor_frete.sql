
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select valor_frete
from "dev"."main"."stg_pedidos"
where valor_frete is null



  
  
      
    ) dbt_internal_test