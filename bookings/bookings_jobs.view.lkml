view: jobs {

  sql_table_name: public.bookings_jobs ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    description: "Job id , unique identifier"
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    description: ""
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
    description: "created by user"
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension_group: deleted {
    description: ""
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
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: duration {
    description: "Duration of the Job"
    type: number
    sql: ${TABLE}.duration ;;
  }

  dimension: external_id {
    description: "External id mapped to the job id"
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: is_application_page_active {
    description: "is the application page active ?"
    type: yesno
    sql: ${TABLE}.is_application_page_active ;;
  }

  dimension: num_positions {
    description: "Positions available on the job"
    type: number
    sql: ${TABLE}.num_positions ;;
  }

  dimension: project_id {
    description: "Project mapped to the job "
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension: rate_type {
    description: "type of the rate associated"
    type: string
    sql: ${TABLE}.rate_type ;;
  }

  dimension: resource_type {
    description: "Type of the resource associated with the job"
    type: string
    sql: ${TABLE}.resource_type ;;
  }

  dimension_group: start {
    description: "Start date of the job"
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: status {
    description: "Status of the job"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: title {
    description: "Title of the job"
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension_group: updated {
    description: ""
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
    description: "Updated by "
    type: string
    sql: ${TABLE}.updated_by ;;
  }

  dimension: workload {
    description: "Workload"
    type: string
    sql: ${TABLE}.workload ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
