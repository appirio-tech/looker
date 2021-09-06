view: submission_review {
  sql_table_name: tcs_dw.submission_review ;;


  #----------------------------------Id values ---------------------------------#
  dimension: review_id {
    type: number
    description: "Primary Key Unique for this submission, user and reviewer combination"
    primary_key: yes
    sql: ${TABLE}.review_id ;;
  }

  dimension: submission_id {
    type: number
    value_format_name: id
  }

  dimension: project_id {
    type: number
    hidden: yes
    sql: ${TABLE}.project_id ;;
  }

  dimension: challenge_id {
     type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension: user_id {
    type: number
    description: "Submitter"
    value_format_name: id
    sql: ${TABLE}.user_id ;;
  }

  dimension: reviewer_role_id {
    type: number
    description: "Reviewer Role Id"
    sql: ${TABLE}.reviewer_role_id ;;
  }


  dimension: reviewer_role {
    description: "Role eg Iterative Reviewer, Reviewer, Spec Reviewer etc"
    sql: ${TABLE}.reviewer_role ;;
  }

  dimension: reviewer_id {
    type: number
    description: "User Id who is reviewing the submission"
    sql: ${TABLE}.reviewer_id ;;
  }

  #Deprecate this field as no longer relevant
  dimension: review_resp_id {
    type: number
    hidden: yes
    sql: ${TABLE}.review_resp_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [date, week, month, year]
    description: "Review created Date"
    sql: ${TABLE}.create_date ;;
  }


  #-----------------------------------------Scorecard fields ------------------------#

  dimension: question_count {
    type: number
    description: "Count of questions in scorecard"
    sql: ${TABLE}.questions ;;
  }

  dimension: min_score {
    type: number
    description: "Minimum score required by the scorecard, to consider this submission as passed review"
    value_format: "##0.00"
    sql: ${TABLE}.min_score ;;
  }

  dimension: max_score {
    type: number
    description: "Maximum score that can be obtained"
    value_format: "##0.00"
    sql: ${TABLE}.max_score ;;
  }

  dimension: scorecard_id {
    type: number
    description: "Scorecard Id used for review"
    sql: ${TABLE}.scorecard_id ;;
  }

  dimension: scorecard_name {
    type: string
    description: "Scorecard name used for review"
    sql: ${TABLE}.scorecard_name ;;
  }

  dimension: scorecard_type {
    type: string
    description: "Scorecard Type or category"
    sql: ${TABLE}.scorecard_type ;;
  }

  #---------------------------------- Measures -------------------------------#

  measure: final_score {
    type: sum
    description: "Final Score"
    value_format: "##0.00"
    sql: ${TABLE}.final_score ;;
  }

  measure: num_appeals {
    type: sum
    description: "Number of appeals filed by the submitter on this scorecard"
    value_format: "##0"
    sql: ${TABLE}.num_appeals ;;
  }

  measure: num_successful_appeals {
    type: sum
    description: "Appeals that were accepted by the reviewer / copilot"
    value_format: "##0"
    sql: ${TABLE}.num_successful_appeals ;;
  }

  measure: raw_score {
    type: sum
    description: "Initial score before appeals and adjustments"
    value_format: "##0.00"
    sql: ${TABLE}.raw_score ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

 }
