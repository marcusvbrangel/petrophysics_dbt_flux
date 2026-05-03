
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select uf
from "dev"."main"."int_clientes_com_endereco"
where uf is null



  
  
      
    ) dbt_internal_test