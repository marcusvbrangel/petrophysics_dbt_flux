
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select receita_liquida_item
from "dev"."main"."fact_vendas"
where receita_liquida_item is null



  
  
      
    ) dbt_internal_test