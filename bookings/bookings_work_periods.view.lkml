# The name of this view in Looker is "Bookings Work Periods"
view: work_periods {
  label: "Work Periods (Connect)"

  sql_table_name: public.bookings_work_periods ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: days_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.days_paid ;;
  }

  dimension: days_worked {
    type: number
    sql: ${TABLE}.days_worked ;;
  }

  dimension_group: deleted {
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
    sql: ${TABLE}.deleted_at ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date ;;
  }

  dimension: payment_status {
    type: string
    sql: ${TABLE}.payment_status ;;
  }

  dimension: payment_total {
    type: number
    sql: ${TABLE}.payment_total ;;
  }

  dimension: project_id {
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension: resource_booking_id {
    type: string
    sql: ${TABLE}.resource_booking_id ;;
  }

  dimension: sent_survey {
    type: yesno
    sql: ${TABLE}.sent_survey ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: updated_by {
    type: string
    sql: ${TABLE}.updated_by ;;
  }

  dimension: user_handle {
    type: string
    sql: ${TABLE}.user_handle ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: total_days_worked {
    type: sum
    sql: ${days_worked} ;;
  }

  measure: average_days_worked {
    type: average
    sql: ${days_worked} ;;
  }

  measure: total_payment_total {
    type: sum
    sql: ${payment_total} ;;
  }

  measure: average_payment_total {
    type: average
    sql: ${payment_total} ;;
  }
}
