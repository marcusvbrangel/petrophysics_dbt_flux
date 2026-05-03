
    
    

select
    nome_produto as unique_field,
    count(*) as n_records

from "dev"."main"."stg_produto"
where nome_produto is not null
group by nome_produto
having count(*) > 1


