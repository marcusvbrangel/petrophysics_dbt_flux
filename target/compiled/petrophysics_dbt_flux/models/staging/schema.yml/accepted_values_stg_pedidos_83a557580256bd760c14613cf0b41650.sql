
    
    

with all_values as (

    select
        status_pedido as value_field,
        count(*) as n_records

    from "dev"."main"."stg_pedidos"
    group by status_pedido

)

select *
from all_values
where value_field not in (
    'cancelado','concluido','em_separacao','em_transporte','entregue','faturado'
)


