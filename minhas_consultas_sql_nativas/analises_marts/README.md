# Analises SQL Sobre os Marts

Estas consultas usam a camada final do projeto:

- `fact_vendas`
- `dim_clientes`
- `dim_produtos`

Objetivo:

- responder perguntas reais de negocio com SQL puro
- praticar agregacoes, joins e rankings
- consumir os dados finais sem depender de Jinja ou sintaxe dbt

Consultas disponiveis:

- `01_faturamento_por_estado.sql`
- `02_categoria_mais_vendida.sql`
- `03_produto_mais_vendido.sql`
- `04_ticket_medio.sql`
- `05_receita_por_mes.sql`
- `06_pedidos_cancelados_por_canal.sql`

Observacoes:

- `receita_liquida_item` e `quantidade_vendida` ja consideram o tratamento de pedidos cancelados na `fact_vendas`
- para consultas de receita, pedidos cancelados nao inflacionam o resultado porque a receita foi zerada na camada final
