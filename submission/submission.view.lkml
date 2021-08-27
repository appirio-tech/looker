view: submission {
  sql_table_name: tcs_dw.submission ;;

  dimension: submission_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.submission_id ;;
  }

  dimension: project_id {
    type: number
    # hidden: true
    sql: ${TABLE}.project_id ;;
  }

  dimension: submission_type {
    type: number
    sql: ${TABLE}.submission_type ;;
  }

  dimension: submission_url {
    type: string
    sql: ${TABLE}.submission_url ;;
  }

  dimension: external_url {
    type: string
    description: "S3 Bucket Url or External Url used for private communities"
    sql: ${TABLE}.submission_url_external ;;
  }

  dimension: submitter_id {
    type: number
    sql: ${TABLE}.submitter_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      submission_id,
      project.component_name,
      project.review_phase_name,
      project.project_category_name,
      project.client_project_id,
      design_project_result.count
    ]
  }
}
