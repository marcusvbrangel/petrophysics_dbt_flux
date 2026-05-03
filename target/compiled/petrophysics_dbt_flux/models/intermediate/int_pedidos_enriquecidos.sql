with pedidos as (
    select *
    from "dev"."main"."stg_pedidos"
),

clientes as (
    select *
    from "dev"."main"."int_clientes_com_endereco"
),

itens as (
    select *
    from "dev"."main"."int_itens_pedido_enriquecidos"
),

itens_aggregated as (
    select
        pedido_id,
        count(*) as quantidade_itens_distintos,
        sum(quantidade) as quantidade_total_itens,
        cast(sum(valor_bruto_item) as decimal(18,2)) as valor_bruto_itens,
        cast(sum(valor_desconto_item) as decimal(18,2)) as valor_desconto_itens,
        cast(sum(subtotal_item) as decimal(18,2)) as valor_liquido_itens
    from itens
    group by pedido_id
),

joined as (
    select
        p.pedido_id,
        p.cliente_id,
        c.nome_cliente,
        c.email,
        c.status_cliente,
        c.segmento,
        c.canal_preferido,
        c.score_fidelidade,
        p.dt_pedido,
        p.status_pedido,
        p.forma_pagamento,
        p.canal_venda,
        p.cupom_codigo,
        p.uf_entrega,
        p.cidade_entrega,
        c.cep,
        c.logradouro,
        c.bairro,
        c.numero,
        c.complemento,
        p.valor_frete,
        p.valor_desconto_pedido,
        ia.quantidade_itens_distintos,
        ia.quantidade_total_itens,
        ia.valor_bruto_itens,
        ia.valor_desconto_itens,
        ia.valor_liquido_itens
    from pedidos p
    left join clientes c
        on p.cliente_id = c.cliente_id
    left join itens_aggregated ia
        on p.pedido_id = ia.pedido_id
),

enriched as (
    select
        pedido_id,
        cliente_id,
        nome_cliente,
        email,
        status_cliente,
        segmento,
        canal_preferido,
        score_fidelidade,
        dt_pedido,
        status_pedido,
        forma_pagamento,
        canal_venda,
        cupom_codigo,
        uf_entrega,
        cidade_entrega,
        cep,
        logradouro,
        bairro,
        numero,
        complemento,
        valor_frete,
        valor_desconto_pedido,
        quantidade_itens_distintos,
        quantidade_total_itens,
        valor_bruto_itens,
        valor_desconto_itens,
        valor_liquido_itens,
        cast(coalesce(valor_liquido_itens, 0) + valor_frete - valor_desconto_pedido as decimal(18,2)) as valor_total_pedido
    from joined
)

select
    pedido_id,
    cliente_id,
    nome_cliente,
    email,
    status_cliente,
    segmento,
    canal_preferido,
    score_fidelidade,
    dt_pedido,
    status_pedido,
    forma_pagamento,
    canal_venda,
    cupom_codigo,
    uf_entrega,
    cidade_entrega,
    cep,
    logradouro,
    bairro,
    numero,
    complemento,
    valor_frete,
    valor_desconto_pedido,
    quantidade_itens_distintos,
    quantidade_total_itens,
    valor_bruto_itens,
    valor_desconto_itens,
    valor_liquido_itens,
    valor_total_pedido
from enriched