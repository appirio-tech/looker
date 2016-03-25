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

  - measure: count
    type: count
    drill_fields: detail*

  - measure: current_prize
    type: sum
    sql: ${TABLE}.current_prize

  - measure: final_points
    type: sum
    sql: ${TABLE}.final_points

  - measure: initial_points
    type: sum
    sql: ${TABLE}.initial_points

  - measure: potential_points
    type: sum
    sql: ${TABLE}.potential_points



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

