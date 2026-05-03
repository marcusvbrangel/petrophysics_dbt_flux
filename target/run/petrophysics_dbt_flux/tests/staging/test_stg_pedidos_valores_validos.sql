
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select *
from "dev"."main"."stg_pedidos"
where valor_frete < 0
   or valor_desconto_pedido < 0
  
  
      
    ) dbt_internal_test