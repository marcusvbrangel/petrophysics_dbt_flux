
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    status_pedido as unique_field,
    count(*) as n_records

from "dev"."main"."agg_pedidos_por_status"
where status_pedido is not null
group by status_pedido
having count(*) > 1



  
  
      
    ) dbt_internal_test