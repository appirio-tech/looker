# The name of this view in Looker is "Bookings Work Period Payments"
view: work_period_payments {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.bookings_work_period_payments ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Amount" in Explore.

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

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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
    hidden: yes
    sql: ${amount} ;;
  }

  measure: average_amount {
    type: average
    hidden: yes
    sql: ${amount} ;;
  }

  measure: total_customer_rate {
    type: sum
    hidden: yes
    sql: ${customer_rate} ;;
  }

  measure: average_customer_rate {
    type: average
    hidden: yes
    sql: ${customer_rate} ;;
  }

  measure: total_days {
    type: sum
    hidden: yes
    sql: ${days} ;;
  }

  measure: average_days {
    type: average
    hidden: yes
    sql: ${days} ;;
  }

  measure: total_member_rate {
    type: sum
    hidden: yes
    sql: ${member_rate} ;;
  }

  measure: average_member_rate {
    type: average
    hidden: yes
    sql: ${member_rate} ;;
  }
}
