view: member_business_conduct_survey {
  sql_table_name: tcs_dw.member_business_conduct_survey ;;

  dimension: correct_answer {
    type: string
    description: "The actual correct answer for the question"
    sql: ${TABLE}.correct_answer ;;
  }

  dimension: duration {
    type: number
    description: "Time taken by the user in completing the survey"
    sql: ${TABLE}.duration ;;
  }

  dimension_group: end {
    type: time
    description: "When was the survey completed ?"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_date ;;
  }

  dimension: ip_address {
    type: string
    description: "IP Address of the user location"
    sql: ${TABLE}.ip_address ;;
  }

  dimension: is_answer_correct {
    type: yesno
    description: "Is the answer provided by the user correct"
    sql: ${TABLE}.is_answer_correct ;;
  }

  dimension: question_code {
    type: string
    description: "Internal Question Code"
    sql: ${TABLE}.question_code ;;
  }

  dimension: question_text {
    type: string
    description: "Complete Question Text"
    sql: ${TABLE}.question_text ;;
  }

  dimension_group: recorded {
    type: time
    description: "Date when the survey was completed and saved"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.recorded_date ;;
  }

  dimension: response_id {
    type: string
    primary_key: yes
    description: "Response Id groups all users answers for a single survey in one sitting"
    sql: ${TABLE}.response_id ;;
  }

  measure: score {
    type:sum
    description: "Each correct answer score is 1"
    sql: CASE
   when ${TABLE}.is_answer_correct='yes' then 1
      else 0
      END;;
  }

dimension_group: start {
    type: time
    description: "Start Date of the survey"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_date ;;
  }

  dimension: user_answer {
    type: string
    description: "Answer provided by the user for the question"
    sql: ${TABLE}.user_answer ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
