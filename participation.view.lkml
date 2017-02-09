view: participation {
  sql_table_name: tcs_dw.participation ;;

  dimension_group: participation {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.participation_date ;;
  }

  dimension: participation_type {
    type: number
    sql: ${TABLE}.participation_type ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
