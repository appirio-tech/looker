# The name of this view in Looker is "Bookings Work Period Payments"
view: work_period_payments {

  label: "Work Period Payments (Connect)"
  sql_table_name: public.bookings_work_period_payments ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: billing_account_id {
    type: number
    sql: ${TABLE}.billing_account_id ;;
  }

  dimension: challenge_id {
    type: string
    sql: ${TABLE}.challenge_id ;;
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

  dimension: customer_rate {
    type: number
    sql: ${TABLE}.customer_rate ;;
  }

  dimension: days {
    type: number
    sql: ${TABLE}.days ;;
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

  dimension: member_rate {
    type: number
    sql: ${TABLE}.member_rate ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
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

  dimension: work_period_id {
    type: string
    sql: ${TABLE}.work_period_id ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [id]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
  }

  measure: average_amount {
    type: average
    sql: ${amount} ;;
  }

  measure: average_customer_rate {
    type: average
    sql: ${customer_rate} ;;
  }

  measure: total_days {
    type: sum
    sql: ${days} ;;
  }

  measure: average_days {
    type: average
    sql: ${days} ;;
  }

  measure: total_member_rate {
    type: sum
    hidden: yes
    sql: ${member_rate} ;;
  }

  measure: average_member_rate {
    type: average
    sql: ${member_rate} ;;
  }
}
