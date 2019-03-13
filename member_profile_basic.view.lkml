view: member_profile_basic {
  sql_table_name: tcs_dw.member_profile ;;

  dimension: address_type {
    type: string
    hidden: yes
    description: "Address given is an office address or home address"
    sql: ${TABLE}.address_type ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: competition_country_code {
    type: string
    description: "Country code for the country the member is competing in"
    sql: ${TABLE}.competition_country_code ;;
  }

  dimension_group: created {
    type: time
    hidden: yes
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
    type: number
    hidden: yes
    sql: ${TABLE}.created_by ;;
  }

  dimension: description {
    type: string
    hidden: yes
    description: "Brief description about the member"
    sql: ${TABLE}.description ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_verify_token {
    type: string
    hidden: yes
    sql: ${TABLE}.email_verify_token ;;
  }

  dimension_group: email_verify_token {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.email_verify_token_date ;;
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

  dimension: home_country_code {
    type: string
    description: "Country code for the country member belong to"
    sql: ${TABLE}.home_country_code ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: new_email {
    type: string
    hidden: yes
    sql: ${TABLE}.new_email ;;
  }

  dimension: other_lang_name {
    type: string
    hidden: yes
    sql: ${TABLE}.other_lang_name ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: quote {
    type: string
    hidden: yes
    description: "One line that represents member"
    sql: ${TABLE}.quote ;;
  }

  dimension: state_code {
    type: string
    hidden: yes
    sql: ${TABLE}.state_code ;;
  }

  dimension: status {
    type: string
    description: "Status of the member account - Active, Inactive, Unverified etc."
    sql: ${TABLE}.status ;;
  }

  dimension: street_address_1 {
    type: string
    hidden: yes
    sql: ${TABLE}.street_address_1 ;;
  }

  dimension: street_address_2 {
    type: string
    hidden: yes
    sql: ${TABLE}.street_address_2 ;;
  }

  dimension: tracks {
    type: string
    description: "Design, develop, data science or any of them in combination"
    sql: ${TABLE}.tracks ;;
  }

  dimension_group: updated {
    type: time
    hidden: yes
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
    type: number
    hidden: yes
    sql: ${TABLE}.updated_by ;;
  }

  dimension: user_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: zip {
    type: zipcode
    hidden: yes
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [other_lang_name, last_name, first_name]
  }

  measure: handle_count {
    type :  count_distinct
    sql: ${TABLE}.handle ;;

  }
}
