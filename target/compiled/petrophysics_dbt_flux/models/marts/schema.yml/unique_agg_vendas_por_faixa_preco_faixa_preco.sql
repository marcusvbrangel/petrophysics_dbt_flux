
    
    

select
    faixa_preco as unique_field,
    count(*) as n_records

from "dev"."main"."agg_vendas_por_faixa_preco"
where faixa_preco is not null
group by faixa_preco
having count(*) > 1


