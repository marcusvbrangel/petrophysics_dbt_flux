
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select pedidos_com_categoria
from "dev"."main"."agg_vendas_por_categoria"
where pedidos_com_categoria is null



  
  
      
    ) dbt_internal_test