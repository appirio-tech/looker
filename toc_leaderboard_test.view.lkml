view: tco_leaderboard_test {
  derived_table: {
    sql:
    select  lb.challenge_id as challenge_id,
            lb.user_id as user_id,
            lb.total_score as total_score,
            lb.round_id as round_id,
            lb.created_at as created_at,
            lb.updated_at as updated_at,
            lb.contest_id as contest_id,
            lb.points as points,
            lb.placement as placement,
            lb.total_prize as total_prize,
            lb.percentage as percentage,
            lb.raw_points as raw_points,
            lb.fixed_score as fixed_score,
            rb.rating as rating_booster
    from tco_leaderboard lb
    left join tco_rating_booster rb
    on lb.contest_id = rb.contest_id
       and lb.user_id = rb.user_id
    ;;

    persist_for: "24 hours"
    distribution_style: "even"
    indexes: ["challenge_id", "user_id", "contest_id"]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: challenge_count {
    type: count_distinct
    sql: ${challenge_id};;
  }
  dimension: challenge_id {
    type: number
    sql: ${TABLE}.challenge_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: total_score {
    type: number
    sql: ${TABLE}.total_score ;;
  }

  dimension: round_id {
    type: number
    sql: ${TABLE}.round_id ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: contest_id {
    type: number
    sql: ${TABLE}.contest_id ;;
  }

  dimension: points {
    type: number
    sql: ${TABLE}.points ;;
  }

  dimension: placement {
    type: number
    sql: ${TABLE}.placement ;;
  }

  dimension: total_prize {
    type: number
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

  dimension: fixed_score {
    type: number
    sql: ${TABLE}.fixed_score ;;
  }

  dimension: rating_booster {
    type: number
    sql: ${TABLE}.rating_booster ;;
  }

  measure: tco_points {
    type: sum
    description: "TCO points for competitors except copilots"
    value_format: "#,##0"
    sql:  CASE
                WHEN ${TABLE}.points IS NOT NULL THEN ${TABLE}.fixed_score

               -- WHEN ${contest.track} = "Copilot" THEN $((${TABLE}.percentage)*$({TABLE}.total_prize)*(ISNULL(${TABLE}.rating_booster,1)))

                ELSE (${TABLE}.total_prize)*(${TABLE}.percentage)

          END;;
  }

  set: detail {
    fields: [
      challenge_id,
      user_id,
      total_score,
      round_id,
      created_at_time,
      updated_at_time,
      contest_id,
      points,
      placement,
      total_prize,
      percentage,
      raw_points,
      fixed_score,
      rating_booster
    ]
  }
}
