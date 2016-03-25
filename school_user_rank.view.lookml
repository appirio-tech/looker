- view: school_user_rank
  sql_table_name: public.school_user_rank
  fields:

  - dimension: percentile
    type: number
    sql: ${TABLE}.percentile

  - dimension: phase_id
    type: number
    sql: ${TABLE}.phase_id

  - dimension: school_id
    type: number
    sql: ${TABLE}.school_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - dimension: user_rank_type_id
    type: number
    sql: ${TABLE}.user_rank_type_id

  - measure: count
    type: count
    drill_fields: []

  - measure: rank
    type: sum
    sql: ${TABLE}.rank

  - measure: rank_no_tie
    type: sum
    sql: ${TABLE}.rank_no_tie
