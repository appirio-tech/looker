- view: user_achievement_type_lu
  sql_table_name: public.user_achievement_type_lu
  fields:

  - dimension: user_achievement_type_desc
    type: string
    sql: ${TABLE}.user_achievement_type_desc

  - dimension: user_achievement_type_id
    type: number
    sql: ${TABLE}.user_achievement_type_id

  - measure: count
    type: count
    drill_fields: []

