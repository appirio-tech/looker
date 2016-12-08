- view: coder_rank
  sql_table_name: topcoder_dw.coder_rank
  fields:

  - dimension: algo_rating_type_id
    type: number
    sql: ${TABLE}.algo_rating_type_id

  - dimension: coder_id
    type: number
    # hidden: yes
    sql: ${TABLE}.coder_id

  - dimension: coder_rank_type_id
    type: number
    sql: ${TABLE}.coder_rank_type_id

  - dimension: percentile
    type: number
    sql: ${TABLE}.percentile

  - dimension: rank
    type: number
    sql: ${TABLE}.rank

  - measure: count
    type: count
    drill_fields: [coder.coder_id, coder.first_name, coder.last_name, coder.middle_name]

