
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select clientes_com_compra
from "dev"."main"."agg_vendas_mensal"
where clientes_com_compra is null



  
  
      
    ) dbt_internal_test