
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    segmento as unique_field,
    count(*) as n_records

from "dev"."main"."agg_clientes_por_segmento"
where segmento is not null
group by segmento
having count(*) > 1



  
  
      
    ) dbt_internal_test