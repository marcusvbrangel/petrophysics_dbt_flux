
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select *
from "dev"."main"."stg_item_pedido"
where quantidade <= 0
   or preco_unitario < 0
   or valor_desconto_item < 0
   or subtotal_item < 0
   or valor_bruto_item < 0
   or valor_desconto_item > valor_bruto_item
   or subtotal_item > valor_bruto_item
  
  
      
    ) dbt_internal_test