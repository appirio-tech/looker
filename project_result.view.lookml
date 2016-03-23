- view: project_result
  sql_table_name: public.project_result
  fields:

  - measure: final_points
    type: sum
    sql: ${TABLE}.final_points

  - measure: final_score
    type: sum
    sql: ${TABLE}.final_score

  - dimension_group: inquire_timestamp
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.inquire_timestamp

  - measure: new_rating
    type: sum
    sql: ${TABLE}.new_rating

  - dimension: new_rating_id
    type: number
    sql: ${TABLE}.new_rating_id

  - measure: new_reliability
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.new_reliability

  - measure: num_appeals
    type: sum
    sql: ${TABLE}.num_appeals

  - measure: num_ratings
    type: sum
    sql: ${TABLE}.num_ratings

  - measure: num_successful_appeals
    type: sum
    sql: ${TABLE}.num_successful_appeals

  - measure: old_rating
    type: sum
    sql: ${TABLE}.old_rating

  - dimension: old_rating_id
    type: number
    sql: ${TABLE}.old_rating_id

  - measure: old_reliability
    type: sum
    sql: ${TABLE}.old_reliability

  - dimension: passed_review_ind
    type: number
    sql: ${TABLE}.passed_review_ind

  - measure: payment
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.payment

  - dimension: placed
    type: number
    sql: ${TABLE}.placed

  - measure: points_awarded
    type: sum
    sql: ${TABLE}.points_awarded

  - measure: potential_points
    type: sum
    sql: ${TABLE}.potential_points

  - dimension: project_id
    type: number
    # hidden: true
    sql: ${TABLE}.project_id

  - dimension: rating_ind
    type: number
    sql: ${TABLE}.rating_ind

  - dimension: rating_order
    type: number
    sql: ${TABLE}.rating_order

  - measure: raw_score
    type: sum
    sql: ${TABLE}.raw_score

  - dimension: reliable_submission_ind
    type: number
    sql: ${TABLE}.reliable_submission_ind

  - dimension_group: review_complete_timestamp
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.review_complete_timestamp

  - dimension: submit_ind
    type: number
    sql: ${TABLE}.submit_ind

  - dimension_group: submit_timestamp
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.submit_timestamp

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - dimension: valid_submission_ind
    type: number
    sql: ${TABLE}.valid_submission_ind

  - measure: count
    type: count
    drill_fields: [project.component_name, project.review_phase_name, project.project_category_name, project.client_project_id]

