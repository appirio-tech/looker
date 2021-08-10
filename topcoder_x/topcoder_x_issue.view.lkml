view: topcoder_x_issue {
  sql_table_name: tcs_dw.topcoder_x_issue ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: assigned {
    description: "Timestamp of issue assignment"
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
    sql: ${TABLE}.assigned_at ;;
  }

  dimension: body {
    description: "Issue Description"
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension: challenge_id {
    description: "Standard F2F Task Challenge ID attached with the Issue"
    type: number
    sql: ${TABLE}.challenge_id ;;
  }

  measure: first_prize {
    description: "First or Highest prize paid for Issue"
    type: sum
    sql: ${TABLE}.firstprize ;;
  }

  dimension: labels {
    description: "Comma Separated list of labels attached to the Issue"
    type: string
    sql: ${TABLE}.labels ;;
  }

  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
  }

  dimension: project_id {
    description: "Topcoder X unique Project Id"
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: provider {
    description: "Gitlab / Github or Bit Bucket etc"
    type: string
    sql: ${TABLE}.provider ;;
  }

  dimension: repository_id {
    description: "External ID for the repository"
    type: number
    sql: ${TABLE}.repository_id ;;
  }

  measure: second_prize {
    description: "Second Prize if any paid on the challenge. Normally should be blank"
    type: sum
    sql: ${TABLE}.secondprize ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: third_prize {
    description: "Third Prize if any paid on the challenge. Normally should be blank"
    type: sum
    sql: ${TABLE}.thirdprize ;;
  }

  dimension: title {
    description: "Issue Title"
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension_group: updated {
    description: "Last Updated On"
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

  measure: count {
    type: count
    drill_fields: [id, title, challenge_id, status, labels, first_prize]
  }
}
