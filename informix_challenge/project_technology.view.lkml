view: challenge_technology {
  sql_table_name: tcs_dw.project_technology ;;

  dimension: project_technology_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.project_technology_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: project_id {
    type: number
    hidden: yes
    sql: ${TABLE}.project_id ;;
  }

  dimension: challenge_id {
    type: number
    sql: ${TABLE}.project_id ;;
    link: {
      label: "Challenge Link"
      url: "https://www.topcoder.com/challenges/{{challenge_technology.project_id._value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      project_technology_id,
      name,
      project.component_name,
      project.review_phase_name,
      project.project_category_name,
      project.client_project_id
    ]
  }
}
