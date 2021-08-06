view: room_result {
  sql_table_name: topcoder_dw.room_result ;;

  dimension: advanced {
    type: string
    sql: ${TABLE}.advanced ;;
  }

  dimension: attended {
    type: string
    sql: ${TABLE}.attended ;;
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
    # hidden: yes
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

  dimension: division_placed {
    type: number
    sql: ${TABLE}.division_placed ;;
  }

  dimension: division_seed {
    type: number
    sql: ${TABLE}.division_seed ;;
  }

  dimension: final_points {
    type: number
    sql: ${TABLE}.final_points ;;
  }

  dimension: new_rating {
    type: number
    sql: ${TABLE}.new_rating ;;
  }

  dimension: new_rating_id {
    type: number
    sql: ${TABLE}.new_rating_id ;;
  }

  dimension: num_ratings {
    type: number
    sql: ${TABLE}.num_ratings ;;
  }

  dimension: old_rating {
    type: number
    sql: ${TABLE}.old_rating ;;
  }

  dimension: old_rating_id {
    type: number
    sql: ${TABLE}.old_rating_id ;;
  }

  dimension: overall_rank {
    type: number
    sql: ${TABLE}.overall_rank ;;
  }

  dimension: paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.paid ;;
  }

  dimension: payment_type_desc {
    type: string
    sql: ${TABLE}.payment_type_desc ;;
  }

  dimension: payment_type_id {
    type: number
    sql: ${TABLE}.payment_type_id ;;
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

  dimension: rated_flag {
    type: number
    sql: ${TABLE}.rated_flag ;;
  }

  dimension: region_placed {
    type: number
    sql: ${TABLE}.region_placed ;;
  }

  dimension: room_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.room_id ;;
  }

  dimension: room_placed {
    type: number
    sql: ${TABLE}.room_placed ;;
  }

  dimension: room_seed {
    type: number
    sql: ${TABLE}.room_seed ;;
  }

  dimension: round_id {
    type: number
    # hidden: yes
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
    # hidden: yes
    sql: ${TABLE}.team_id ;;
  }

  dimension: team_points {
    type: number
    sql: ${TABLE}.team_points ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      round.round_id,
      round.name,
      round.short_name,
      room.room_id,
      room.name,
      room.state_name,
      room.country_name,
      coder.coder_id,
      coder.first_name,
      coder.last_name,
      coder.middle_name,
      team.team_id,
      team.name
    ]
  }
}
