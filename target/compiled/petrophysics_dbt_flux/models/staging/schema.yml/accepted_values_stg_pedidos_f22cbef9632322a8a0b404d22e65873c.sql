
    
    

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


