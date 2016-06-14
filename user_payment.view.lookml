- view: user_payment
  sql_table_name: tcs_dw.user_payment
  fields:

  - dimension: payment_id
    type: number
    # hidden: true
    sql: ${TABLE}.payment_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - dimension: due_calendar_id
    type: number
    sql: ${TABLE}.due_calendar_id

  - dimension: paid_calendar_id
    type: number
    sql: ${TABLE}.paid_calendar_id

  - measure: count
    type: count
    drill_fields: [payment.parent_payment_id]
    
  - measure: gross_amount
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.gross_amount

  - measure: net_amount
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.net_amount

  - measure: total_amount
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.total_amount



