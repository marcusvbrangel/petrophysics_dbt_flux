
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select faixa_score_fidelidade
from "dev"."main"."dim_clientes"
where faixa_score_fidelidade is null



  
  
      
    ) dbt_internal_test