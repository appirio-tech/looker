- view: monthly_contest_stats
  sql_table_name: tcs_dw.monthly_contest_stats
  fields:

  - dimension: client_project_id
    type: number
    sql: ${TABLE}.client_project_id

  - dimension: month
    type: number
    sql: ${TABLE}.month

  - dimension: project_category_id
    type: number
    sql: ${TABLE}.project_category_id

  - dimension: tc_direct_project_id
    type: number
    sql: ${TABLE}.tc_direct_project_id

  - dimension: year
    type: number
    sql: ${TABLE}.year

  - measure: count
    type: count
    drill_fields: []

  - measure: total_completed_contests
    type: sum
    sql: ${TABLE}.total_completed_contests

  - measure: total_failed_contests
    type: sum
    sql: ${TABLE}.total_failed_contests

  - measure: avg_contest_fees
    type: sum
    sql: ${TABLE}.avg_contest_fees

  - measure: avg_duration
    type: sum
    sql: ${TABLE}.avg_duration

  - measure: avg_fulfillment
    type: sum
    sql: ${TABLE}.avg_fulfillment

  - measure: avg_member_fees
    type: sum
    sql: ${TABLE}.avg_member_fees
