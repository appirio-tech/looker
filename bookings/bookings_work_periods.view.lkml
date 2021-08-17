# The name of this view in Looker is "Bookings Work Periods"
view: work_periods {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.bookings_work_periods ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Created By" in Explore.

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

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_days_worked {
    type: sum
    hidden: yes
    sql: ${days_worked} ;;
  }

  measure: average_days_worked {
    type: average
    hidden: yes
    sql: ${days_worked} ;;
  }

  measure: total_payment_total {
    type: sum
    hidden: yes
    sql: ${payment_total} ;;
  }

  measure: average_payment_total {
    type: average
    hidden: yes
    sql: ${payment_total} ;;
  }
}
