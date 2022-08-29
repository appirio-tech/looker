view: responsive_web_design_steps {
  derived_table: {
    sql: with t1 as (select
      s.i as ss,
      s.i + 1 as module_number,
      user_id,
      json_extract_path_text(json_extract_array_element_text(modules, s.i),'module') as module_name,
      json_extract_path_text(json_extract_array_element_text(modules, s.i),'moduleStatus') as module_status,
      json_extract_path_text(json_extract_array_element_text(modules, s.i),'lessonCount') as lesson_count,
      course_id as course_id,
      json_extract_path_text(json_extract_array_element_text(modules, s.i),'completedLessons') as test1
      from academy.certification_progress,academy.sequence as s
      where s.i < json_array_length(modules))

      select
      t1.user_id,
      t1.course_id as course_id,
      t1.module_name as module_name,
      t1.module_status as module_status,
      t1.ss + 1 as module_number,
      t1.lesson_count as lesson_count,
      json_extract_path_text(json_extract_array_element_text(t1.test1, s2.i),'dashedName') as step_number,
      json_extract_path_text(json_extract_array_element_text(t1.test1, s2.i),'completedDate') as completed_date
      from t1,academy.sequence as s2
      where s2.i < json_array_length(t1.test1)
      order by t1.ss desc
      ;;
  }

  measure: count {
    type: count
    filters: {
      field: step_number
      value: "-'NULL'"
    }
  }

  measure: completed_modules {
    type: count
    filters: {
      field: module_status
      value: "completed"
    }
  }



  measure: distinct_users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  dimension: user_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: course_id {
    type: string
    sql: ${TABLE}.course_id ;;
  }

  dimension: module_name {
    type: string
    sql: ${TABLE}.module_name ;;
  }

  dimension: module_status {
    type: string
    sql: ${TABLE}.module_status ;;
  }

  dimension: module_number {
    type: number
    sql: ${TABLE}.module_number ;;
  }

  dimension: lesson_count {
    type: string
    sql: ${TABLE}.lesson_count ;;
  }

  dimension: step_number {
    type: string
    sql: ${TABLE}.step_number ;;
  }

  dimension: completed_date {
    type: string
    hidden:  yes
    sql: ${TABLE}.completed_date ;;
  }


  dimension: date_of_completion {
    type: date
    hidden: yes
    sql: timestamp 'epoch' + cast(${completed_date}  as bigint) / 1000 * interval '1 second';;
  }

  measure: max_completed_date {
    type: date
    sql: MAX(${date_of_completion}) ;;
    }




  dimension_group: completed_date {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${date_of_completion} ;;
  }


  set: detail {
    fields: [
      user_id,
      module_name,
      module_status,
      module_number,
      lesson_count,
      step_number,
      completed_date
    ]
  }
}
