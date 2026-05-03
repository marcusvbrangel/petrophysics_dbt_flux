
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select ticket_medio_pedido
from "dev"."main"."agg_vendas_por_produto"
where ticket_medio_pedido is null



  
  
      
    ) dbt_internal_test