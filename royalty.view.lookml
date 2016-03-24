- view: royalty
  sql_table_name: public.royalty
  fields:

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension_group: royalty
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.royalty_date

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: []

