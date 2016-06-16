- view: user_event_xref
  sql_table_name: tcs_dw.user_event_xref
  fields:

  - dimension_group: create
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.create_date

  - dimension: event_id
    type: number
    # hidden: true
    sql: ${TABLE}.event_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [event.event_id, event.event_name]

