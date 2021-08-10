view: member_skill {
  sql_table_name: tcs_dw.member_skill ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: challenge {
    type: yesno
    description: "If the Skill source is a challenge i.e. user has participated in a challenge that required this skill"
    sql: ${TABLE}.challenge ;;
  }

  dimension: priority_source {
    description: "Priority Source. A skill can be sourced from either Challenge, External or User Entered. Priority is taken for Challenge, external and Internal"
    type: string
    sql: CASE
          WHEN ${TABLE}.challenge = true THEN 'Challenge'
          WHEN ${TABLE}.external  = true THEN 'External'
          WHEN ${TABLE}.user_entered = true THEN 'User Entered'
          ELSE 'Other'
        END ;;
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

  dimension: external {
    type: yesno
    description: "Skill imported from a connected user account e.g. Stack Overflow"
    sql: ${TABLE}.external ;;
  }

  dimension: deleted {
    type: yesno
    description: "Yes implies skill has been removed / deleted by the user or system"
    sql: ${TABLE}.hidden ;;
  }

  dimension: json {
    type: string
    hidden: yes
    sql: ${TABLE}.json ;;
  }

  dimension: score {
    type: number
    description: "Relative strength of skil (computed by the system). A higher score denotes better expertise on the skill"
    sql: ${TABLE}.score ;;
  }

  dimension: skill_id {
    type: number
    hidden: yes
    sql: ${TABLE}.skill_id ;;
  }

  dimension: source {
    type: string
    description: "Source for skill - User Entered or based on Challenge participated"
    sql: ${TABLE}.source ;;
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

  dimension: user_entered {
    type: yesno
    description: "Skill has been entered by user"
    sql: ${TABLE}.user_entered ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, skill.skill_id, skill.name]
    link: {
      label: "View Users"
      url: "/explore/member_profile/member_profile_all?fields=user.profile_link,member_profile_all.reporting_country,computed_skills.challenge_derived_skill,computed_skills.user_entered_skill&f[skill.name]={{ skill.name }}&f[computed_skills.challenge_derived_skill]=&f[computed_skills.user_entered_skill]=&f[member_profile_all.status]=ACTIVE&f[member_profile_all.handle]=-tcwebservice&f[group.name]=%25TaaS%25&f[member_profile_all.email]=-%25topcoder.com%2C-%25wipro.com&f[member_stats.maximum_rating]=%3E0%2CNOT+NULL&f[member_skill.source]=%25CHALLENGE%25&sorts=user.handle"
      icon_url: "https://looker.com/favicon.ico"
    }
  }

}
