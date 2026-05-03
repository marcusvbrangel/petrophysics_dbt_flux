
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select forma_pagamento
from "dev"."main"."agg_vendas_por_forma_pagamento"
where forma_pagamento is null



  
  
      
    ) dbt_internal_test