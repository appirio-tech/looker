- view: user_payment
  sql_table_name: public.user_payment
  fields:

  - dimension: due_calendar_id
    type: number
    sql: ${TABLE}.due_calendar_id

  - dimension: gross_amount
    type: number
    sql: ${TABLE}.gross_amount

  - dimension: net_amount
    type: number
    sql: ${TABLE}.net_amount

  - dimension: paid_calendar_id
    type: number
    sql: ${TABLE}.paid_calendar_id

  - dimension: payment_id
    type: number
    # hidden: true
    sql: ${TABLE}.payment_id

  - dimension: total_amount
    type: number
    sql: ${TABLE}.total_amount

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [payment.parent_payment_id]

