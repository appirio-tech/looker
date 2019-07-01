view: problem_submission {
  sql_table_name: topcoder_dw.problem_submission ;;

  dimension: coder_id {
    type: number
    sql: ${TABLE}.coder_id ;;
  }

  dimension: final_points {
    type: number
    sql: ${TABLE}.final_points ;;
  }

  dimension: language_id {
    type: number
    sql: ${TABLE}.language_id ;;
  }

  dimension: last_submission {
    type: number
    sql: ${TABLE}.last_submission ;;
  }

  dimension: open_time {
    type: number
    sql: ${TABLE}.open_time ;;
  }

  dimension: problem_id {
    type: number
    sql: ${TABLE}.problem_id ;;
  }

  dimension: round_id {
    type: number
    sql: ${TABLE}.round_id ;;
  }

  dimension: status_desc {
    type: string
    sql: ${TABLE}.status_desc ;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}.status_id ;;
  }

  dimension: submission_number {
    type: number
    sql: ${TABLE}.submission_number ;;
  }

  dimension: submission_points {
    type: number
    sql: ${TABLE}.submission_points ;;
  }

  dimension: submission_text {
    type: string
    sql: ${TABLE}.submission_text ;;
  }

  dimension: submit_time {
    type: number
    sql: ${TABLE}.submit_time ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
