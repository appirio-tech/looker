view: auth_refresh_log {
  sql_table_name: tcs_dw.auth_refresh_log ;;

  dimension: handle {
    type: string
    sql: ${TABLE}.handle ;;
  }

  dimension_group: refresh {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.refresh_at ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  measure: count_unique {
    type: count_distinct
    description: "Count distinct user records"
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: []
  }
}
