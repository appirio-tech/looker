view: duplicate_review {

  sql_table_name: review_duplicate_check ;;

  measure: review_count {
    type: count
    drill_fields: [detail*]
  }

  dimension: Key {
    type: string
    description: "Artificial Primary key generated for internal use"
    sql: ${project_phase_id} || '-' || ${resource_id} || '-' || ${submission_id} ;;
  }

  dimension: review_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.review_id ;;
  }

  dimension: resource_id {
    type: number
    sql: ${TABLE}.resource_id ;;
  }

  dimension: submission_id {
    type: number
    sql: ${TABLE}.submission_id ;;
  }

  dimension: project_phase_id {
    type: number
    sql: ${TABLE}.project_phase_id ;;
  }

  dimension_group: create {
    type: time
    sql: ${TABLE}.create_date ;;
  }

  set: detail {
    fields: [review_id, resource_id, submission_id, project_phase_id, create_date]
  }
}
