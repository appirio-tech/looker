view: duplicate_resource {

  sql_table_name: tcs_dw.support_duplicate_resource ;;

  dimension: challenge_id {
    type: number
    description: "Challenge ID"
    sql: ${TABLE}.project_id ;;
  }

  dimension: user_id {
    type: number
    description: "User Id"
    sql: ${TABLE}.user_id ;;
  }

  measure: resource_count {
    type: sum
    description: "Record Count"
    sql: ${TABLE}.duplicate_count ;;
  }

  measure: record_count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields:[challenge_id, user_id, resource_count]
  }
}
