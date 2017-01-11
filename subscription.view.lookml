- view: subscription
  sql_table_name: public.subscription
  fields:

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension: customer_name
    type: string
    sql: ${TABLE}.customer_name

  - dimension_group: subscription_date
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.subscription_date

  - measure: amount
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.amount

  - measure: count
    type: count
    drill_fields: [customer_name, subsription_date]

