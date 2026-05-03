
  
  create view "dev"."main"."int_itens_pedido_enriquecidos__dbt_tmp" as (
    with itens as (
    select *
    from "dev"."main"."stg_item_pedido"
),

pedidos as (
    select *
    from "dev"."main"."stg_pedidos"
),

produtos as (
    select *
    from "dev"."main"."int_produtos_com_categoria"
),

joined as (
    select
        i.pedido_id,
        i.item_seq,
        p.cliente_id,
        p.dt_pedido,
        p.status_pedido,
        p.forma_pagamento,
        p.canal_venda,
        p.uf_entrega,
        p.cidade_entrega,
        p.cupom_codigo,
        i.produto_id,
        pr.nome_produto,
        pr.status_produto,
        pr.categoria_id,
        pr.sigla_categoria,
        pr.nome_categoria,
        pr.marca,
        i.quantidade,
        i.preco_unitario,
        i.valor_bruto_item,
        i.valor_desconto_item,
        i.subtotal_item
    from itens i
    left join pedidos p
        on i.pedido_id = p.pedido_id
    left join produtos pr
        on i.produto_id = pr.produto_id
),

enriched as (
    select
        pedido_id,
        item_seq,
        cliente_id,
        dt_pedido,
        status_pedido,
        forma_pagamento,
        canal_venda,
        uf_entrega,
        cidade_entrega,
        cupom_codigo,
        produto_id,
        nome_produto,
        status_produto,
        categoria_id,
        sigla_categoria,
        nome_categoria,
        marca,
        quantidade,
        preco_unitario,
        valor_bruto_item,
        valor_desconto_item,
        subtotal_item,
        cast(subtotal_item / nullif(quantidade, 0) as decimal(18,2)) as preco_unitario_liquido
    from joined
)

select
    pedido_id,
    item_seq,
    cliente_id,
    dt_pedido,
    status_pedido,
    forma_pagamento,
    canal_venda,
    uf_entrega,
    cidade_entrega,
    cupom_codigo,
    produto_id,
    nome_produto,
    status_produto,
    categoria_id,
    sigla_categoria,
    nome_categoria,
    marca,
    quantidade,
    preco_unitario,
    valor_bruto_item,
    valor_desconto_item,
    subtotal_item,
    preco_unitario_liquido
from enriched
  );
