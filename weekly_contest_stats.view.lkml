view: weekly_contest_stats {
  sql_table_name: tcs_dw.weekly_contest_stats ;;

  dimension: avg_contest_fees {
    type: number
    sql: ${TABLE}.avg_contest_fees ;;
  }

  dimension: avg_duration {
    type: number
    sql: ${TABLE}.avg_duration ;;
  }

  dimension: avg_fulfillment {
    type: number
    sql: ${TABLE}.avg_fulfillment ;;
  }

  dimension: avg_member_fees {
    type: number
    sql: ${TABLE}.avg_member_fees ;;
  }

  dimension: client_project_id {
    type: number
    sql: ${TABLE}.client_project_id ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: project_category_id {
    type: number
    sql: ${TABLE}.project_category_id ;;
  }

  dimension: tc_direct_project_id {
    type: number
    sql: ${TABLE}.tc_direct_project_id ;;
  }

  dimension: total_completed_contests {
    type: number
    sql: ${TABLE}.total_completed_contests ;;
  }

  dimension: total_failed_contests {
    type: number
    sql: ${TABLE}.total_failed_contests ;;
  }

  dimension: week {
    type: number
    sql: ${TABLE}.week ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
