view: skill {
  sql_table_name: tcs_dw.skill ;;

  dimension: skill_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.skill_id ;;
  }

  dimension: categories {
    type: string
    description: "categorise skills into basic groups and combinations of these - Design, Develop and Data Science"
    sql: ${TABLE}.categories ;;
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

  dimension: name {
    type: string
    description: "Skill name"
    sql: ${TABLE}.name ;;
  }

  dimension: priority {
    type: number
    description: "skill priority with 1 being high on priority and 15 being last on priority"
    sql: ${TABLE}.priority ;;
  }

  dimension: status {
    type: string
    description: "shows whether the skill is approved or not"
    sql: ${TABLE}.status ;;
  }

  dimension: synonyms {
    type: string
    description: "alternate name for a particular skill e.g. .NET includes .NET2.0, .NET3.0, .NET3.5 etc."
    sql: ${TABLE}.synonyms ;;
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

  measure: count {
    type: count
    drill_fields: [skill_id, name, member_skill.count]
  }
}
