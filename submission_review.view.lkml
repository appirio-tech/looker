view: submission_review {
  sql_table_name: tcs_dw.submission_review ;;

  measure: final_score {
    type: sum
    value_format: "##0.00"
    sql: ${TABLE}.final_score ;;
  }

  measure: num_appeals {
    type: sum
    value_format: "##0"
    sql: ${TABLE}.num_appeals ;;
  }

  measure: num_successful_appeals {
    type: sum
    value_format: "##0"
    sql: ${TABLE}.num_successful_appeals ;;
  }

  dimension: project_id {
    type: number
    # hidden: true
    sql: ${TABLE}.project_id ;;
  }

  measure: raw_score {
    type: sum
    value_format: "##0.00"
    sql: ${TABLE}.raw_score ;;
  }

  dimension: review_resp_id {
    type: number
    # hidden: true
    sql: ${TABLE}.review_resp_id ;;
  }

  dimension: reviewer_id {
    type: number
    sql: ${TABLE}.reviewer_id ;;
  }

  dimension: scorecard_id {
    type: number
    sql: ${TABLE}.scorecard_id ;;
  }

  dimension: scorecard_template_id {
    type: number
    sql: ${TABLE}.scorecard_template_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
