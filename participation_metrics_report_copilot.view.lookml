- view: participation_metrics_report_copilot
  sql_table_name: tcs_dw.participation_metrics_report_copilot
  fields:

  - dimension: contest_id
    type: number
    # hidden: true
    sql: ${TABLE}.contest_id

  - dimension: copilot_id
    type: number
    sql: ${TABLE}.copilot_id

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: country_code
    type: string
    sql: ${TABLE}.country_code

  - measure: count
    type: count
    drill_fields: [contest.contest_id, contest.contest_name, contest.project_category_name]

