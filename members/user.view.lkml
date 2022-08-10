view: user {
  sql_table_name: tcs_dw.coder ;;

  dimension: coder_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.coder_id ;;
    tags: ["user_id"]
  }

  dimension: country_code {
    type: string
    # hidden: true
    sql: ${TABLE}.country_code ;;
  }

  dimension: activation_code {
    type: string
    sql: ${TABLE}.activation_code ;;
    hidden: yes
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.address1 ;;
    hidden: yes

  }

  #---- Regular Expression to find Topgear email domains ----------------#
  dimension: user_segment {
    description: "Segregate user on basis of their email Ids"
    case: {
      when: {
        sql: regexp_instr(${TABLE}.email, '@wipro.com|@appirio.com|@womensbusinesspark.com') > 0;;
        label: "Topgear"
      }
      when: {
        sql: CHARINDEX('@topcoder.com', ${TABLE}.email) > 0 ;;
        label: "Employee"
      }
      else: "Community"
    }
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.address2 ;;
    hidden: yes
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: coder_type_id {
    type: number
    sql: ${TABLE}.coder_type_id ;;
    hidden: yes
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
      quarter,
      fiscal_year,
      fiscal_quarter,
      fiscal_month_num,
      fiscal_quarter_of_year
    ]
    sql: ${TABLE}.create_date ;;
  }

  #--------------------Not Relevant ---------------------------#
  dimension_group: dw_stats_updated {
    hidden: yes
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_year,
      fiscal_quarter,
      fiscal_month_num,
      fiscal_quarter_of_year
    ]
    sql: ${TABLE}.dw_stats_updated_time ;;
  }

  dimension: editor_id {
    type: number
    sql: ${TABLE}.editor_id ;;
    hidden: yes
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    tags: ["email"]
  }

  dimension: employer_search {
    type: string
    sql: ${TABLE}.employer_search ;;
    hidden: yes
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

  dimension: home_phone {
    type: string
    sql: ${TABLE}.home_phone ;;
  }

  dimension: image {
    type: number
    sql: ${TABLE}.image ;;
    hidden: yes
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
      quarter,
      fiscal_quarter,
      fiscal_month_num,
      fiscal_year,
      fiscal_quarter_of_year
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
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.last_site_hit_date ;;
  }

  #----------------------Start Membership Tier definition -----------------------------------#

  dimension: tenure_tier_months {
    type: tier
    tiers: [0, 1, 3, 6, 12, 24, 36, 48, 60, 72, 84, 96, 120]
    description: "Bucket the Membership Months into tiers"
    style: relational # the default value, could be excluded
    sql: ${tenure_months} ;;
    value_format: "0 \"Months\""
  }

  dimension: tenure_months {
    type: number
    description: "User has been member since how many months i.e. (TODAY - Member Since)"
    sql: DATEDIFF('months', ${TABLE}.member_since,GETDATE()) ;;
  }

  dimension: tenure_tier_days {
    type: tier
    tiers: [0, 30, 60, 90, 180, 365]
    description: "Bucket the Membership Days into tiers"
    style: relational # the default value, could be excluded
    sql: ${tenure_days} ;;
    value_format: "0 \"Days\""
  }

  dimension: tenure_days {
    type: number
    description: "User has been member since how many days i.e. (TODAY - Member Since)"
    sql: DATEDIFF('days', ${TABLE}.member_since,GETDATE()) ;;
  }

  dimension_group: member_since {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.member_since ;;
  }

  #----------------------End Membership Tier definition -----------------------------------#

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
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.modify_date ;;
  }

  dimension: notify {
    type: string
    sql: ${TABLE}.notify ;;
    hidden: yes
  }

  dimension: notify_inquiry {
    type: string
    sql: ${TABLE}.notify_inquiry ;;
    hidden: yes
  }

  dimension: reg_source {
    type: string
    sql: ${TABLE}.reg_source ;;
  }

  dimension: relocate {
    type: string
    sql: ${TABLE}.relocate ;;
    hidden: yes
  }

  dimension: state_code {
    type: string
    sql: UPPER(${TABLE}.state_code) ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: status_desc {
    type: string
    description: "User Status Description"
    case: {
      when: {
        sql: ${TABLE}.status = 'A' ;;
        label: "Active"
      }
      when: {
        sql: ${TABLE}.status = 'U' ;;
        label: "Unverified"
      }
      when: {
        sql: ${TABLE}.status = 'I' ;;
        label: "Not Activated"
      }
      when: {
        sql: ${TABLE}.status = '4' ;;
        label: "Deactivated - User Request"
      }
      when: {
        sql: ${TABLE}.status = '5' ;;
        label: "Deactivated - Duplicate Account"
      }
      when: {
        sql: ${TABLE}.status = '6' ;;
        label: "Deactivated - Cheating Account"
      }
      else: "Deactivated - Unknown Reason"
    }
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
    hidden: yes
  }

  dimension: avatar {
    sql: ${photo_url_full};;
    html: <img src="{{ value }}" width="150" height="150"/> ;;
    hidden: yes
  }

  dimension:  payment_method_desc {
    type: string
    sql:  ${TABLE}.payment_method_desc;;
    description: "Payment method name like paypal, western union and payoneer etc "
  }


  dimension_group: payment_method_modify {
    type: time
    description: "When did the user last update their payment method"
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.payment_method_modify_date ;;
  }

#  dimension: is_copilot {
#    type:  string
#    case: {
#      when: {
#        sql: $ ${copilot_user.handle} is null ;;
#        label: "0"
#      }
#      when: {
#        sql: ${copilot_user.handle} is not null ;;
#        label: "1"
#      }
#      else: "0"
#    }
#  }

  measure: count {
    type: count
    drill_fields: [
      profile_link,
      first_name,
      last_name
    ]
  }

  #Added Count Distinct for handle
  measure: distinct_user {
    type: count_distinct
    sql: ${coder_id} ;;
    drill_fields: [
      profile_link,
      first_name,
      last_name
    ]
  }

  # The set of fields that are displayed when drilled from engagement metrics explore
  set: engagement_drill_fields {
    fields: [ create_week, count]
  }

}
