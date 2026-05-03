
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    canal_venda as unique_field,
    count(*) as n_records

from "dev"."main"."agg_vendas_por_canal"
where canal_venda is not null
group by canal_venda
having count(*) > 1



  
  
      
    ) dbt_internal_test