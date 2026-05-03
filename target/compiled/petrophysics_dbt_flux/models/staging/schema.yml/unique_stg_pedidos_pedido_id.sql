
    
    

select
    pedido_id as unique_field,
    count(*) as n_records

from "dev"."main"."stg_pedidos"
where pedido_id is not null
group by pedido_id
having count(*) > 1


