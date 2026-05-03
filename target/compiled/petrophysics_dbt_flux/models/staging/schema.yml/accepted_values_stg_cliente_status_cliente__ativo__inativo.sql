
    
    

with all_values as (

    select
        status_cliente as value_field,
        count(*) as n_records

    from "dev"."main"."stg_cliente"
    group by status_cliente

)

select *
from all_values
where value_field not in (
    'ativo','inativo'
)


