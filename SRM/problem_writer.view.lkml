view: problem_writer {
  sql_table_name: topcoder_dw.problem_writer ;;

  dimension: problem_id {
    type: number
    sql: ${TABLE}.problem_id ;;
  }

  dimension: writer_id {
    type: number
    sql: ${TABLE}.writer_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
