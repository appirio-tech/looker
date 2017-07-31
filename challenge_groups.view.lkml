view: challenge_groups {
  sql_table_name: tcs_dw.challenge_groups ;;

  dimension: challenge_id {
    type: number
    sql: ${TABLE}.challenge_id ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
