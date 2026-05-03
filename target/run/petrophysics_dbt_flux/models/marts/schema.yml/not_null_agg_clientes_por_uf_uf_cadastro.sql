
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select uf_cadastro
from "dev"."main"."agg_clientes_por_uf"
where uf_cadastro is null



  
  
      
    ) dbt_internal_test