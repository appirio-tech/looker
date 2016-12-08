- view: design_project_result
  sql_table_name: tcs_dw.design_project_result
  fields:

  - dimension: client_selection
    type: number
    sql: ${TABLE}.client_selection

  - dimension_group: inquire_timestamp
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.inquire_timestamp

  - dimension: is_checkpoint
    type: number
    sql: ${TABLE}.is_checkpoint

  - dimension: placement
    type: number
    sql: ${TABLE}.placement

  - dimension: prize_id
    type: number
    sql: ${TABLE}.prize_id

  - dimension: project_id
    type: number
    # hidden: true
    sql: ${TABLE}.project_id

  - dimension_group: review_complete_timestamp
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.review_complete_timestamp

  - dimension: submission_id
    type: number
    sql: ${TABLE}.submission_id

  - dimension: submit_ind
    type: number
    sql: ${TABLE}.submit_ind

  - dimension_group: submit_timestamp
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.submit_timestamp

  - dimension: upload_id
    type: number
    sql: ${TABLE}.upload_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - dimension: valid_submission_ind
    type: number
    sql: ${TABLE}.valid_submission_ind

  - measure: count
    type: count
    drill_fields: [project.component_name, project.review_phase_name, project.project_category_name, project.client_project_id]

  - measure: dr_points
    type: sum
    sql: ${TABLE}.dr_points

  - measure: prize_amount
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.prize_amount
    
  - measure: count_distinct_user
    type: count_distinct
    sql: ${TABLE}.user_id

  - measure: count_challenges
    type: number
    sql: COUNT(${project_id})    
