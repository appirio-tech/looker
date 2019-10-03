view: topcoder_x_issue {
  sql_table_name: tcs_dw.topcoder_x_issue ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: assigned {
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
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension: challenge_id {
    type: number
    sql: ${TABLE}.challenge_id ;;
  }

  measure: firstprize {
    type: sum
    sql: ${TABLE}.firstprize ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.labels ;;
  }

  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: provider {
    type: string
    sql: ${TABLE}.provider ;;
  }

  dimension: repository_id {
    type: number
    sql: ${TABLE}.repository_id ;;
  }

  measure: secondprize {
    type: sum
    sql: ${TABLE}.secondprize ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: thirdprize {
    type: sum
    sql: ${TABLE}.thirdprize ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
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

  measure: count {
    type: count
    drill_fields: [id]
  }
}
