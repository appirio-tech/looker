view: team_round {
  sql_table_name: topcoder_dw.team_round ;;

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

  dimension: defense_points {
    type: number
    sql: ${TABLE}.defense_points ;;
  }

  dimension: final_points {
    type: number
    sql: ${TABLE}.final_points ;;
  }

  dimension: num_coders {
    type: number
    sql: ${TABLE}.num_coders ;;
  }

  dimension: point_standard_deviation {
    type: number
    sql: ${TABLE}.point_standard_deviation ;;
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

  dimension: team_id {
    type: number
    sql: ${TABLE}.team_id ;;
  }

  dimension: team_placed {
    type: number
    sql: ${TABLE}.team_placed ;;
  }

  dimension: team_points {
    type: number
    sql: ${TABLE}.team_points ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
