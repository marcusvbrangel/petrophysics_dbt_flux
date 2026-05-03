
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select valor_desconto_pedido
from "dev"."main"."stg_pedidos"
where valor_desconto_pedido is null



  
  
      
    ) dbt_internal_test