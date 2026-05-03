
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        forma_pagamento as value_field,
        count(*) as n_records

    from "dev"."main"."stg_pedidos"
    group by forma_pagamento

)

select *
from all_values
where value_field not in (
    'boleto','cartao_credito','cartao_debito','pix'
)



  
  
      
    ) dbt_internal_test