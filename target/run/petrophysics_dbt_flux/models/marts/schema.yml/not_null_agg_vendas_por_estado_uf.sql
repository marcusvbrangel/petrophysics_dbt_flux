
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select uf
from "dev"."main"."agg_vendas_por_estado"
where uf is null



  
  
      
    ) dbt_internal_test