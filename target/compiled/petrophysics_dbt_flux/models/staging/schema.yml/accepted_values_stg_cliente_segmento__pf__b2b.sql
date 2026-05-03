
    
    

with all_values as (

    select
        segmento as value_field,
        count(*) as n_records

    from "dev"."main"."stg_cliente"
    group by segmento

)

select *
from all_values
where value_field not in (
    'pf','b2b'
)


