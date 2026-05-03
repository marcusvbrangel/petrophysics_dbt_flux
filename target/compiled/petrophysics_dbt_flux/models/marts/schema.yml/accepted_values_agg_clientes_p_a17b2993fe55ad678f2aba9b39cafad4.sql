
    
    

with all_values as (

    select
        uf_cadastro as value_field,
        count(*) as n_records

    from "dev"."main"."agg_clientes_por_uf"
    group by uf_cadastro

)

select *
from all_values
where value_field not in (
    'SP','RJ','MG','PR','RS','BA','PE','SC','GO','CE'
)


