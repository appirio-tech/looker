- view: design_project_result
  sql_table_name: public.design_project_result
  fields:

  - dimension: client_selection
    type: number
    sql: ${TABLE}.client_selection

  - dimension: dr_points
    type: number
    sql: ${TABLE}.dr_points

  - dimension_group: inquire_timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.inquire_timestamp

  - dimension: is_checkpoint
    type: number
    sql: ${TABLE}.is_checkpoint

  - dimension: placement
    type: number
    sql: ${TABLE}.placement

  - dimension: prize_amount
    type: number
    sql: ${TABLE}.prize_amount

  - dimension: prize_id
    type: number
    sql: ${TABLE}.prize_id

  - dimension: project_id
    type: number
    # hidden: true
    sql: ${TABLE}.project_id

  - dimension_group: review_complete_timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.review_complete_timestamp

  - dimension: submission_id
    type: number
    sql: ${TABLE}.submission_id

  - dimension: submit_ind
    type: number
    sql: ${TABLE}.submit_ind

  - dimension_group: submit_timestamp
    type: time
    timeframes: [time, date, week, month]
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

