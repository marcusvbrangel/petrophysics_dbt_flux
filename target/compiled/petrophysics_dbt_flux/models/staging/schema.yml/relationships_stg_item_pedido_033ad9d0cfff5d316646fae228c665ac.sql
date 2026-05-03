
    
    

with child as (
    select produto_id as from_field
    from "dev"."main"."stg_item_pedido"
    where produto_id is not null
),

parent as (
    select produto_id as to_field
    from "dev"."main"."stg_produto"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


