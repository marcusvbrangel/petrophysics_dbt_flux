
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select pedidos_com_venda
from "dev"."main"."agg_vendas_por_faixa_preco"
where pedidos_com_venda is null



  
  
      
    ) dbt_internal_test