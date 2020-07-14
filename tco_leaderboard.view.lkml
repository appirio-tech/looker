view: tco_leaderboard {
  sql_table_name: tcs_dw.tco_leaderboard ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: challenge_id {
    type: number
    sql: ${TABLE}.challenge_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: points {
    type: number
    sql: ${TABLE}.points ;;
  }

  dimension: placement {
    type: number
    description: "Placement earned by the user"
    sql: ${TABLE}.placement ;;
  }

  dimension: total_score {
    type: number
    sql: ${TABLE}.total_score ;;
  }

  dimension: round_id {
    type: number
    sql: ${TABLE}.round_id ;;
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

  dimension: total_prize {
    type: number
    description: "Total Prize on the challenge"
    sql: ${TABLE}.total_prize ;;
  }

  dimension: percentage {
    type: number
    sql: ${TABLE}.percentage ;;
  }

  dimension: raw_points {
    type: number
    sql: ${TABLE}.raw_points ;;
  }

  dimension: contest_id {
    type: number
    sql: ${TABLE}.contest_id  ;;
  }

  dimension: fixed_score {
    type: number
    sql: ${TABLE}.fixed_score ;;
  }


  measure: count {
    type: count
    drill_fields: [id]
  }
}
