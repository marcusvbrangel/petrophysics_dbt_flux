
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select status_produto
from "dev"."main"."agg_vendas_por_produto"
where status_produto is null



  
  
      
    ) dbt_internal_test