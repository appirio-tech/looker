view: review_board_by_track {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: tcs_dw.review_board_by_track ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: challenge_type {
    type: string
    sql: ${TABLE}.challenge_type ;;
    description: "Challenge Track for the Reviewer"
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: review_board_status {
    type: string
    sql: ${TABLE}.review_board_status ;;
    description: "Current Status of the Reviewer"
  }

  dimension: immune_ind {
    type: yesno
    sql: ${TABLE}.immune_ind ;;
    description: "Reviewer is exempted from keeping his qualifications current"
  }

  set: detail {
    fields: [challenge_type, user_id, review_board_status, immune_ind]
  }
}
