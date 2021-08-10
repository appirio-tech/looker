#Member Participation
#Join the Member Table with the participation table to figure out the track the member has participated in
view: member_participation {
  derived_table: {
    sql: SELECT *,
        CASE    WHEN participation.participation_type = 1 THEN '1. SRM'
                WHEN participation.participation_type = 2 THEN '2. Marathon Match'
                WHEN participation.participation_type = 3 THEN '3. Develop'
                WHEN participation.participation_type = 4 THEN '4. Design'
                ELSE null
        END AS Track
FROM coder
LEFT JOIN participation
            ON coder.coder_id = participation.user_id
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: coder_id {
    type: number
    sql: ${TABLE}.coder_id ;;
  }

  dimension: state_code {
    type: string
    sql: ${TABLE}.state_code ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: home_phone {
    type: string
    sql: ${TABLE}.home_phone ;;
  }

  dimension: work_phone {
    type: string
    sql: ${TABLE}.work_phone ;;
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

  dimension: zip {
    type: string
    sql: ${TABLE}.zip ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: activation_code {
    type: string
    sql: ${TABLE}.activation_code ;;
  }

  dimension_group: member_since {
    type: time
    sql: ${TABLE}.member_since ;;
  }

  dimension: notify {
    type: string
    sql: ${TABLE}.notify ;;
  }

  dimension: quote {
    type: string
    sql: ${TABLE}.quote ;;
  }

  dimension: employer_search {
    type: string
    sql: ${TABLE}.employer_search ;;
  }

  dimension: relocate {
    type: string
    sql: ${TABLE}.relocate ;;
  }

  dimension_group: modify_date {
    type: time
    sql: ${TABLE}.modify_date ;;
  }

  dimension: editor_id {
    type: number
    sql: ${TABLE}.editor_id ;;
  }

  dimension: notify_inquiry {
    type: string
    sql: ${TABLE}.notify_inquiry ;;
  }

  dimension: language_id {
    type: number
    sql: ${TABLE}.language_id ;;
  }

  dimension: coder_type_id {
    type: number
    sql: ${TABLE}.coder_type_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension_group: last_login {
    type: time
    sql: ${TABLE}.last_login ;;
  }

  dimension: image {
    type: number
    sql: ${TABLE}.image ;;
  }

  dimension: comp_country_code {
    type: string
    sql: ${TABLE}.comp_country_code ;;
  }

  dimension_group: last_site_hit_date {
    type: time
    sql: ${TABLE}.last_site_hit_date ;;
  }

  dimension: reg_source {
    type: string
    sql: ${TABLE}.reg_source ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension_group: create_date {
    type: time
    sql: ${TABLE}.create_date ;;
  }

  dimension_group: dw_stats_updated_time {
    type: time
    sql: ${TABLE}.dw_stats_updated_time ;;
  }

  dimension: handle {
    type: string
    sql: ${TABLE}.handle ;;
  }

  dimension: handle_lower {
    type: string
    sql: ${TABLE}.handle_lower ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: participation_type {
    type: number
    sql: ${TABLE}.participation_type ;;
  }

  dimension_group: participation_date {
    type: time
    sql: ${TABLE}.participation_date ;;
  }

  dimension: track {
    type: string
    sql: ${TABLE}.track ;;
  }

  set: detail {
    fields: [
      coder_id,
      state_code,
      country_code,
      first_name,
      last_name,
      home_phone,
      work_phone,
      address1,
      address2,
      city,
      zip,
      middle_name,
      activation_code,
      member_since_time,
      notify,
      quote,
      employer_search,
      relocate,
      modify_date_time,
      editor_id,
      notify_inquiry,
      language_id,
      coder_type_id,
      status,
      email,
      last_login_time,
      image,
      comp_country_code,
      last_site_hit_date_time,
      reg_source,
      utm_source,
      utm_medium,
      utm_campaign,
      create_date_time,
      dw_stats_updated_time_time,
      handle,
      handle_lower,
      photo_url,
      user_id,
      participation_type,
      participation_date_time,
      track
    ]
  }
}
