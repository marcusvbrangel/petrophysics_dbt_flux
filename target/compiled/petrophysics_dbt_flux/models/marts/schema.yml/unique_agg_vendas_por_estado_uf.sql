
    
    

select
    uf as unique_field,
    count(*) as n_records

from "dev"."main"."agg_vendas_por_estado"
where uf is not null
group by uf
having count(*) > 1


