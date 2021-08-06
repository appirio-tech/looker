view: problem_tester {
  sql_table_name: topcoder_dw.problem_tester ;;

  dimension: problem_id {
    type: number
    sql: ${TABLE}.problem_id ;;
  }

  dimension: tester_id {
    type: number
    sql: ${TABLE}.tester_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
