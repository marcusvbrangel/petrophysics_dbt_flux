
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select pedidos_faturados
from "dev"."main"."agg_vendas_mensal"
where pedidos_faturados is null



  
  
      
    ) dbt_internal_test