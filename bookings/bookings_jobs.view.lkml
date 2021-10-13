view: jobs {
  #this job view is coming from Connect TaaS object.
  label: "TaaS Job (Connect)"

  sql_table_name: public.bookings_jobs ;;
  drill_fields: [id, title,status,min_salary ,max_salary ,hours_per_week ,
      job_location ,job_timezone ,currency ,show_in_hot_list ,featured,hot_list_excerpt ,
      job_tag ,skill_ids ,skill_names , duration,num_positions, rate_type, resource_type,
      created_date, updated_date ]

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

  dimension: min_salary {
    description: "Minimum Salary offered on the Job"
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.min_salary ;;
  }

  dimension: max_salary {
    description: "Maximum Salary offered on the job"
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.max_salary ;;
  }

  dimension: hours_per_week {
    description: "No of hours per week"
    type: number
    sql: ${TABLE}.hours_per_week ;;
  }

  dimension: job_location {
    type: string
    sql: ${TABLE}.job_location ;;
  }

  dimension: job_timezone {
    description: "Timezone the work is expected to carry out"
    type: string
    sql: ${TABLE}.job_timezone ;;
  }

  dimension: currency {
    description: "Client Currency"
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: show_in_hot_list {
    description: "Is this job needs to shown in Hotlist ?"
    type: yesno
    sql: ${TABLE}.show_in_hot_list ;;
  }


  dimension: featured {
    description: "Is this job featured ?"
    type: yesno
    sql: ${TABLE}.featured ;;
  }

  dimension: hot_list_excerpt {
    description: "Blurb associated with job hot list description"
    type: string
    sql: ${TABLE}.hot_list_excerpt ;;
  }

  dimension: job_tag {
    description: "Custom tags applied to the Job"
    type: string
    sql: ${TABLE}.job_tag ;;
  }

  dimension: skill_ids {
    description: "Comma separated list of Skill Ids"
    type: string
    sql: ${TABLE}.skill_ids ;;
  }

  dimension: skill_names {
    description: "Comma separated list of skill names on the job"
    type: string
    sql: ${TABLE}.skill_names ;;
  }
  dimension: created_by {
    description: "created by user"
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension_group: deleted {
    description: "If the record is deleted, this will have a value"
    hidden: yes
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
    hidden: yes
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: is_application_page_active {
    description: "is the application page active ?"
    type: yesno
    sql: ${TABLE}.is_application_page_active ;;
  }

  dimension: num_positions {
    description: "Count of Positions available"
    type: number
    sql: ${TABLE}.num_positions ;;
  }

  dimension: project_id {
    description: "Connect Project ID"
    hidden: yes
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
    type: string
    sql: ${TABLE}.workload ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
