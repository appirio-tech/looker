view: scorecard_template {
  sql_table_name: tcs_dw.scorecard_template ;;

  dimension: scorecard_template_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.scorecard_template_id ;;
  }

  dimension: scorecard_type_desc {
    type: string
    sql: ${TABLE}.scorecard_type_desc ;;
  }

  dimension: scorecard_type_id {
    type: number
    sql: ${TABLE}.scorecard_type_id ;;
  }

  measure: count {
    type: count
    drill_fields: [scorecard_template_id, scorecard_question.count, submission_review.count, submission_screening.count]
  }
}
