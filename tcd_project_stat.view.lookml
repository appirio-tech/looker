- view: tcd_project_stat
  sql_table_name: public.tcd_project_stat
  fields:

  - dimension: cost
    type: number
    sql: ${TABLE}.cost

  - dimension_group: create
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.create_date

  - dimension: create_user
    type: string
    sql: ${TABLE}.create_user

  - dimension: duration
    type: number
    sql: ${TABLE}.duration

  - dimension: fulfillment
    type: number
    sql: ${TABLE}.fulfillment

  - dimension_group: modify
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.modify_date

  - dimension: modify_user
    type: string
    sql: ${TABLE}.modify_user

  - dimension: project_category_id
    type: number
    sql: ${TABLE}.project_category_id

  - dimension_group: stat
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.stat_date

  - dimension: tcd_project_id
    type: number
    sql: ${TABLE}.tcd_project_id

  - dimension: total_project
    type: number
    sql: ${TABLE}.total_project

  - measure: count
    type: count
    drill_fields: []

