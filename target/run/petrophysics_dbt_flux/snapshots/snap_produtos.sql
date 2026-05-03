
      
  
    
    

    create  table
      "dev"."snapshots"."snap_produtos"
  
    as (
      
    

    select *,
        md5(coalesce(cast(produto_id as varchar ), '')
         || '|' || coalesce(cast(now()::timestamp as varchar ), '')
        ) as dbt_scd_id,
        now()::timestamp as dbt_updated_at,
        now()::timestamp as dbt_valid_from,
        
  
  coalesce(nullif(now()::timestamp, now()::timestamp), null)
  as dbt_valid_to
from (
        



select
    produto_id,
    nome_produto,
    status_produto,
    quantidade_estoque,
    preco_atual,
    categoria_id,
    marca,
    dt_cadastro
from "dev"."main"."stg_produto"

    ) sbq



    );
  
  
  