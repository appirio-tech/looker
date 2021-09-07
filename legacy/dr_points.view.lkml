view: dr_points {
  sql_table_name: tcs_dw.dr_points ;;

  dimension: dr_points_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.dr_points_id ;;
  }

  dimension_group: application {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.application_date ;;
  }

  dimension_group: award {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.award_date ;;
  }

  dimension: dr_points_desc {
    type: string
    sql: ${TABLE}.dr_points_desc ;;
  }

  dimension: dr_points_operation_desc {
    type: string
    sql: ${TABLE}.dr_points_operation_desc ;;
  }

  dimension: dr_points_operation_id {
    type: number
    sql: ${TABLE}.dr_points_operation_id ;;
  }

  dimension: dr_points_reference_type_desc {
    type: string
    sql: ${TABLE}.dr_points_reference_type_desc ;;
  }

  dimension: dr_points_reference_type_id {
    type: number
    sql: ${TABLE}.dr_points_reference_type_id ;;
  }

  dimension: dr_points_status_desc {
    type: string
    sql: ${TABLE}.dr_points_status_desc ;;
  }

  dimension: dr_points_status_id {
    type: number
    sql: ${TABLE}.dr_points_status_id ;;
  }

  dimension: dr_points_type_desc {
    type: string
    sql: ${TABLE}.dr_points_type_desc ;;
  }

  dimension: dr_points_type_id {
    type: number
    sql: ${TABLE}.dr_points_type_id ;;
  }

  dimension: is_potential {
    type: yesno
    sql: ${TABLE}.is_potential ;;
  }

  dimension: reference_id {
    type: number
    sql: ${TABLE}.reference_id ;;
  }

  dimension: track_id {
    type: number
    # hidden: true
    sql: ${TABLE}.track_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [dr_points_id, track.track_id]
  }

  measure: amount {
    type: sum
    sql: ${TABLE}.amount ;;
  }
}
