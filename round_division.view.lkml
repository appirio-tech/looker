view: round_division {
  sql_table_name: topcoder_dw.round_division ;;

  dimension: round_division_id {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.round_id, ${TABLE}.division_id) ;;
  }

  measure: average_points {
    type: sum
    sql: ${TABLE}.average_points ;;
  }

  measure: challenge_attempts_made {
    type: sum
    sql: ${TABLE}.challenge_attempts_made ;;
  }

  measure: challenge_attempts_received {
    type: sum
    sql: ${TABLE}.challenge_attempts_received ;;
  }

  measure: challenges_made_failed {
    type: sum
    sql: ${TABLE}.challenges_made_failed ;;
  }

  measure: challenges_made_successful {
    type: sum
    sql: ${TABLE}.challenges_made_successful ;;
  }

  measure: defense_points {
    type: sum
    sql: ${TABLE}.defense_points ;;
  }

  dimension: division_id {
    type: number
    sql: ${TABLE}.division_id ;;
  }

  measure: num_coders {
    type: sum
    sql: ${TABLE}.num_coders ;;
  }

  measure: point_standard_deviation {
    type: sum
    sql: ${TABLE}.point_standard_deviation ;;
  }

  measure: problems_correct {
    type: sum
    sql: ${TABLE}.problems_correct ;;
  }

  measure: problems_failed_by_challenge {
    type: sum
    sql: ${TABLE}.problems_failed_by_challenge ;;
  }

  measure: problems_failed_by_system_test {
    type: sum
    sql: ${TABLE}.problems_failed_by_system_test ;;
  }

  measure: problems_left_open {
    type: sum
    sql: ${TABLE}.problems_left_open ;;
  }

  measure: problems_opened {
    type: sum
    sql: ${TABLE}.problems_opened ;;
  }

  measure: problems_presented {
    type: sum
    sql: ${TABLE}.problems_presented ;;
  }

  measure: problems_submitted {
    type: sum
    sql: ${TABLE}.problems_submitted ;;
  }

  dimension: round_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.round_id ;;
  }

  measure: count {
    type: count
    drill_fields: [round.round_id, round.name, round.short_name]
  }
}
