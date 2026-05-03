
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select produto_id
from "dev"."main"."int_produtos_com_categoria"
where produto_id is null



  
  
      
    ) dbt_internal_test