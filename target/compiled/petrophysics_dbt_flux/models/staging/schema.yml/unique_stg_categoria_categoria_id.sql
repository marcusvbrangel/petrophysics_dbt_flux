
    
    

select
    categoria_id as unique_field,
    count(*) as n_records

from "dev"."main"."stg_categoria"
where categoria_id is not null
group by categoria_id
having count(*) > 1


