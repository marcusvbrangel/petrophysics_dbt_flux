
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        faixa_preco as value_field,
        count(*) as n_records

    from "dev"."main"."agg_vendas_por_produto"
    group by faixa_preco

)

select *
from all_values
where value_field not in (
    'ate_99','100_a_299','300_a_599','600_ou_mais'
)



  
  
      
    ) dbt_internal_test