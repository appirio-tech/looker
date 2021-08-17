# The name of this view in Looker is "Bookings Interviews"
view: bookings_interviews {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.bookings_interviews ;;
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
  # This dimension will be called "Calendar Event ID" in Explore.

  dimension: calendar_event_id {
    type: string
    sql: ${TABLE}.calendar_event_id ;;
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

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
  }

  dimension_group: end_timestamp {
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
    sql: ${TABLE}.end_timestamp ;;
  }

  dimension: guest_emails {
    type: string
    sql: ${TABLE}.guest_emails ;;
  }

  dimension: guest_names {
    type: string
    sql: ${TABLE}.guest_names ;;
  }

  dimension: host_email {
    type: string
    sql: ${TABLE}.host_email ;;
  }

  dimension: host_name {
    type: string
    sql: ${TABLE}.host_name ;;
  }

  dimension: job_candidate_id {
    type: string
    sql: ${TABLE}.job_candidate_id ;;
  }

  dimension: location_details {
    type: string
    sql: ${TABLE}.location_details ;;
  }

  dimension: reschedule_url {
    type: string
    sql: ${TABLE}.reschedule_url ;;
  }

  dimension: round {
    type: number
    sql: ${TABLE}.round ;;
  }

  dimension_group: start_timestamp {
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
    sql: ${TABLE}.start_timestamp ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: template_id {
    type: string
    sql: ${TABLE}.template_id ;;
  }

  dimension: template_type {
    type: string
    sql: ${TABLE}.template_type ;;
  }

  dimension: template_url {
    type: string
    sql: ${TABLE}.template_url ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
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

  dimension: xai_id {
    type: string
    sql: ${TABLE}.xai_id ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [id, host_name]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_duration {
    type: sum
    hidden: yes
    sql: ${duration} ;;
  }

  measure: average_duration {
    type: average
    hidden: yes
    sql: ${duration} ;;
  }

  measure: total_round {
    type: sum
    hidden: yes
    sql: ${round} ;;
  }

  measure: average_round {
    type: average
    hidden: yes
    sql: ${round} ;;
  }
}
