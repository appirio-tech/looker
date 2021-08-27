view: review {
  sql_table_name: tcs_dw.review ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: metadata {
    type: string
    hidden: yes
    sql: ${TABLE}.metadata ;;
  }

  dimension_group: reviewed {
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
    sql: ${TABLE}.reviewed_at ;;
  }

  dimension: reviewer_id {
    type: string
    sql: ${TABLE}.reviewer_id ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: scorecard_guid {
    type: string
    hidden: yes
    sql: ${TABLE}.scorecard_guid ;;
  }

  dimension: scorecard_id {
    type: number
    sql: ${TABLE}.scorecard_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: submission_id {
    type: string
    sql: ${TABLE}.submission_id ;;
  }

  dimension: test_type {
    type: string
    sql: ${TABLE}.test_type ;;
  }

  dimension: type_id {
    type: string
    sql: ${TABLE}.type_id ;;
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
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: updated_by {
    type: string
    sql: ${TABLE}.updated_by ;;
  }

  measure: count {
    type: count
    drill_fields: [id,submission_id,reviewer_id]
  }
}
