view: member_skill {
  sql_table_name: tcs_dw.member_skill ;;

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: challenge {
    type: yesno
    description: "Skill based on challenge participation"
    sql: ${TABLE}.challenge ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}.created_by ;;
  }

  dimension: external {
    type: yesno
    sql: ${TABLE}.external ;;
  }

  dimension: hidden {
    type: yesno
    sql: ${TABLE}.hidden ;;
  }

  dimension: json {
    type: string
    hidden: yes
    sql: ${TABLE}.json ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: skill_id {
    type: number
    #hidden: yes
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
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: updated_by {
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  dimension: user_entered {
    type: yesno
    description: "Skill updated by user"
    sql: ${TABLE}.user_entered ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, skill.skill_id, skill.name]
  }
}
