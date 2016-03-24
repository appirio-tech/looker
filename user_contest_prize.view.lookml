- view: user_contest_prize
  sql_table_name: public.user_contest_prize
  fields:

  - dimension: contest_id
    type: number
    # hidden: true
    sql: ${TABLE}.contest_id

  - dimension: place
    type: number
    sql: ${TABLE}.place

  - dimension: prize_amount
    type: number
    sql: ${TABLE}.prize_amount

  - dimension: prize_description
    type: string
    sql: ${TABLE}.prize_description

  - dimension: prize_payment
    type: number
    sql: ${TABLE}.prize_payment

  - dimension: prize_type_id
    type: number
    sql: ${TABLE}.prize_type_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [contest.contest_id, contest.contest_name, contest.project_category_name]

