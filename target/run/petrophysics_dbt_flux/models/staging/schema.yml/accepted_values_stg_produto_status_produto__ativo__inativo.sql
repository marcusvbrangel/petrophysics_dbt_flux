
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        status_produto as value_field,
        count(*) as n_records

    from "dev"."main"."stg_produto"
    group by status_produto

)

select *
from all_values
where value_field not in (
    'ativo','inativo'
)



  
  
      
    ) dbt_internal_test