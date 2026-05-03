
    
    

select
    segmento as unique_field,
    count(*) as n_records

from "dev"."main"."agg_clientes_por_segmento"
where segmento is not null
group by segmento
having count(*) > 1


