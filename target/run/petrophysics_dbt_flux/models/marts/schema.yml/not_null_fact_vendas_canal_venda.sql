
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select canal_venda
from "dev"."main"."fact_vendas"
where canal_venda is null



  
  
      
    ) dbt_internal_test