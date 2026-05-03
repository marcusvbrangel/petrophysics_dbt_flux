
    
    

with all_values as (

    select
        faixa_score_fidelidade as value_field,
        count(*) as n_records

    from "dev"."main"."dim_clientes"
    group by faixa_score_fidelidade

)

select *
from all_values
where value_field not in (
    'alta','media','baixa'
)


