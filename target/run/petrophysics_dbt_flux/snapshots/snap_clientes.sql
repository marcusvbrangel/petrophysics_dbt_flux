
      
  
    
    

    create  table
      "dev"."snapshots"."snap_clientes"
  
    as (
      
    

    select *,
        md5(coalesce(cast(cliente_id as varchar ), '')
         || '|' || coalesce(cast(now()::timestamp as varchar ), '')
        ) as dbt_scd_id,
        now()::timestamp as dbt_updated_at,
        now()::timestamp as dbt_valid_from,
        
  
  coalesce(nullif(now()::timestamp, now()::timestamp), null)
  as dbt_valid_to
from (
        



select
    cliente_id,
    nome_cliente,
    email,
    dt_cadastro,
    status_cliente,
    segmento,
    canal_preferido,
    score_fidelidade
from "dev"."main"."stg_cliente"

    ) sbq



    );
  
  
  