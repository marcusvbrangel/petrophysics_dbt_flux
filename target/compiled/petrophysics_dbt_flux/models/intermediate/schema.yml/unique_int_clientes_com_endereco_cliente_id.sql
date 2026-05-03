
    
    

select
    cliente_id as unique_field,
    count(*) as n_records

from "dev"."main"."int_clientes_com_endereco"
where cliente_id is not null
group by cliente_id
having count(*) > 1


