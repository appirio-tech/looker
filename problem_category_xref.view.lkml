view: problem_category_xref {
  sql_table_name: topcoder_dw.problem_category_xref ;;

  dimension: problem_category_id {
    type: number
    sql: ${TABLE}.problem_category_id ;;
  }

  dimension: problem_id {
    type: number
    sql: ${TABLE}.problem_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
