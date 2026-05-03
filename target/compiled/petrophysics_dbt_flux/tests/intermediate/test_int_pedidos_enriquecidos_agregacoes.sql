with itens as (
    select
        pedido_id,
        count(*) as quantidade_itens_distintos_esperada,
        sum(quantidade) as quantidade_total_itens_esperada,
        cast(sum(valor_bruto_item) as decimal(18,2)) as valor_bruto_itens_esperado,
        cast(sum(valor_desconto_item) as decimal(18,2)) as valor_desconto_itens_esperado,
        cast(sum(subtotal_item) as decimal(18,2)) as valor_liquido_itens_esperado
    from "dev"."main"."int_itens_pedido_enriquecidos"
    group by pedido_id
),

pedidos as (
    select *
    from "dev"."main"."int_pedidos_enriquecidos"
)

select
    p.pedido_id,
    p.quantidade_itens_distintos,
    i.quantidade_itens_distintos_esperada,
    p.quantidade_total_itens,
    i.quantidade_total_itens_esperada,
    p.valor_bruto_itens,
    i.valor_bruto_itens_esperado,
    p.valor_desconto_itens,
    i.valor_desconto_itens_esperado,
    p.valor_liquido_itens,
    i.valor_liquido_itens_esperado
from pedidos p
join itens i
    on p.pedido_id = i.pedido_id
where p.quantidade_itens_distintos <> i.quantidade_itens_distintos_esperada
   or p.quantidade_total_itens <> i.quantidade_total_itens_esperada
   or p.valor_bruto_itens <> i.valor_bruto_itens_esperado
   or p.valor_desconto_itens <> i.valor_desconto_itens_esperado
   or p.valor_liquido_itens <> i.valor_liquido_itens_esperado