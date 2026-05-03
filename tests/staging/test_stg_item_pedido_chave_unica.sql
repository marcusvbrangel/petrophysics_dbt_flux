select
    pedido_id,
    item_seq,
    count(*) as quantidade_registros
from {{ ref('stg_item_pedido') }}
group by 1, 2
having count(*) > 1
