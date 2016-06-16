- view: user_rank_type_lu
  sql_table_name: tcs_dw.user_rank_type_lu
  fields:

  - dimension: user_rank_type_desc
    type: string
    sql: ${TABLE}.user_rank_type_desc

  - dimension: user_rank_type_id
    type: number
    sql: ${TABLE}.user_rank_type_id

  - measure: count
    type: count
    drill_fields: []

