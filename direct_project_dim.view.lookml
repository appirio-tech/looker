- view: direct_project_dim
  sql_table_name: public.direct_project_dim
  fields:

  - dimension: billing_project_id
    type: number
    sql: ${TABLE}.billing_project_id

  - dimension: direct_project_id
    type: number
    sql: ${TABLE}.direct_project_id

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension_group: project_create
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.project_create_date

  - dimension_group: project_modification
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.project_modification_date

  - dimension: project_status_id
    type: number
    sql: ${TABLE}.project_status_id

  - measure: count
    type: count
    drill_fields: [name]

