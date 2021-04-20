view: copilot_feedback_score {
  sql_table_name: adhoc.survey_score ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: challenge_id {
    type: number
    sql: ${TABLE}.challenge_id ;;
  }

  measure: challenge_rating {
    type: average
    sql: ${TABLE}.challenge_rating ;;
  }

  dimension: copilot {
    type: string
    sql: ${TABLE}.copilot ;;
  }

  measure: copilot_rating {
    type: average
    sql: ${TABLE}.copilot_rating ;;
  }

  dimension_group: date_created {
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
    sql: ${TABLE}.date_created ;;
  }

  dimension_group: date_modified {
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
    sql: ${TABLE}.date_modified ;;
  }

  measure: forum_rating {
    type: average
    sql: ${TABLE}.forum_rating ;;
  }

  measure: prize {
    type: average
    sql: ${TABLE}.prize ;;
  }

  measure: review_score {
    type: average
    sql: ${TABLE}.review_score ;;
  }

  dimension: scope {
    type: string
    sql: ${TABLE}.scope ;;
  }

  measure: spec_rating {
    type: average
    sql: ${TABLE}.spec_rating ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
