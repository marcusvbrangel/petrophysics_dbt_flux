
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    mes_pedido as unique_field,
    count(*) as n_records

from "dev"."main"."agg_vendas_mensal"
where mes_pedido is not null
group by mes_pedido
having count(*) > 1



  
  
      
    ) dbt_internal_test