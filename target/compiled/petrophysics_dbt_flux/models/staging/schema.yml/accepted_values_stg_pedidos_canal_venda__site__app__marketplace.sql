
    
    

with all_values as (

    select
        canal_venda as value_field,
        count(*) as n_records

    from "dev"."main"."stg_pedidos"
    group by canal_venda

)

select *
from all_values
where value_field not in (
    'site','app','marketplace'
)


