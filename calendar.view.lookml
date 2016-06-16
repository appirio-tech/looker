- view: calendar
  sql_table_name: topcoder_dw.calendar
  fields:

  - dimension: calendar_id
    primary_key: true
    type: number
    sql: ${TABLE}.calendar_id

  - dimension_group: date
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.date

  - dimension: day_of_month
    type: number
    sql: ${TABLE}.day_of_month

  - dimension: day_of_week
    type: number
    sql: ${TABLE}.day_of_week

  - dimension: day_of_year
    type: number
    sql: ${TABLE}.day_of_year

  - dimension: holiday
    type: string
    sql: ${TABLE}.holiday

  - dimension: month_alpha
    type: string
    sql: ${TABLE}.month_alpha

  - dimension: month_numeric
    type: number
    sql: ${TABLE}.month_numeric

  - dimension: quarter_of_year
    type: number
    sql: ${TABLE}.quarter_of_year

  - dimension: week_day
    type: string
    sql: ${TABLE}.week_day

  - dimension: week_of_year
    type: number
    sql: ${TABLE}.week_of_year

  - dimension: week_year
    type: number
    sql: ${TABLE}.week_year

  - dimension: weekend
    type: string
    sql: ${TABLE}.weekend

  - dimension: year
    type: number
    sql: ${TABLE}.year

  - dimension: year_month
    type: string
    sql: ${TABLE}.year_month

  - measure: count
    type: count
    drill_fields: [calendar_id]

