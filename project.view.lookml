- view: challenge
  sql_table_name: tcs_dw.project
  fields:


  - dimension: client_project_id
    type: number
    sql: ${TABLE}.client_project_id

  - measure: actual_total_prize
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.actual_total_prize

  - measure: admin_fee
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.admin_fee

  - measure: avg_final_score
    type: average
    sql: ${TABLE}.avg_final_score

  - measure: avg_raw_score
    type: average
    sql: ${TABLE}.avg_raw_score

  - dimension: parent_category_desc
    type: string
    sql: ${TABLE}.category_desc

  - dimension: parent_category_id
    type: number
    sql: ${TABLE}.category_id

  - dimension: challenge_creator_id
    type: number
    sql: ${TABLE}.challenge_creator

  - dimension: challenge_launcher_id
    type: number
    sql: ${TABLE}.challenge_launcher

  - dimension: challenge_manager_id
    type: number
    sql: ${TABLE}.challenge_manager

  - dimension_group: checkpoint_end
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.checkpoint_end_date

  - measure: checkpoint_prize_amount
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.checkpoint_prize_amount

  - dimension: checkpoint_prize_number
    type: number
    sql: ${TABLE}.checkpoint_prize_number

  - dimension_group: checkpoint_start
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.checkpoint_start_date

  - dimension_group: complete
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.complete_date

  - dimension: component_id
    type: number
    sql: ${TABLE}.component_id

  - dimension: challenge_name
    type: string
    sql: ${TABLE}.component_name

  - measure: contest_prizes_total
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.contest_prizes_total

  - dimension: copilot_id
    type: number
    sql: ${TABLE}.copilot

  - measure: copilot_cost
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.copilot_cost

  - dimension: digital_run_ind
    type: number
    sql: ${TABLE}.digital_run_ind

  - measure: dr_points
    type: sum
    sql: ${TABLE}.dr_points

  - measure: duration
    type: sum
    sql: ${TABLE}.duration

  - measure: estimated_admin_fee
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.estimated_admin_fee

  - measure: estimated_copilot_cost
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.estimated_copilot_cost

  - measure: estimated_reliability_cost
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.estimated_reliability_cost

  - measure: estimated_review_cost
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.estimated_review_cost

  - measure: first_place_prize
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.first_place_prize

  - dimension: forum_id
    type: number
    sql: ${TABLE}.forum_id

  - measure: fulfillment
    type: average
    sql: ${TABLE}.fulfillment

  - dimension: is_private
    type: number
    sql: ${TABLE}.is_private

  - dimension_group: last_modification
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.last_modification_date

#  - dimension: level_id
#    type: string
#    sql: ${TABLE}.level_id

  - measure: num_checkpoint_submissions
    type: sum
    sql: ${TABLE}.num_checkpoint_submissions

  - measure: num_registrations
    type: sum
    sql: ${TABLE}.num_registrations

  - measure: num_submissions
    type: sum
    sql: ${TABLE}.num_submissions

  - measure: num_submissions_passed_review
    type: sum
    sql: ${TABLE}.num_submissions_passed_review

  - measure: num_valid_checkpoint_submissions
    type: sum
    sql: ${TABLE}.num_valid_checkpoint_submissions

  - measure: num_valid_submissions
    type: sum
    sql: ${TABLE}.num_valid_submissions

#  - dimension: phase_desc
#    type: string
#    sql: ${TABLE}.phase_desc

#  - dimension: phase_id
#    type: number
#    sql: ${TABLE}.phase_id

  - dimension_group: posting
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.posting_date

  - dimension: challenge_category_id
    type: number
    sql: ${TABLE}.project_category_id

  - dimension: challenge_category_name
    type: string
    sql: ${TABLE}.project_category_name

  - dimension: project_id
    primary_key: true
    type: number
    # hidden: true
    sql: ${TABLE}.project_id

  - dimension_group: rating
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.rating_date

  - dimension_group: registration_end
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.registration_end_date

  - measure: reliability_cost
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.reliability_cost

  - measure: review_cost
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.review_cost

  - dimension: review_phase_id
    type: number
    sql: ${TABLE}.review_phase_id

  - dimension: review_phase_name
    type: string
    sql: ${TABLE}.review_phase_name

  - dimension_group: scheduled_end
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.scheduled_end_date

  - dimension: stage_id
    type: number
    sql: ${TABLE}.stage_id

  - dimension: start_date_calendar_id
    type: number
    sql: ${TABLE}.start_date_calendar_id

  - dimension: status_desc
    type: string
    sql: ${TABLE}.status_desc

  - dimension: status_id
    type: number
    sql: ${TABLE}.status_id

  - dimension: submission_viewable
    type: number
    sql: ${TABLE}.submission_viewable

  - dimension_group: submitby
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.submitby_date

  - dimension: suspended_ind
    type: number
    sql: ${TABLE}.suspended_ind

  - dimension: tc_direct_project_id
    type: number
    sql: ${TABLE}.tc_direct_project_id

  - measure: total_prize
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.total_prize

  - dimension: version_id
    type: string
    sql: ${TABLE}.version_id

  - dimension: version_text
    type: string
    sql: ${TABLE}.version_text

  - dimension: viewable_category_ind
    type: number
    sql: ${TABLE}.viewable_category_ind

  - dimension: winner_id
    type: number
    sql: ${TABLE}.winner_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - client_project_id
    - component_name
    - review_phase_name
    - project_category_name
    - project.component_name
    - project.review_phase_name
    - project.project_category_name
    - project.client_project_id
    - project.count
    - project_result.count
  