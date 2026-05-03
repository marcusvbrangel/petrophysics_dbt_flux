
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select pedidos_totais
from "dev"."main"."agg_vendas_por_forma_pagamento"
where pedidos_totais is null



  
  
      
    ) dbt_internal_test