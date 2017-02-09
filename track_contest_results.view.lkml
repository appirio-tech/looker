view: track_contest_results {
  sql_table_name: tcs_dw.track_contest_results ;;

  dimension: taxable_track_contest_prize {
    type: number
    sql: ${TABLE}.taxable_track_contest_prize ;;
  }

  dimension: track_contest_id {
    type: number
    # hidden: true
    sql: ${TABLE}.track_contest_id ;;
  }

  dimension: track_contest_placement {
    type: number
    sql: ${TABLE}.track_contest_placement ;;
  }

  measure: track_contest_prize {
    type: sum
    sql: ${TABLE}.track_contest_prize ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [track_contest.track_contest_id]
  }
}
