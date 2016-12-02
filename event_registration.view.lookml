- view: event_registration
  sql_table_name: tcs_dw.event_registration
  fields:

  - dimension_group: create_date
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.create_date

  - dimension: eligible_ind
    type: number
    sql: ${TABLE}.eligible_ind

  - dimension: event_id
    type: number
    # hidden: true
    sql: ${TABLE}.event_id

  - dimension_group: modify_date
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.modify_date

  - dimension: notes
    type: string
    sql: ${TABLE}.notes

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [event.event_id, event.event_name]

