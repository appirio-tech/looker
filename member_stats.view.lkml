view: member_stats {
  sql_table_name: tcs_dw.member_stats ;;

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.user_id, CONCAT(${TABLE}.sub_track, ${TABLE}.track)) ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: track {
    type: string
    sql: ${TABLE}.track ;;
  }

  dimension: sub_track {
    type: string
    sql: ${TABLE}.sub_track ;;
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
    type: number
    sql: ${TABLE}.created_by ;;
  }

  dimension: default_language {
    type: string
    sql: ${TABLE}.default_language ;;
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
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.most_recent_event_date ;;
  }

  dimension: most_recent_event_name {
    type: string
    description: "Available in SRM, Marathon"
    sql: ${TABLE}.most_recent_event_name ;;
  }

  dimension_group: most_recent_submission {
    type: time
    description: "Not Available in Code"
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
    sql: ${TABLE}.most_recent_submission ;;
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
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  #added on 30th July 2019
  dimension: challenge_level_one_created {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.challenge_level_one_created ;;
    group_label: "SRM"
  }

  dimension: challenge_level_one_failed  {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.challenge_level_one_failed ;;
    group_label: "SRM"
  }

  dimension: challenge_level_two_created {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.challenge_level_two_created ;;
    group_label: "SRM"
  }

  dimension: challenge_level_two_failed {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.challenge_level_two_failed ;;
    group_label: "SRM"
  }

  dimension: challenge_level_three_created {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.challenge_level_three_created ;;
    group_label: "SRM"
  }

  dimension: challenge_level_three_failed {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.challenge_level_three_failed ;;
    group_label: "SRM"
  }

  dimension: division1_level_one_submitted {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division1_level_one_submitted ;;
    group_label: "SRM"
  }

  dimension: division1_level_one_failed {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division1_level_one_failed ;;
    group_label: "SRM"
  }

  dimension: division1_level_one_failed_system_test {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division1_level_one_failed_system_test ;;
    group_label: "SRM"
  }

  dimension: division1_level_two_submitted {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division1_level_two_submitted ;;
    group_label: "SRM"
  }

  dimension: division1_level_two_failed {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division1_level_two_failed ;;
    group_label: "SRM"
  }

  dimension: division1_level_two_failed_system_test {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division1_level_two_failed_system_test ;;
    group_label: "SRM"
  }

  dimension: division1_level_three_submitted {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division1_level_three_submitted ;;
    group_label: "SRM"
  }

  dimension: division1_level_three_failed {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division1_level_three_failed ;;
    group_label: "SRM"
  }

  dimension: division1_level_three_failed_system_test {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division1_level_three_failed_system_test ;;
    group_label: "SRM"
  }

  dimension: division2_level_one_submitted {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division2_level_one_submitted ;;
    group_label: "SRM"
  }

  dimension: division2_level_one_failed {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division2_level_one_failed ;;
    group_label: "SRM"
  }

  dimension: division2_level_one_failed_system_test {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division2_level_one_failed_system_test ;;
    group_label: "SRM"
  }

  dimension: division2_level_two_submitted {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division2_level_two_submitted ;;
    group_label: "SRM"
  }

  dimension: division2_level_two_failed {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division2_level_two_failed ;;
    group_label: "SRM"
  }

  dimension: division2_level_two_failed_system_test {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division2_level_two_failed_system_test ;;
    group_label: "SRM"
  }

  dimension: division2_level_three_submitted {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division2_level_three_submitted ;;
    group_label: "SRM"
  }

  dimension: division2_level_three_failed {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division2_level_three_failed ;;
    group_label: "SRM"
  }

  dimension: division2_level_three_failed_system_test {
    type: number
    description: "Available in SRM only"
    sql: ${TABLE}.division2_level_three_failed_system_test ;;
    group_label: "SRM"
  }

  measure: count {
    type: count
    drill_fields: [most_recent_event_name]
  }

  measure: volatility {
    type: average
    description: "Available in SRM, Marathon, Assembly & UI"
    sql: ${TABLE}.volatility ;;
  }

  measure: win_percent {
    type: average
    description: "Not Available in SRM & Marathon"
    sql: ${TABLE}.win_percent ;;
  }

  measure: wins {
    type: sum
    description: "Available for all type"
    sql: ${TABLE}.wins ;;
  }

  measure: active_contests {
    type: sum
    description: "Available for Copilots"
    sql: ${TABLE}.active_contests ;;
  }

  measure: active_country_rank {
    type: average
    description: "Available in Assembly & UI"
    sql: ${TABLE}.active_country_rank ;;
  }

  measure: active_percentile {
    type: average
    description: "Available in Assembly & UI"
    sql: ${TABLE}.active_percentile ;;
  }

  measure: active_projects {
    type: sum
    description: "Available for Copilots"
    sql: ${TABLE}.active_projects ;;
  }

  measure: active_rank {
    type: average
    description: "Available in Assembly & UI"
    sql: ${TABLE}.active_rank ;;
  }

  measure: active_school_rank {
    type: average
    description: "Available in Assembly & UI"
    sql: ${TABLE}.active_school_rank ;;
  }

  measure: appeals {
    type: sum
    description: "Available in SRM, Marathon, Assembly & UI"
    sql: ${TABLE}.appeals ;;
  }

  measure: appeal_success_rate {
    type: average
    description: "Available for Bug, Assembly, UI, F2F & Code"
    sql: ${TABLE}.appeal_success_rate ;;
  }

  measure: avg_rank {
    type: average
    description: "Available for Marathon only"
    sql: ${TABLE}.avg_rank ;;
  }

  measure: avg_score {
    type: average
    description: "Available in Assembly, UI, F2F & Code"
    sql: ${TABLE}.avg_score ;;
  }

  measure: best_rank {
    type: average
    description: "Available for Marathon only"
    sql: ${TABLE}.best_rank ;;
  }

  measure: challenges {
    type: sum
    sql: ${TABLE}.challenges ;;
  }

  measure: competitions {
    type: sum
    description: "Available in SRM & Marathon"
    sql: ${TABLE}.competitions ;;
  }

  measure: contests {
    type: sum
    description: "Available for Copilots"
    sql: ${TABLE}.contests ;;
  }

  measure: country_rank {
    type: average
    description: "Available in SRM, Marathon, Assembly & UI"
    sql: ${TABLE}.country_rank ;;
  }
  measure: avg_num_submissions {
    type: average
    description: "Available for Marathon only"
    sql: ${TABLE}.avg_num_submissions ;;
  }

  measure: avg_placement {
    type: average
    description: "Not Available in SRM & Marathon"
    sql: ${TABLE}.avg_placement ;;
  }
  measure: failures {
    type: sum
    description: "Available for Copilots"
    sql: ${TABLE}.failures ;;
  }

  measure: fulfillment {
    type: average
    description: "Available for Copilots"
    sql: ${TABLE}.fulfillment ;;
  }

  measure: max_score {
    type: max
    description: "Available in SRM, Marathon, Assembly & UI"
    sql: ${TABLE}.max_score ;;
  }

  measure: maximum_rating {
    type: max
    description: "Available in SRM, Marathon, Assembly & UI"
    sql: ${TABLE}.maximum_rating ;;
  }

  measure: min_score {
    type: min
    description: "Available for Bug, Assembly, UI, F2F & Code"
    sql: ${TABLE}.min_score ;;
  }

  measure: minimum_rating {
    type: min
    description: "Available in SRM, Marathon, Assembly & UI"
    sql: ${TABLE}.minimum_rating ;;
  }

  measure: num_inquiries {
    type: sum
    description: "Not Available in SRM & Marathon"
    sql: ${TABLE}.num_inquiries ;;
  }

  measure: passed_review {
    type: sum
    description: "Available in SRM, Marathon, Assembly & UI"
    sql: ${TABLE}.passed_review ;;
  }

  measure: passed_screening {
    type: sum
    description: "Not Available in SRM & Marathon"
    sql: ${TABLE}.passed_screening ;;
  }

  measure: percentile {
    type: average
    description: "Available in SRM, Marathon, Assembly & UI"
    sql: ${TABLE}.percentile ;;
  }

  measure: projects {
    type: sum
    description: "Available for Copilots"
    sql: ${TABLE}.projects ;;
  }

  measure: rank {
    type: average
    description: "Available in SRM, Marathon, Assembly & UI"
    sql: ${TABLE}.rank ;;
  }

  measure: rating {
    type: average
    description: "Available in SRM, Marathon,Assembly & UI"
    #value_format: "0"
    sql: ${TABLE}.rating ;;
  }

  measure: reliability {
    type: average
    description: "Available in Assembly & UI"
    sql: ${TABLE}.reliability ;;
  }

  measure: reposts {
    type: sum
    description: "Available for Copilots"
    sql: ${TABLE}.reposts ;;
  }

  measure: review_success_rate {
    type: average
    description: "Available in SRM, Marathon, Assembly & UI"
    sql: ${TABLE}.review_success_rate ;;
  }

  measure: school_rank {
    type: average
    description: "Available in SRM, Marathon, Assembly & UI"
    sql: ${TABLE}.school_rank ;;
  }

  measure: screening_success_rate {
    type: average
    description: "Not Available in SRM & Marathon"
    sql: ${TABLE}.screening_success_rate ;;
  }

  measure: submission_rate {
    type: average
    description: "Not Available in SRM & Marathon"
    sql: ${TABLE}.submission_rate ;;
  }

  measure: submissions {
    type: sum
    description: "Not Available in SRM & Marathon"
    sql: ${TABLE}.submissions ;;
  }

  measure: top_five_finishes {
    type: sum
    description: "Available for Marathon only"
    sql: ${TABLE}.top_five_finishes ;;
  }

  measure: top_ten_finishes {
    type: sum
    description: "Available for Marathon only"
    sql: ${TABLE}.top_ten_finishes ;;
  }



}
