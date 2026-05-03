select *
from {{ ref('stg_produto') }}
where quantidade_estoque < 0
   or preco_atual < 0
