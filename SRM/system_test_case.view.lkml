view: system_test_case {
  sql_table_name: topcoder_dw.system_test_case ;;

  dimension: args {
    type: string
    sql: ${TABLE}.args ;;
  }

  dimension: example_flag {
    type: number
    sql: ${TABLE}.example_flag ;;
  }

  dimension: expected_result {
    type: string
    sql: ${TABLE}.expected_result ;;
  }

  dimension_group: modify {
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
    sql: ${TABLE}.modify_date ;;
  }

  dimension: problem_id {
    type: number
    sql: ${TABLE}.problem_id ;;
  }

  dimension: system_flag {
    type: number
    sql: ${TABLE}.system_flag ;;
  }

  dimension: test_case_id {
    type: number
    sql: ${TABLE}.test_case_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
