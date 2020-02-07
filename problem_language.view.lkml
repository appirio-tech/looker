view: problem_language {
  sql_table_name: topcoder_dw.problem_language ;;

  dimension: average_points {
    type: number
    sql: ${TABLE}.average_points ;;
  }

  dimension: avg_time_elapsed {
    type: number
    sql: ${TABLE}.avg_time_elapsed ;;
  }

  dimension: challenge_attempts_made {
    type: number
    sql: ${TABLE}.challenge_attempts_made ;;
  }

  dimension: challenge_points {
    type: number
    sql: ${TABLE}.challenge_points ;;
  }

  dimension: challenges_made_failed {
    type: number
    sql: ${TABLE}.challenges_made_failed ;;
  }

  dimension: defense_points {
    type: number
    sql: ${TABLE}.defense_points ;;
  }

  dimension: division_id {
    type: number
    sql: ${TABLE}.division_id ;;
  }

  dimension: final_points {
    type: number
    sql: ${TABLE}.final_points ;;
  }

  dimension: language_id {
    type: number
    sql: ${TABLE}.language_id ;;
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

  dimension: point_standard_deviation {
    type: number
    sql: ${TABLE}.point_standard_deviation ;;
  }

  dimension: problem_id {
    type: number
    sql: ${TABLE}.problem_id ;;
  }

  dimension: problems_correct {
    type: number
    sql: ${TABLE}.problems_correct ;;
  }

  dimension: problems_failed_by_challenge {
    type: number
    sql: ${TABLE}.problems_failed_by_challenge ;;
  }

  dimension: problems_failed_by_system_test {
    type: number
    sql: ${TABLE}.problems_failed_by_system_test ;;
  }

  dimension: problems_submitted {
    type: number
    sql: ${TABLE}.problems_submitted ;;
  }

  dimension: round_id {
    type: number
    sql: ${TABLE}.round_id ;;
  }

  dimension: submission_points {
    type: number
    sql: ${TABLE}.submission_points ;;
  }

  dimension: system_test_points {
    type: number
    sql: ${TABLE}.system_test_points ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
