
    
    

with all_values as (

    select
        uf as value_field,
        count(*) as n_records

    from "dev"."main"."agg_vendas_por_estado"
    group by uf

)

select *
from all_values
where value_field not in (
    'SP','RJ','MG','PR','RS','BA','PE','SC','GO','CE'
)


