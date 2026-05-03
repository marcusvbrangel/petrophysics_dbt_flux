
    
    

select
    nome_categoria as unique_field,
    count(*) as n_records

from "dev"."main"."stg_categoria"
where nome_categoria is not null
group by nome_categoria
having count(*) > 1


