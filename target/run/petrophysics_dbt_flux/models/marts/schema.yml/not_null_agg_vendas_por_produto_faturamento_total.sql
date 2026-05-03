
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select faturamento_total
from "dev"."main"."agg_vendas_por_produto"
where faturamento_total is null



  
  
      
    ) dbt_internal_test