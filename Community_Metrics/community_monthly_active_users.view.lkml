view: community_monthly_active_users {
  sql_table_name: heapdata.community_monthly_active_users ;;

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
