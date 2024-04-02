view: skill {
  sql_table_name: tcs_dw.skill ;;

  dimension: skill_id {
    primary_key: yes
    type: number
    hidden: no
    sql: ${TABLE}.skill_id ;;
  }

  dimension: categories {
    type: string
    description: "categorise skills into basic groups and combinations of these - Design, Develop and Data Science"
    sql: ${TABLE}.categories ;;
  }


  dimension: name {
    type: string
    description: "Technology / Skill Name"
    sql: ${TABLE}.name ;;
  }

  #24th May 2019
  #Added a dimension for displaying a comma seperated list of skills
  dimension: Skill_list {
    type :  string
    hidden: yes
    label: "Skill List"
    description: " Technology Skill"
    sql: LISTAGG( name , ',') ;;
  }

  dimension: priority {
    type: number
    description: "skill priority with 1 being high on priority and 15 being last on priority"
    sql: ${TABLE}.priority ;;
  }

  dimension: status {
    type: string
    hidden: yes
    description: "shows whether the skill is approved or not"
    sql: ${TABLE}.status ;;
  }

  dimension: synonyms {
    type: string
    description: "alternate name for a particular skill e.g. .NET includes .NET2.0, .NET3.0, .NET3.5 etc."
    sql: ${TABLE}.synonyms ;;
  }

  measure: count {
    type: count
    drill_fields: [skill_id, name, member_skill.count]
  }
}
