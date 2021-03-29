view: gigs_apply_button_application_page {
  sql_table_name: heapdata.gigs_apply_button_application_page ;;

  dimension: blog_category {
    type: string
    sql: ${TABLE}.blog_category ;;
  }

  dimension: breadcrumb {
    type: string
    sql: ${TABLE}.breadcrumb ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: browser_type {
    type: string
    sql: ${TABLE}.browser_type ;;
  }

  dimension: card_author {
    type: string
    sql: ${TABLE}.card_author ;;
  }

  dimension: card_tags {
    type: string
    sql: ${TABLE}.card_tags ;;
  }

  dimension: card_title {
    type: string
    sql: ${TABLE}.card_title ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: continent {
    type: string
    sql: ${TABLE}.continent ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: event_id {
    type: number
    sql: ${TABLE}.event_id ;;
  }

  dimension: google_referrer {
    type: string
    sql: ${TABLE}.google_referrer ;;
  }

  dimension: hash {
    type: string
    sql: ${TABLE}.hash ;;
  }

  dimension: heap_device_id {
    type: string
    sql: ${TABLE}.heap_device_id ;;
  }

  dimension: heap_previous_page {
    type: string
    sql: ${TABLE}.heap_previous_page ;;
  }

  dimension: href {
    type: string
    sql: ${TABLE}.href ;;
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

  dimension: marketing_channel {
    type: string
    sql: ${TABLE}.marketing_channel ;;
  }

  dimension: overview_text {
    type: string
    sql: ${TABLE}.overview_text ;;
  }

  dimension: page_type {
    type: string
    sql: ${TABLE}.page_type ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}.path ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: project_type {
    type: string
    sql: ${TABLE}.project_type ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: quora_referrer {
    type: string
    sql: ${TABLE}.quora_referrer ;;
  }

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: search_engine {
    type: string
    sql: ${TABLE}.search_engine ;;
  }

  dimension: search_keyword {
    type: string
    sql: ${TABLE}.search_keyword ;;
  }

  dimension: session_id {
    type: number
    sql: ${TABLE}.session_id ;;
  }

  dimension_group: session {
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
    sql: ${TABLE}.session_time ;;
  }

  dimension: social_network {
    type: string
    sql: ${TABLE}.social_network ;;
  }

  dimension: solution_name {
    type: string
    sql: ${TABLE}.solution_name ;;
  }

  dimension: solution_name_script_alert_8_script_ {
    type: string
    sql: ${TABLE}.solution_name_script_alert_8_script_ ;;
  }

  dimension: subscribe_email {
    type: string
    sql: ${TABLE}.subscribe_email ;;
  }

  dimension: taas_job_name {
    type: string
    sql: ${TABLE}.taas_job_name ;;
  }

  dimension: target_text {
    type: string
    sql: ${TABLE}.target_text ;;
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

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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

  dimension: youtube_referrer {
    type: string
    sql: ${TABLE}.youtube_referrer ;;
  }

  measure: count {
    type: count
    drill_fields: [taas_job_name, solution_name]
  }
}
