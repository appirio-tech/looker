view: member_submission {
  sql_table_name: tcs_dw.member_submission ;;

  dimension: challenge_id {
    type: number
    sql: ${TABLE}.challenge_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: file_type {
    type: string
    sql: ${TABLE}.file_type ;;
  }

  dimension: legacy_submission_id {
    type: number
    description: "Legacy Submission Id visible in Online Review"
    sql: ${TABLE}.legacy_submission_id ;;
  }

  dimension: submission_id {
    description: "GUID for submission"
    type: string
    sql: ${TABLE}.submission_id ;;
  }

  dimension: submission_phase_id {
    type: number
    description: "Project Phase Id, the submission is associated with"
    sql: ${TABLE}.submission_phase_id ;;
  }

  dimension: type {
    type: string
    description: "Submission Type can be Checkpoint / Contest Submission"
    sql: ${TABLE}.type ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: updated_by {
    type: string
    sql: ${TABLE}.updated_by ;;
  }

  dimension: url {
    description: "Submission Url, usually an S3 Bucket or an internal Url"
    type: string
    sql: ${TABLE}.url ;;
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
