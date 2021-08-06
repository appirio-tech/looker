view: data_science_contest {
  sql_table_name: topcoder_dw.contest ;;

  dimension: contest_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.contest_id ;;
  }

  dimension: ad_command {
    type: string
    sql: ${TABLE}.ad_command ;;
  }

  dimension_group: ad_end {
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
    sql: ${TABLE}.ad_end ;;
  }

  dimension_group: ad_start {
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
    sql: ${TABLE}.ad_start ;;
  }

  dimension: ad_task {
    type: string
    sql: ${TABLE}.ad_task ;;
  }

  dimension: ad_text {
    type: string
    sql: ${TABLE}.ad_text ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: season_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.season_id ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      contest_id,
      name,
      season.season_id,
      season.name,
      contest_coder.count,
      invite_list.count,
      round.count,
      tournament_group.count
    ]
  }
}
