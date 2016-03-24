- view: client_user_stats
  sql_table_name: public.client_user_stats
  fields:

  - dimension: client_user_stats_id
    primary_key: true
    type: number
    sql: ${TABLE}.client_user_stats_id

  - dimension: client_id
    type: number
    sql: ${TABLE}.client_id

  - dimension: month
    type: number
    sql: ${TABLE}.month

  - dimension: user_count
    type: number
    sql: ${TABLE}.user_count

  - dimension: year
    type: number
    sql: ${TABLE}.year

  - measure: count
    type: count
    drill_fields: [client_user_stats_id]

