view: coder_division {
  sql_table_name: topcoder_dw.coder_division ;;

  dimension: algo_rating_type_id {
    type: number
    sql: ${TABLE}.algo_rating_type_id ;;
  }

  dimension: average_points {
    type: number
    sql: ${TABLE}.average_points ;;
  }

  dimension: challenge_attempts_made {
    type: number
    sql: ${TABLE}.challenge_attempts_made ;;
  }

  dimension: challenge_attempts_received {
    type: number
    sql: ${TABLE}.challenge_attempts_received ;;
  }

  dimension: challenge_points {
    type: number
    sql: ${TABLE}.challenge_points ;;
  }

  dimension: challenges_made_failed {
    type: number
    sql: ${TABLE}.challenges_made_failed ;;
  }

  dimension: challenges_made_successful {
    type: number
    sql: ${TABLE}.challenges_made_successful ;;
  }

  dimension: challenges_received_failed {
    type: number
    sql: ${TABLE}.challenges_received_failed ;;
  }

  dimension: challenges_received_successful {
    type: number
    sql: ${TABLE}.challenges_received_successful ;;
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

  dimension: final_points {
    type: number
    sql: ${TABLE}.final_points ;;
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

  dimension: problems_left_open {
    type: number
    sql: ${TABLE}.problems_left_open ;;
  }

  dimension: problems_opened {
    type: number
    sql: ${TABLE}.problems_opened ;;
  }

  dimension: problems_presented {
    type: number
    sql: ${TABLE}.problems_presented ;;
  }

  dimension: problems_submitted {
    type: number
    sql: ${TABLE}.problems_submitted ;;
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
