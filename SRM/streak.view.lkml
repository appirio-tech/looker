view: streak {
  sql_table_name: topcoder_dw.streak ;;

  dimension: coder_id {
    type: number
    # hidden: true
    sql: ${TABLE}.coder_id ;;
  }

  dimension: end_project_id {
    type: number
    sql: ${TABLE}.end_project_id ;;
  }

  dimension: is_current {
    type: number
    sql: ${TABLE}.is_current ;;
  }

  dimension: phase_id {
    type: number
    sql: ${TABLE}.phase_id ;;
  }

  dimension: start_project_id {
    type: number
    sql: ${TABLE}.start_project_id ;;
  }

  dimension: streak_type_id {
    type: number
    sql: ${TABLE}.streak_type_id ;;
  }

  measure: count {
    type: count
    drill_fields: [coder.coder_id, coder.first_name, coder.last_name, coder.middle_name]
  }

  measure: length {
    type: sum
    sql: ${TABLE}.length ;;
  }
}
