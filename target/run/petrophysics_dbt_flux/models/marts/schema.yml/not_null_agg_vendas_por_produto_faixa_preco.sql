
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select faixa_preco
from "dev"."main"."agg_vendas_por_produto"
where faixa_preco is null



  
  
      
    ) dbt_internal_test