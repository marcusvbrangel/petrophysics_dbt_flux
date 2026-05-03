
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select ranking_faturamento
from "dev"."main"."agg_vendas_por_faixa_preco"
where ranking_faturamento is null



  
  
      
    ) dbt_internal_test