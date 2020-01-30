view: coder_problem {
  sql_table_name: topcoder_dw.coder_problem ;;

  dimension: challenge_points {
    type: number
    sql: ${TABLE}.challenge_points ;;
  }

  dimension: coder_id {
    type: number
    sql: ${TABLE}.coder_id ;;
  }

  dimension: defense_points {
    type: number
    sql: ${TABLE}.defense_points ;;
  }

  dimension: division_id {
    type: number
    sql: ${TABLE}.division_id ;;
  }

  dimension: end_status_id {
    type: number
    sql: ${TABLE}.end_status_id ;;
  }

  dimension: end_status_text {
    type: string
    sql: ${TABLE}.end_status_text ;;
  }

  dimension: final_points {
    type: number
    sql: ${TABLE}.final_points ;;
  }

  dimension: language_id {
    type: number
    sql: ${TABLE}.language_id ;;
  }

  dimension: language_placed {
    type: number
    sql: ${TABLE}.language_placed ;;
  }

  dimension: level_desc {
    type: string
    sql: ${TABLE}.level_desc ;;
  }

  dimension: level_id {
    type: number
    sql: ${TABLE}.level_id ;;
  }

  dimension: open_order {
    type: number
    sql: ${TABLE}.open_order ;;
  }

  dimension: open_time {
    type: number
    sql: ${TABLE}.open_time ;;
  }

  dimension: placed {
    type: number
    sql: ${TABLE}.placed ;;
  }

  dimension: problem_id {
    type: number
    sql: ${TABLE}.problem_id ;;
  }

  dimension: round_id {
    type: number
    sql: ${TABLE}.round_id ;;
  }

  dimension: submission_points {
    type: number
    sql: ${TABLE}.submission_points ;;
  }

  dimension: submit_order {
    type: number
    sql: ${TABLE}.submit_order ;;
  }

  dimension: submit_time {
    type: number
    sql: ${TABLE}.submit_time ;;
  }

  dimension: system_test_points {
    type: number
    sql: ${TABLE}.system_test_points ;;
  }

  dimension: time_elapsed {
    type: number
    sql: ${TABLE}.time_elapsed ;;
  }

  dimension: total_execution_time {
    type: number
    sql: ${TABLE}.total_execution_time ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
