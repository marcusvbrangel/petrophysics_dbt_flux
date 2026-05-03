
    
    

select
    sigla_categoria as unique_field,
    count(*) as n_records

from "dev"."main"."stg_categoria"
where sigla_categoria is not null
group by sigla_categoria
having count(*) > 1


