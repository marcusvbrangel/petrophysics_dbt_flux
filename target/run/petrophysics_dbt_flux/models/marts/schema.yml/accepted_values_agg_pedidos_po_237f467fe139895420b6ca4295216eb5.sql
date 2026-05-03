
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        status_pedido as value_field,
        count(*) as n_records

    from "dev"."main"."agg_pedidos_por_status"
    group by status_pedido

)

select *
from all_values
where value_field not in (
    'cancelado','concluido','em_separacao','em_transporte','entregue','faturado'
)



  
  
      
    ) dbt_internal_test