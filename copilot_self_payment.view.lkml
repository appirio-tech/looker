view: copilot_self_payment {
  derived_table: {
    sql: SELECT project.project_id, project_category_name, status_desc, copilot, handle, posting_date, scheduled_end_date,tco_flag
      FROM project INNER JOIN
      ( select project_id, user_id from project_result where submit_ind = 1
       union all
       select project_id, user_id from design_project_result where submit_ind = 1
      ) AS project_result
      ON project.project_id = project_result.project_id
      INNER JOIN coder ON coder.coder_id = project.copilot
      where project.copilot = project_result.user_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: project_id {
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension: project_category_name {
    type: string
    sql: ${TABLE}.project_category_name ;;
  }

  dimension: status_desc {
    type: string
    sql: ${TABLE}.status_desc ;;
  }

  dimension: copilot {
    type: number
    sql: ${TABLE}.copilot ;;
  }

  dimension: handle {
    type: string
    sql: ${TABLE}.handle ;;
  }

  dimension_group: posting_date {
    type: time
    sql: ${TABLE}.posting_date ;;
  }

  dimension_group: scheduled_end_date {
    type: time
    sql: ${TABLE}.scheduled_end_date ;;
  }

  dimension: tco_flag {
    type: number
    sql: ${TABLE}.tco_flag ;;
  }

  set: detail {
    fields: [
      project_id,
      project_category_name,
      status_desc,
      copilot,
      handle,
      posting_date_time,
      scheduled_end_date_time,
      tco_flag
    ]
  }
}
