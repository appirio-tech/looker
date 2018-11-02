view: member_stats {
  sql_table_name: tcs_dw.member_stats ;;

  dimension: active_contests {
    type: number
    sql: ${TABLE}.active_contests ;;
  }

  dimension: active_country_rank {
    type: number
    sql: ${TABLE}.active_country_rank ;;
  }

  dimension: active_percentile {
    type: number
    sql: ${TABLE}.active_percentile ;;
  }

  dimension: active_projects {
    type: number
    sql: ${TABLE}.active_projects ;;
  }

  dimension: active_rank {
    type: number
    sql: ${TABLE}.active_rank ;;
  }

  dimension: active_school_rank {
    type: number
    sql: ${TABLE}.active_school_rank ;;
  }

  dimension: appeals {
    type: number
    sql: ${TABLE}.appeals ;;
  }

  dimension: appeal_success_rate {
    type: number
    sql: ${TABLE}.appeal_success_rate ;;
  }

  measure: avg_num_submissions {
    type: average
    sql: ${TABLE}.avg_num_submissions ;;
  }

  measure: avg_placement {
    type: average
    sql: ${TABLE}.avg_placement ;;
  }

  dimension: avg_rank {
    type: number
    sql: ${TABLE}.avg_rank ;;
  }

  measure: avg_score {
    type: average
    sql: ${TABLE}.avg_score ;;
  }

  dimension: best_rank {
    type: number
    sql: ${TABLE}.best_rank ;;
  }

  dimension: challenges {
    type: number
    sql: ${TABLE}.challenges ;;
  }

  dimension: competitions {
    type: number
    sql: ${TABLE}.competitions ;;
  }

  dimension: contests {
    type: number
    sql: ${TABLE}.contests ;;
  }

  dimension: country_rank {
    type: number
    sql: ${TABLE}.country_rank ;;
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
    type: number
    sql: ${TABLE}.created_by ;;
  }

  dimension: default_language {
    type: string
    sql: ${TABLE}.default_language ;;
  }

  measure: failures {
    type: sum
    sql: ${TABLE}.failures ;;
  }

  measure: fulfillment {
    type: number
    sql: ${TABLE}.fulfillment ;;
  }

  dimension: max_score {
    type: number
    sql: ${TABLE}.max_score ;;
  }

  dimension: maximum_rating {
    type: number
    sql: ${TABLE}.maximum_rating ;;
  }

  dimension: min_score {
    type: number
    sql: ${TABLE}.min_score ;;
  }

  dimension: minimum_rating {
    type: number
    sql: ${TABLE}.minimum_rating ;;
  }

  dimension_group: most_recent_event {
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
    sql: ${TABLE}.most_recent_event_date ;;
  }

  dimension: most_recent_event_name {
    type: string
    sql: ${TABLE}.most_recent_event_name ;;
  }

  dimension_group: most_recent_submission {
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
    sql: ${TABLE}.most_recent_submission ;;
  }

  dimension: num_inquiries {
    type: number
    sql: ${TABLE}.num_inquiries ;;
  }

  measure: passed_review {
    type: sum
    sql: ${TABLE}.passed_review ;;
  }

  measure: passed_screening {
    type: sum
    sql: ${TABLE}.passed_screening ;;
  }

  dimension: percentile {
    type: number
    sql: ${TABLE}.percentile ;;
  }

  dimension: projects {
    type: number
    sql: ${TABLE}.projects ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }

  dimension: reliability {
    type: number
    sql: ${TABLE}.reliability ;;
  }

  dimension: reposts {
    type: number
    sql: ${TABLE}.reposts ;;
  }

  dimension: review_success_rate {
    type: number
    sql: ${TABLE}.review_success_rate ;;
  }

  dimension: school_rank {
    type: number
    sql: ${TABLE}.school_rank ;;
  }

  dimension: screening_success_rate {
    type: number
    sql: ${TABLE}.screening_success_rate ;;
  }

  dimension: sub_track {
    type: string
    sql: ${TABLE}.sub_track ;;
  }

  dimension: submission_rate {
    type: number
    sql: ${TABLE}.submission_rate ;;
  }

  dimension: submissions {
    type: number
    sql: ${TABLE}.submissions ;;
  }

  dimension: top_five_finishes {
    type: number
    sql: ${TABLE}.top_five_finishes ;;
  }

  dimension: top_ten_finishes {
    type: number
    sql: ${TABLE}.top_ten_finishes ;;
  }

  dimension: track {
    type: string
    sql: ${TABLE}.track ;;
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
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  dimension: user_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: volatility {
    type: number
    sql: ${TABLE}.volatility ;;
  }

  dimension: win_percent {
    type: number
    sql: ${TABLE}.win_percent ;;
  }

  dimension: wins {
    type: number
    sql: ${TABLE}.wins ;;
  }

  measure: count {
    type: count
    drill_fields: [most_recent_event_name]
  }
}
