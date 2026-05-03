
    
    

select
    uf_cadastro as unique_field,
    count(*) as n_records

from "dev"."main"."agg_clientes_por_uf"
where uf_cadastro is not null
group by uf_cadastro
having count(*) > 1


