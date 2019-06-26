view: dmz_submission {
  sql_table_name: tcs_dw.support_dmz_submission ;;

  dimension: challenge_id {
    type: number
    description: "Challenge ID"
    sql: ${TABLE}.project_id ;;
  }

  dimension: submission_id {
    type: number
    sql: ${TABLE}.submission_id ;;
  }

  dimension: submission_url {
    type: string
    sql: ${TABLE}.submission_url ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields:[challenge_id, submission_id,submission_url]
  }
}
