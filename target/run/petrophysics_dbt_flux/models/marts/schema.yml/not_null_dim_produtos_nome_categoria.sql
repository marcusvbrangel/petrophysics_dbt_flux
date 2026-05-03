
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select nome_categoria
from "dev"."main"."dim_produtos"
where nome_categoria is null



  
  
      
    ) dbt_internal_test