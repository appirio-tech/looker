- view: project_result
  sql_table_name: public.project_result
  fields:

  - dimension: final_points
    type: number
    sql: ${TABLE}.final_points

  - dimension: final_score
    type: number
    sql: ${TABLE}.final_score

  - dimension_group: inquire_timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.inquire_timestamp

  - dimension: new_rating
    type: number
    sql: ${TABLE}.new_rating

  - dimension: new_rating_id
    type: number
    sql: ${TABLE}.new_rating_id

  - dimension: new_reliability
    type: number
    sql: ${TABLE}.new_reliability

  - dimension: num_appeals
    type: number
    sql: ${TABLE}.num_appeals

  - dimension: num_ratings
    type: number
    sql: ${TABLE}.num_ratings

  - dimension: num_successful_appeals
    type: number
    sql: ${TABLE}.num_successful_appeals

  - dimension: old_rating
    type: number
    sql: ${TABLE}.old_rating

  - dimension: old_rating_id
    type: number
    sql: ${TABLE}.old_rating_id

  - dimension: old_reliability
    type: number
    sql: ${TABLE}.old_reliability

  - dimension: passed_review_ind
    type: number
    sql: ${TABLE}.passed_review_ind

  - dimension: payment
    type: number
    sql: ${TABLE}.payment

  - dimension: placed
    type: number
    sql: ${TABLE}.placed

  - dimension: points_awarded
    type: number
    sql: ${TABLE}.points_awarded

  - dimension: potential_points
    type: number
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

  - dimension: raw_score
    type: number
    sql: ${TABLE}.raw_score

  - dimension: reliable_submission_ind
    type: number
    sql: ${TABLE}.reliable_submission_ind

  - dimension_group: review_complete_timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.review_complete_timestamp

  - dimension: submit_ind
    type: number
    sql: ${TABLE}.submit_ind

  - dimension_group: submit_timestamp
    type: time
    timeframes: [time, date, week, month]
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

