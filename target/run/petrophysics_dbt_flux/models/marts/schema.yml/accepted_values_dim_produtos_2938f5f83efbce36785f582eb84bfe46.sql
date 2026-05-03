
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        situacao_estoque as value_field,
        count(*) as n_records

    from "dev"."main"."dim_produtos"
    group by situacao_estoque

)

select *
from all_values
where value_field not in (
    'sem_estoque','baixo_estoque','estoque_medio','estoque_alto'
)



  
  
      
    ) dbt_internal_test