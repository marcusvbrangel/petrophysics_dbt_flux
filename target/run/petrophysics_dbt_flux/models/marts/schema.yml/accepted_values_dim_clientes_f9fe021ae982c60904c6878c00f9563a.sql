
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

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



  
  
      
    ) dbt_internal_test