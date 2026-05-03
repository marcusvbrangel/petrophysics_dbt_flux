
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select uf_entrega
from "dev"."main"."stg_pedidos"
where uf_entrega is null



  
  
      
    ) dbt_internal_test