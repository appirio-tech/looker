- view: copilot_statistics
  sql_table_name: public.copilot_statistics
  fields:

  - dimension: bug_races_count
    type: number
    sql: ${TABLE}.bug_races_count

  - dimension: contests_count
    type: number
    sql: ${TABLE}.contests_count

  - dimension: copilot_profile_id
    type: number
    sql: ${TABLE}.copilot_profile_id

  - dimension: current_contests_count
    type: number
    sql: ${TABLE}.current_contests_count

  - dimension: current_projects_count
    type: number
    sql: ${TABLE}.current_projects_count

  - dimension: failures_count
    type: number
    sql: ${TABLE}.failures_count

  - dimension: fulfillment
    type: number
    sql: ${TABLE}.fulfillment

  - dimension: projects_count
    type: number
    sql: ${TABLE}.projects_count

  - dimension: reposts_count
    type: number
    sql: ${TABLE}.reposts_count

  - dimension: submission_rate
    type: number
    sql: ${TABLE}.submission_rate

  - dimension: total_earnings
    type: number
    sql: ${TABLE}.total_earnings

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: []

