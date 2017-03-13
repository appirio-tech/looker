view: round {
  sql_table_name: topcoder_dw.round ;;

  dimension: round_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.round_id ;;
  }

  dimension: calendar_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.calendar_id ;;
  }

  dimension: contest_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.contest_id ;;
  }

  dimension: failed {
    type: number
    sql: ${TABLE}.failed ;;
  }

  dimension: forum_id {
    type: number
    sql: ${TABLE}.forum_id ;;
  }

  dimension: invitational {
    type: number
    sql: ${TABLE}.invitational ;;
  }

  dimension: money_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.money_paid ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: rated_ind {
    type: number
    sql: ${TABLE}.rated_ind ;;
  }

  dimension: rating_order {
    type: number
    sql: ${TABLE}.rating_order ;;
  }

  dimension: region_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.region_id ;;
  }

  dimension: round_type_desc {
    type: string
    sql: ${TABLE}.round_type_desc ;;
  }

  dimension: round_type_id {
    type: number
    sql: ${TABLE}.round_type_id ;;
  }

  dimension: short_name {
    type: string
    sql: ${TABLE}.short_name ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: time_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.time_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      round_id,
      name,
      short_name,
      contest.contest_id,
      contest.name,
      calendar.calendar_id,
      region.region_id,
      region.region_name,
      time.time_id,
      advancer_round.count,
      algo_rating_history.count,
      algo_rating_history_backup.count,
      challenge.count,
      coder_problem.count,
      coder_rank_history.count,
      country_rank_history.count,
      invite_list.count,
      long_comp_result.count,
      long_problem_submission.count,
      long_system_test_result.count,
      problem.count,
      problem_language.count,
      problem_submission.count,
      request.count,
      room.count,
      room_result.count,
      round_division.count,
      round_image_xref.count,
      round_problem.count,
      season_algo_rating_history.count,
      season_algo_rating_history_backup.count,
      season_country_rank_history.count,
      season_rank_history.count,
      season_team_rank_history.count,
      system_test_result.count,
      team_round.count
    ]
  }
}
