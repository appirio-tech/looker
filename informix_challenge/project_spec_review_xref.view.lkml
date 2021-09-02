view: project_spec_review_xref {
  sql_table_name: tcs_dw.project_spec_review_xref ;;

  dimension: project_id {
    type: number
    # hidden: true
    sql: ${TABLE}.project_id ;;
  }

  dimension: spec_review_project_id {
    type: number
    sql: ${TABLE}.spec_review_project_id ;;
  }

  measure: count {
    type: count
    drill_fields: [project.component_name, project.review_phase_name, project.project_category_name, project.client_project_id]
  }
}
