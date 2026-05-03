
    
    

with all_values as (

    select
        canal_preferido as value_field,
        count(*) as n_records

    from "dev"."main"."dim_clientes"
    group by canal_preferido

)

select *
from all_values
where value_field not in (
    'site','app','marketplace'
)


