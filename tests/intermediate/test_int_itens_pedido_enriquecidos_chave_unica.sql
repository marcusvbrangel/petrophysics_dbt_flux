select
    pedido_id,
    item_seq,
    count(*) as quantidade_registros
from {{ ref('int_itens_pedido_enriquecidos') }}
group by 1, 2
having count(*) > 1
