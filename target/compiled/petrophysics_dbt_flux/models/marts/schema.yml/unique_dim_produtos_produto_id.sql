
    
    

select
    produto_id as unique_field,
    count(*) as n_records

from "dev"."main"."dim_produtos"
where produto_id is not null
group by produto_id
having count(*) > 1


