view: review_summation {
  sql_table_name: tcs_dw.review_summation ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: aggregate_score {
    type: number
    sql: ${TABLE}.aggregate_score ;;
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

  dimension: is_final {
    type: yesno
    sql: ${TABLE}.is_final ;;
  }

  dimension: is_passing {
    type: yesno
    sql: ${TABLE}.is_passing ;;
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

  dimension: scorecard_guid {
    type: string
    hidden: yes
    sql: ${TABLE}.scorecard_guid ;;
  }

  dimension: scorecard_id {
    type: number
    sql: ${TABLE}.scorecard_id ;;
  }

  dimension: submission_id {
    type: string
    sql: ${TABLE}.submission_id ;;
  }

  dimension: test_type {
    type: string
    sql: ${TABLE}.test_type ;;
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
    drill_fields: [id,submission_id]
  }
}
