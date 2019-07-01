view: system_test_result {
  sql_table_name: topcoder_dw.system_test_result ;;

  dimension: coder_id {
    type: number
    sql: ${TABLE}.coder_id ;;
  }

  dimension: deduction_amount {
    type: number
    sql: ${TABLE}.deduction_amount ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: num_iterations {
    type: number
    sql: ${TABLE}.num_iterations ;;
  }

  dimension: problem_id {
    type: number
    sql: ${TABLE}.problem_id ;;
  }

  dimension: processing_time {
    type: number
    sql: ${TABLE}.processing_time ;;
  }

  dimension: received {
    type: string
    sql: ${TABLE}.received ;;
  }

  dimension: round_id {
    type: number
    sql: ${TABLE}.round_id ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: succeeded {
    type: number
    sql: ${TABLE}.succeeded ;;
  }

  dimension: test_case_id {
    type: number
    sql: ${TABLE}.test_case_id ;;
  }

  dimension_group: timestamp {
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
    sql: ${TABLE}.timestamp ;;
  }

  dimension: viewable {
    type: string
    sql: ${TABLE}.viewable ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
