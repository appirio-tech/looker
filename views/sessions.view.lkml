view: sessions {
  sql_table_name: heapdata.sessions ;;
  drill_fields: [session_id]

  dimension: session_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.session_id ;;
  }

  dimension: app_name {
    type: string
    sql: ${TABLE}.app_name ;;
  }

  dimension: app_version {
    type: string
    sql: ${TABLE}.app_version ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: event_id {
    type: number
    sql: ${TABLE}.event_id ;;
  }

  dimension: heap_app_name {
    type: string
    sql: ${TABLE}.heap_app_name ;;
  }

  dimension: heap_app_version {
    type: string
    sql: ${TABLE}.heap_app_version ;;
  }

  dimension: heap_device {
    type: string
    sql: ${TABLE}.heap_device ;;
  }

  dimension: heap_device_id {
    type: string
    sql: ${TABLE}.heap_device_id ;;
  }

  dimension: ip {
    type: string
    sql: ${TABLE}.ip ;;
  }

  dimension: landing_page {
    type: string
    sql: ${TABLE}.landing_page ;;
  }

  dimension: landing_page_hash {
    type: string
    sql: ${TABLE}.landing_page_hash ;;
  }

  dimension: landing_page_query {
    type: string
    sql: ${TABLE}.landing_page_query ;;
  }

  dimension: library {
    type: string
    sql: ${TABLE}.library ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: search_keyword {
    type: string
    sql: ${TABLE}.search_keyword ;;
  }

  dimension_group: time {
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
    sql: ${TABLE}.time ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: utm_content {
    type: string
    sql: ${TABLE}.utm_content ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_term {
    type: string
    sql: ${TABLE}.utm_term ;;
  }

  measure: count {
    type: count
    drill_fields: [session_id, heap_app_name, app_name, profile_events_success_login.count]
  }
}
