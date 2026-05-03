
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select canal_venda
from "dev"."main"."agg_vendas_por_canal"
where canal_venda is null



  
  
      
    ) dbt_internal_test