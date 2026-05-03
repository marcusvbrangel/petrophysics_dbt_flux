
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select *
from "dev"."main"."stg_produto"
where quantidade_estoque < 0
   or preco_atual < 0
  
  
      
    ) dbt_internal_test