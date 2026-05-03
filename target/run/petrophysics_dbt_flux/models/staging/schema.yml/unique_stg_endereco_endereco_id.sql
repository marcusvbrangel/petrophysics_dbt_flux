
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    endereco_id as unique_field,
    count(*) as n_records

from "dev"."main"."stg_endereco"
where endereco_id is not null
group by endereco_id
having count(*) > 1



  
  
      
    ) dbt_internal_test