- view: user_contest_prize
  sql_table_name: tcs_dw.user_contest_prize
  fields:

  - dimension: contest_id
    type: number
    # hidden: true
    sql: ${TABLE}.contest_id

  - dimension: place
    type: number
    sql: ${TABLE}.place

  - dimension: prize_description
    type: string
    sql: ${TABLE}.prize_description

  - dimension: prize_type_id
    type: number
    sql: ${TABLE}.prize_type_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [contest.contest_id, contest.contest_name, contest.project_category_name]

  - measure: prize_amount
    type: sum
    sql: ${TABLE}.prize_amount

  - measure: prize_payment
    type: sum
    sql: ${TABLE}.prize_payment
