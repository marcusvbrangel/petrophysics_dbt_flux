
    
    

select
    produto_id as unique_field,
    count(*) as n_records

from "dev"."main"."agg_vendas_por_produto"
where produto_id is not null
group by produto_id
having count(*) > 1


