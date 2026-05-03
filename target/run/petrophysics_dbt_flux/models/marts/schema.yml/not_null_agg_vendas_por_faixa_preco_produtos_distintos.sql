
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select produtos_distintos
from "dev"."main"."agg_vendas_por_faixa_preco"
where produtos_distintos is null



  
  
      
    ) dbt_internal_test