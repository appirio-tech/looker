- view: copilot_statistics
  sql_table_name: tcs_dw.copilot_statistics
  fields:

  - dimension: copilot_profile_id
    type: number
    sql: ${TABLE}.copilot_profile_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: []

  - measure: bug_races_count
    type: sum
    sql: ${TABLE}.bug_races_count

  - measure: contests_count
    type: sum
    sql: ${TABLE}.contests_count

  - measure: current_contests_count
    type: sum
    sql: ${TABLE}.current_contests_count

  - measure: current_projects_count
    type: sum
    sql: ${TABLE}.current_projects_count

  - measure: failures_count
    type: sum
    sql: ${TABLE}.failures_count

  - measure: fulfillment
    type: sum
    sql: ${TABLE}.fulfillment

  - measure: projects_count
    type: sum
    sql: ${TABLE}.projects_count

  - measure: reposts_count
    type: sum
    sql: ${TABLE}.reposts_count

  - measure: submission_rate
    type: sum
    sql: ${TABLE}.submission_rate

  - measure: total_earnings
    type: sum
    sql: ${TABLE}.total_earnings


