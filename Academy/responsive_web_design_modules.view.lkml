view: responsive_web_design_modules {
  derived_table: {
    sql: select
      s.i as ss,
      s.i + 1 as module_number,
      user_id,
      json_extract_path_text(json_extract_array_element_text(modules, s.i),'module') as module_name,
      json_extract_path_text(json_extract_array_element_text(modules, s.i),'moduleStatus') as module_status,
      json_extract_path_text(json_extract_array_element_text(modules, s.i),'lessonCount') as lesson_count,
      course_id as course_id
      from academy.certification_progress,academy.sequence as s
      where course_id = 'b33cc02c-302d-4dd7-8e1d-7ad980477fd9' and s.i < json_array_length(modules)
       ;;
  }

  measure: count {
    type: count_distinct
    sql: ${module_name} ;;
  }


  measure: completed_modules {
    type: count
    filters: {
      field: module_status
      value: "completed"
    }
  }

  measure: in_progress_modules {
    type: count
    filters: {
      field: module_status
      value: "in-progress"
    }
  }

  measure: not_started_modules {
    type: count
    filters: {
      field: module_status
      value: "not-started"
    }
  }




  dimension: ss {
    type: number
    sql: ${TABLE}.ss ;;
  }

  dimension: module_number {
    type: number
    sql: ${TABLE}.module_number ;;
  }

  dimension: user_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: module_name {
    type: string
    sql: ${TABLE}.module_name ;;
  }

  dimension: module_status {
    type: string
    sql: ${TABLE}.module_status ;;
  }

  dimension: lesson_count {
    type: number
    sql: ${TABLE}.lesson_count ;;
  }

  dimension: course_id {
    type: string
    sql: ${TABLE}.course_id ;;
  }

  set: detail {
    fields: [
      ss,
      module_number,
      user_id,
      module_name,
      module_status,
      lesson_count,
      course_id
    ]
  }
}
