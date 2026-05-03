
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select score_medio_fidelidade
from "dev"."main"."agg_clientes_por_uf"
where score_medio_fidelidade is null



  
  
      
    ) dbt_internal_test