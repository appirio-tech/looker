- view: project
  sql_table_name: public.project
  fields:


  - dimension: client_project_id
    primary_key: true
    type: number
    sql: ${TABLE}.client_project_id

  - dimension: actual_total_prize
    type: number
    sql: ${TABLE}.actual_total_prize

  - dimension: admin_fee
    type: number
    sql: ${TABLE}.admin_fee

  - dimension: avg_final_score
    type: number
    sql: ${TABLE}.avg_final_score

  - dimension: avg_raw_score
    type: number
    sql: ${TABLE}.avg_raw_score

  - dimension: category_desc
    type: string
    sql: ${TABLE}.category_desc

  - dimension: category_id
    type: number
    sql: ${TABLE}.category_id

  - dimension: challenge_creator
    type: number
    sql: ${TABLE}.challenge_creator

  - dimension: challenge_launcher
    type: number
    sql: ${TABLE}.challenge_launcher

  - dimension: challenge_manager
    type: number
    sql: ${TABLE}.challenge_manager

  - dimension_group: checkpoint_end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.checkpoint_end_date

  - dimension: checkpoint_prize_amount
    type: number
    sql: ${TABLE}.checkpoint_prize_amount

  - dimension: checkpoint_prize_number
    type: number
    sql: ${TABLE}.checkpoint_prize_number

  - dimension_group: checkpoint_start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.checkpoint_start_date

  - dimension_group: complete
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.complete_date

  - dimension: component_id
    type: number
    sql: ${TABLE}.component_id

  - dimension: component_name
    type: string
    sql: ${TABLE}.component_name

  - dimension: contest_prizes_total
    type: number
    sql: ${TABLE}.contest_prizes_total

  - dimension: copilot
    type: number
    sql: ${TABLE}.copilot

  - dimension: copilot_cost
    type: number
    sql: ${TABLE}.copilot_cost

  - dimension: digital_run_ind
    type: number
    sql: ${TABLE}.digital_run_ind

  - dimension: dr_points
    type: number
    sql: ${TABLE}.dr_points

  - dimension: duration
    type: number
    sql: ${TABLE}.duration

  - dimension: estimated_admin_fee
    type: number
    sql: ${TABLE}.estimated_admin_fee

  - dimension: estimated_copilot_cost
    type: number
    sql: ${TABLE}.estimated_copilot_cost

  - dimension: estimated_reliability_cost
    type: number
    sql: ${TABLE}.estimated_reliability_cost

  - dimension: estimated_review_cost
    type: number
    sql: ${TABLE}.estimated_review_cost

  - dimension: first_place_prize
    type: number
    sql: ${TABLE}.first_place_prize

  - dimension: forum_id
    type: number
    sql: ${TABLE}.forum_id

  - dimension: fulfillment
    type: number
    sql: ${TABLE}.fulfillment

  - dimension: is_private
    type: number
    sql: ${TABLE}.is_private

  - dimension_group: last_modification
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modification_date

  - dimension: level_id
    type: string
    sql: ${TABLE}.level_id

  - dimension: num_checkpoint_submissions
    type: number
    sql: ${TABLE}.num_checkpoint_submissions

  - dimension: num_registrations
    type: number
    sql: ${TABLE}.num_registrations

  - dimension: num_submissions
    type: number
    sql: ${TABLE}.num_submissions

  - dimension: num_submissions_passed_review
    type: number
    sql: ${TABLE}.num_submissions_passed_review

  - dimension: num_valid_checkpoint_submissions
    type: number
    sql: ${TABLE}.num_valid_checkpoint_submissions

  - dimension: num_valid_submissions
    type: number
    sql: ${TABLE}.num_valid_submissions

  - dimension: phase_desc
    type: string
    sql: ${TABLE}.phase_desc

  - dimension: phase_id
    type: number
    sql: ${TABLE}.phase_id

  - dimension_group: posting
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.posting_date

  - dimension: project_category_id
    type: number
    sql: ${TABLE}.project_category_id

  - dimension: project_category_name
    type: string
    sql: ${TABLE}.project_category_name

  - dimension: project_id
    type: number
    # hidden: true
    sql: ${TABLE}.project_id

  - dimension_group: rating
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.rating_date

  - dimension_group: registration_end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.registration_end_date

  - dimension: reliability_cost
    type: number
    sql: ${TABLE}.reliability_cost

  - dimension: review_cost
    type: number
    sql: ${TABLE}.review_cost

  - dimension: review_phase_id
    type: number
    sql: ${TABLE}.review_phase_id

  - dimension: review_phase_name
    type: string
    sql: ${TABLE}.review_phase_name

  - dimension_group: scheduled_end
    type: time
    timeframes: [time, date, week, month]
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
    timeframes: [time, date, week, month]
    sql: ${TABLE}.submitby_date

  - dimension: suspended_ind
    type: number
    sql: ${TABLE}.suspended_ind

  - dimension: tc_direct_project_id
    type: number
    sql: ${TABLE}.tc_direct_project_id

  - dimension: total_prize
    type: number
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
  