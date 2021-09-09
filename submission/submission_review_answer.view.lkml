view: submission_review_answer {

  sql_table_name: tcs_dw.submission_review_answer ;;

#----------------------------------Id values ---------------------------------#
  dimension: review_item_id {
    type: number
    value_format_name: id
    primary_key: yes
    sql: ${TABLE}.review_item_id ;;
  }

  dimension: review_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.review_id ;;
  }


  #----------------------------------Questions ---------------------------------#

  dimension: question_type  {
    description: "Type of Question eg. Scale (1-3), Yes/No, Scale (1-10) etc"
    sql: ${TABLE}.question_type ;;
  }

  dimension: question  {
    description: "Actual Question Text as per scorecard"
    sql: ${TABLE}.question ;;
  }

  dimension: question_id {
    type: number
    description: "Scorecard Question ID for easy filtering"
    value_format_name: id
    sql: ${TABLE}.scorecard_question_id ;;
  }

  dimension: answer  {
    description: "Answer as input by the reviewer"
    sql: ${TABLE}.answer ;;
  }

  dimension: sort {
    type: number
    description: "Sort the questions as they appear in scorecard"
    sql: ${TABLE}.sort;;
  }

  dimension: weight {
    type: number
    description: "Relative weight of the question in scorecard"
    sql: ${TABLE}.sort;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: score {
    description: "fraction value of the score obtained for the question"
    type: sum
    sql: ${TABLE}.computed_score ;;
  }

}
