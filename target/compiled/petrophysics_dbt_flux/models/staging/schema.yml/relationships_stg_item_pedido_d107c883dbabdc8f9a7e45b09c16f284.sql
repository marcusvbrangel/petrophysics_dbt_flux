
    
    

with child as (
    select pedido_id as from_field
    from "dev"."main"."stg_item_pedido"
    where pedido_id is not null
),

parent as (
    select pedido_id as to_field
    from "dev"."main"."stg_pedidos"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


