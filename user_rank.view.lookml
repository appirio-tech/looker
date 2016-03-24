- view: user_rank
  sql_table_name: public.user_rank
  fields:

  - dimension: percentile
    type: number
    sql: ${TABLE}.percentile

  - dimension: phase_id
    type: number
    sql: ${TABLE}.phase_id

  - dimension: rank
    type: number
    sql: ${TABLE}.rank

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - dimension: user_rank_type_id
    type: number
    sql: ${TABLE}.user_rank_type_id

  - measure: count
    type: count
    drill_fields: []

