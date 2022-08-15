view: member_stats_history {
  sql_table_name: tcs_dw.member_stats_history ;;

  dimension: challenge_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.challenge_id ;;
  }

  dimension: challenge_name {
    type: string
    sql: ${TABLE}.challenge_name ;;
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

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: percentile {
    type: number
    sql: ${TABLE}.percentile ;;
  }

  dimension: placement {
    type: number
    sql: ${TABLE}.placement ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }

  dimension: sub_track {
    type: string
    sql: ${TABLE}.sub_track ;;
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

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [challenge_name]
  }

  measure: Challenge_Count{
    type:  count_distinct
    description: "Distinct Challenges / SRM / Marathon Matches "
    sql: ${TABLE}.challenge_id ;;
  }


measure: Average {
  type: average
  sql: case when ${TABLE}.rating is not null then ${TABLE}.rating else 0 end;;
}



}
