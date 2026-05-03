
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select valor_estoque_atual
from "dev"."main"."int_produtos_com_categoria"
where valor_estoque_atual is null



  
  
      
    ) dbt_internal_test