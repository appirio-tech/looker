- view: track
  sql_table_name: tcs_dw.track
  fields:

  - dimension: track_id
    primary_key: true
    type: number
    sql: ${TABLE}.track_id

  - dimension: track_desc
    type: string
    sql: ${TABLE}.track_desc

  - dimension_group: track_end
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.track_end_date

  - dimension_group: track_start
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.track_start_date

  - dimension: track_status_desc
    type: string
    sql: ${TABLE}.track_status_desc

  - dimension: track_status_id
    type: number
    sql: ${TABLE}.track_status_id

  - dimension: track_type_desc
    type: string
    sql: ${TABLE}.track_type_desc

  - dimension: track_type_id
    type: number
    sql: ${TABLE}.track_type_id

  - measure: count
    type: count
    drill_fields: [track_id, dr_points.count, track_contest.count]

