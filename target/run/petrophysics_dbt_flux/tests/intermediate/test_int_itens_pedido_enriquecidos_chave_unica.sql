
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select
    pedido_id,
    item_seq,
    count(*) as quantidade_registros
from "dev"."main"."int_itens_pedido_enriquecidos"
group by 1, 2
having count(*) > 1
  
  
      
    ) dbt_internal_test