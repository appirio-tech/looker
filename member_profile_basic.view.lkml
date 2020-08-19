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
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
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
    tags: ["email"]
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
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
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

  dimension: profile_link {
    sql: ${TABLE}.handle ;;
    link: {
      label: "Profile"
      url: "https://www.topcoder.com/members/{{ value }}"
      icon_url: ""
    }
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
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
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
    tags: ["user_id"]
  }

  dimension: zip {
    type: zipcode
    hidden: yes
    sql: ${TABLE}.zip ;;
  }

#added on 2nd July 2019
  dimension: home_country {
    type: string
    description: "Country name for the country member belong to"
    sql: ${TABLE}.home_country_name ;;

  }

  #added on 2nd July 2019
  dimension: competition_country {
    type: string
    description: "Country name for the country member is competing in"
    sql: ${TABLE}.competition_country_name ;;

  }

  #added on 2nd July 2019
  dimension: reporting_country {
    type: string
    description: "There are 3 countries in the system. Shows reporting country based on logic ( Competition Country > Home Country > Mailing Country)"

    sql: CASE
         WHEN ${TABLE}.competition_country_name is not null
           THEN  ${TABLE}.competition_country_name
         WHEN ${TABLE}.home_country_name is not null
           THEN ${TABLE}.home_country_name
        ELSE Null
    END;;
  }

  #Added on 18th Aug 2020

  dimension: track {
    type: string
    description: "Track associated with Maximum rating"
    group_label: "Maximum Rating"
    sql: ${TABLE}.track ;;
  }

  dimension: sub_track {
    type: string
    description: "Sub track associated with Maximum rating"
    group_label: "Maximum Rating"
    sql: ${TABLE}.sub_track ;;
  }

  dimension: rating_color {
    type: string
    description: "Color coding corrosponding to Maximum rating"
    group_label: "Maximum Rating"
    sql: ${TABLE}.rating_color ;;
  }

  dimension: max_rating {
    type: number
    description: "Maximum rating for a user irresepctive of track"
    group_label: "Maximum Rating"
    sql: ${TABLE}.max_rating ;;
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
