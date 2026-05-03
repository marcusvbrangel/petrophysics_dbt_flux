
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select situacao_estoque
from "dev"."main"."dim_produtos"
where situacao_estoque is null



  
  
      
    ) dbt_internal_test