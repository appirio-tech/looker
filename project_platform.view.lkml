view: challenge_platform {
  sql_table_name: tcs_dw.project_platform ;;

  dimension: project_platform_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.project_platform_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: project_id {
    type: number
    # hidden: true
    sql: ${TABLE}.project_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      project_platform_id,
      name,
      project.component_name,
      project.review_phase_name,
      project.project_category_name,
      project.client_project_id
    ]
  }
}
