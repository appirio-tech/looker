- view: streak_type_lu
  sql_table_name: topcoder_dw.streak_type_lu
  fields:

  - dimension: streak_desc
    type: string
    sql: ${TABLE}.streak_desc

  - dimension: streak_type_id
    type: number
    sql: ${TABLE}.streak_type_id

  - measure: count
    type: count
    drill_fields: []

