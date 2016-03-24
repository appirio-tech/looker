- view: contest_result
  sql_table_name: public.contest_result
  fields:

  - dimension: coder_id
    type: number
    # hidden: true
    sql: ${TABLE}.coder_id

  - dimension: contest_id
    type: number
    # hidden: true
    sql: ${TABLE}.contest_id

  - dimension: current_place
    type: number
    sql: ${TABLE}.current_place

  - dimension: current_prize
    type: number
    sql: ${TABLE}.current_prize

  - dimension: final_points
    type: number
    sql: ${TABLE}.final_points

  - dimension: initial_points
    type: number
    sql: ${TABLE}.initial_points

  - dimension: potential_points
    type: number
    sql: ${TABLE}.potential_points

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - contest.contest_id
    - contest.contest_name
    - contest.project_category_name
    - coder.coder_id
    - coder.first_name
    - coder.last_name
    - coder.middle_name

