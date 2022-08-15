# The name of this view in Looker is "Auth0"
view: auth0 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: spectrum.auth0 ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " ID" in Explore.

  dimension: _id {
    type: string
    sql: ${TABLE}._id ;;
  }

  dimension: auth0_client {
    type: string
    sql: ${TABLE}.auth0_client ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: collector_id {
    type: number
    sql: ${TABLE}.collector_id ;;
  }

  dimension: connection {
    type: string
    sql: ${TABLE}.connection ;;
  }

  dimension: connection_id {
    type: string
    sql: ${TABLE}.connection_id ;;
  }

  dimension: count_auth0 {
    type: string
    sql: ${TABLE}.count ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: day {
    type: number
    sql: ${TABLE}.day ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_day {
    type: sum
    sql: ${day} ;;
  }

  measure: average_day {
    type: average
    sql: ${day} ;;
  }

  dimension: details {
    type: string
    sql: ${TABLE}.details ;;
  }

  dimension: encoding {
    type: string
    sql: ${TABLE}.encoding ;;
  }

  dimension: format {
    type: string
    sql: ${TABLE}.format ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: ip {
    type: string
    sql: ${TABLE}.ip ;;
  }

  dimension: ismobile {
    type: yesno
    sql: ${TABLE}.ismobile ;;
  }

  dimension: log_id {
    type: string
    sql: ${TABLE}.log_id ;;
  }

  dimension: message_id {
    type: number
    sql: ${TABLE}.message_id ;;
  }

  dimension: message_time {
    type: number
    sql: ${TABLE}.message_time ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: receipt_time {
    type: number
    sql: ${TABLE}.receipt_time ;;
  }

  dimension: session_connection {
    type: string
    sql: ${TABLE}.session_connection ;;
  }

  dimension: sessionid {
    type: string
    sql: ${TABLE}.sessionid ;;
  }

  dimension: source_category {
    type: string
    sql: ${TABLE}.source_category ;;
  }

  dimension: source_host {
    type: string
    sql: ${TABLE}.source_host ;;
  }

  dimension: source_id {
    type: number
    sql: ${TABLE}.source_id ;;
  }

  dimension: source_name {
    type: string
    sql: ${TABLE}.source_name ;;
  }

  dimension: strategy {
    type: string
    sql: ${TABLE}.strategy ;;
  }

  dimension: strategy_type {
    type: string
    sql: ${TABLE}.strategy_type ;;
  }

  dimension: timestamp {
    type: number
    sql: ${TABLE}.timestamp ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: view {
    type: string
    sql: ${TABLE}.view ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [source_name, client_name, hostname, user_name]
  }
}
