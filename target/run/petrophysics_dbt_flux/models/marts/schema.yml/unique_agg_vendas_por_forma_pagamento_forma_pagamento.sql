
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    forma_pagamento as unique_field,
    count(*) as n_records

from "dev"."main"."agg_vendas_por_forma_pagamento"
where forma_pagamento is not null
group by forma_pagamento
having count(*) > 1



  
  
      
    ) dbt_internal_test