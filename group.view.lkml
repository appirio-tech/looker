view: group {
  sql_table_name: "authorization"."group"
    ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    tags: ["segment_group_id"]
  }

  dimension_group: createdat {
    type: time
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
    sql: ${TABLE}.createdat ;;
  }

  dimension: createdby {
    type: number
    sql: ${TABLE}.createdby ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: modifiedat {
    type: time
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
    sql: ${TABLE}.modifiedat ;;
  }

  dimension: modifiedby {
    type: number
    sql: ${TABLE}.modifiedby ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    tags: ["group_name"]
    link: {
      label: "View Users"
      url: "/explore/member_profile/member_profile_all?fields=user.handle,member_profile_all.reporting_country,computed_skills.challenge_derived_skill,computed_skills.user_entered_skill&f[group.name]={{ group.name }}&f[member_profile_all.status]=ACTIVE&f[member_profile_all.handle]=-tcwebservice&f[member_profile_all.email]=-%25topcoder.com&sorts=user.handle"
      icon_url: "https://looker.com/favicon.ico"
    }
  }

  measure: count {
    type: count
    drill_fields: [id, name, group_membership.count]
  }
}
