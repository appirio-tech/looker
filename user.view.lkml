view: user {
  sql_table_name: tcs_dw.coder ;;

  dimension: coder_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.coder_id ;;
  }

  dimension: country_code {
    type: string
    # hidden: true
    sql: ${TABLE}.country_code ;;
  }

  dimension: activation_code {
    type: string
    sql: ${TABLE}.activation_code ;;
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.address1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.address2 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: coder_type_id {
    type: number
    sql: ${TABLE}.coder_type_id ;;
  }

  dimension: comp_country_code {
    type: string
    sql: ${TABLE}.comp_country_code ;;
  }

  dimension_group: create {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.create_date ;;
  }

  dimension_group: dw_stats_updated {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.dw_stats_updated_time ;;
  }

  dimension: editor_id {
    type: number
    sql: ${TABLE}.editor_id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: employer_search {
    type: string
    sql: ${TABLE}.employer_search ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: handle {
    type: string
    sql: ${TABLE}.handle ;;
  }

  dimension: handle_lower {
    type: string
    sql: ${TABLE}.handle_lower ;;
  }

  dimension: home_phone {
    type: string
    sql: ${TABLE}.home_phone ;;
  }

  dimension: image {
    type: number
    sql: ${TABLE}.image ;;
  }

  dimension: language_id {
    type: number
    sql: ${TABLE}.language_id ;;
  }

  dimension_group: last_login {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.last_login ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension_group: last_site_hit {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.last_site_hit_date ;;
  }

  dimension_group: member_since {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.member_since ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension_group: modify {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.modify_date ;;
  }

  dimension: notify {
    type: string
    sql: ${TABLE}.notify ;;
  }

  dimension: notify_inquiry {
    type: string
    sql: ${TABLE}.notify_inquiry ;;
  }

  dimension: reg_source {
    type: string
    sql: ${TABLE}.reg_source ;;
  }

  dimension: relocate {
    type: string
    sql: ${TABLE}.relocate ;;
  }

  dimension: state_code {
    type: string
    sql: ${TABLE}.state_code ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: work_phone {
    type: string
    sql: ${TABLE}.work_phone ;;
  }

  dimension: zip {
    type: string
    sql: ${TABLE}.zip ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: photo_url_full {
    type: string
    sql: 'https://www.topcoder.com' || ${TABLE}.photo_url ;;
  }

  dimension: avatar {
    sql: ${photo_url_full};;
    html: <img src="{{ value }}" width="150" height="150"/> ;;
  }

  measure: count {
    type: count
    drill_fields: [
      coder_id,
      first_name,
      last_name,
      middle_name,
      handle,
      utm_campaign,
      utm_medium,
      utm_source,
      status
    ]
  }
}
