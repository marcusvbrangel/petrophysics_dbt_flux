
  
  create view "dev"."main"."fact_vendas__dbt_tmp" as (
    

with itens as (
    select *
    from "dev"."main"."int_itens_pedido_enriquecidos"
),

clientes as (
    select *
    from "dev"."main"."dim_clientes"
),

produtos as (
    select *
    from "dev"."main"."dim_produtos"
),

joined as (
    select
        cast(i.pedido_id as varchar) || '-' || cast(i.item_seq as varchar) as pedido_item_id,
        i.pedido_id,
        i.item_seq,
        i.dt_pedido,
        cast(i.dt_pedido as date) as data_pedido,
        date_trunc('month', i.dt_pedido)::date as mes_pedido,
        extract(year from i.dt_pedido) as ano_pedido,
        extract(month from i.dt_pedido) as mes_numero_pedido,
        i.status_pedido,
        i.status_pedido = 'cancelado' as is_pedido_cancelado,
        i.forma_pagamento,
        i.canal_venda,
        i.cupom_codigo,
        i.cliente_id,
        c.nome_cliente,
        c.status_cliente,
        c.segmento as segmento_cliente,
        c.faixa_score_fidelidade,
        c.uf_cadastro,
        c.cidade_cadastro,
        i.uf_entrega,
        i.cidade_entrega,
        i.produto_id,
        p.nome_produto,
        p.status_produto,
        p.marca,
        p.categoria_id,
        p.sigla_categoria,
        p.nome_categoria,
        i.quantidade,
        i.preco_unitario,
        i.preco_unitario_liquido,
        i.valor_bruto_item,
        i.valor_desconto_item,
        i.subtotal_item as valor_liquido_item
    from itens i
    left join clientes c
        on i.cliente_id = c.cliente_id
    left join produtos p
        on i.produto_id = p.produto_id
),

enriched as (
    select
        pedido_item_id,
        pedido_id,
        item_seq,
        dt_pedido,
        data_pedido,
        mes_pedido,
        ano_pedido,
        mes_numero_pedido,
        status_pedido,
        is_pedido_cancelado,
        forma_pagamento,
        canal_venda,
        cupom_codigo,
        cliente_id,
        nome_cliente,
        status_cliente,
        segmento_cliente,
        faixa_score_fidelidade,
        uf_cadastro,
        cidade_cadastro,
        uf_entrega,
        cidade_entrega,
        produto_id,
        nome_produto,
        status_produto,
        marca,
        categoria_id,
        sigla_categoria,
        nome_categoria,
        quantidade,
        case
            when is_pedido_cancelado then 0
            else quantidade
        end as quantidade_vendida,
        preco_unitario,
        preco_unitario_liquido,
        valor_bruto_item,
        valor_desconto_item,
        valor_liquido_item,
        case
            when is_pedido_cancelado then 0
            else valor_liquido_item
        end as receita_liquida_item
    from joined
)

select
    pedido_item_id,
    pedido_id,
    item_seq,
    dt_pedido,
    data_pedido,
    mes_pedido,
    ano_pedido,
    mes_numero_pedido,
    status_pedido,
    is_pedido_cancelado,
    forma_pagamento,
    canal_venda,
    cupom_codigo,
    cliente_id,
    nome_cliente,
    status_cliente,
    segmento_cliente,
    faixa_score_fidelidade,
    uf_cadastro,
    cidade_cadastro,
    uf_entrega,
    cidade_entrega,
    produto_id,
    nome_produto,
    status_produto,
    marca,
    categoria_id,
    sigla_categoria,
    nome_categoria,
    quantidade,
    quantidade_vendida,
    preco_unitario,
    preco_unitario_liquido,
    valor_bruto_item,
    valor_desconto_item,
    valor_liquido_item,
    receita_liquida_item
from enriched
  );
