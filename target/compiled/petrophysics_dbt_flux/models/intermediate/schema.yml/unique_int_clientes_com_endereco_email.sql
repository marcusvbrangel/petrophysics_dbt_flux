
    
    

select
    email as unique_field,
    count(*) as n_records

from "dev"."main"."int_clientes_com_endereco"
where email is not null
group by email
having count(*) > 1


