- view: country_user_rank
  sql_table_name: topcoder_dw.country_user_rank
  fields:

  - dimension: country_code
    type: string
    sql: ${TABLE}.country_code

  - dimension: percentile
    type: number
    sql: ${TABLE}.percentile

  - dimension: phase_id
    type: number
    sql: ${TABLE}.phase_id

  - dimension: rank
    type: number
    sql: ${TABLE}.rank

  - dimension: rank_no_tie
    type: number
    sql: ${TABLE}.rank_no_tie

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - dimension: user_rank_type_id
    type: number
    sql: ${TABLE}.user_rank_type_id

  - measure: count
    type: count
    drill_fields: []

