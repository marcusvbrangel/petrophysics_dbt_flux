
    
    

select
    endereco_id as unique_field,
    count(*) as n_records

from "dev"."main"."int_clientes_com_endereco"
where endereco_id is not null
group by endereco_id
having count(*) > 1


