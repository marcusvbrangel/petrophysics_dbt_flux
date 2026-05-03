
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    uf_cadastro as unique_field,
    count(*) as n_records

from "dev"."main"."agg_clientes_por_uf"
where uf_cadastro is not null
group by uf_cadastro
having count(*) > 1



  
  
      
    ) dbt_internal_test