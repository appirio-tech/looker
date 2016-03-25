- view: contest_prize
  sql_table_name: public.contest_prize
  fields:

  - dimension: contest_prize_id
    primary_key: true
    type: number
    sql: ${TABLE}.contest_prize_id

  - dimension: contest_id
    type: number
    # hidden: true
    sql: ${TABLE}.contest_id

  - dimension: place
    type: number
    sql: ${TABLE}.place

  - dimension: prize_desc
    type: string
    sql: ${TABLE}.prize_desc

  - dimension: prize_type_desc
    type: string
    sql: ${TABLE}.prize_type_desc

  - dimension: prize_type_id
    type: number
    sql: ${TABLE}.prize_type_id

  - measure: count
    type: count
    drill_fields: [contest_prize_id, contest.contest_id, contest.contest_name, contest.project_category_name]

  - measure: prize_amount
    type: sum
    sql: ${TABLE}.prize_amount

