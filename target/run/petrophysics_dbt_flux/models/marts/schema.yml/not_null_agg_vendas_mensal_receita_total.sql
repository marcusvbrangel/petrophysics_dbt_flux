
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select receita_total
from "dev"."main"."agg_vendas_mensal"
where receita_total is null



  
  
      
    ) dbt_internal_test