view: contest {
  sql_table_name: tcs_dw.contest ;;

  dimension: contest_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.contest_id ;;
  }

  dimension_group: contest_end_timestamp {
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
    sql: ${TABLE}.contest_end_timestamp ;;
  }

  dimension: contest_name {
    type: string
    sql: ${TABLE}.contest_name ;;
  }

  dimension_group: contest_start_timestamp {
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
    sql: ${TABLE}.contest_start_timestamp ;;
  }

  dimension: contest_type_desc {
    type: string
    sql: ${TABLE}.contest_type_desc ;;
  }

  dimension: contest_type_id {
    type: number
    sql: ${TABLE}.contest_type_id ;;
  }

  dimension: event_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.event_id ;;
  }

  dimension: phase_id {
    type: number
    sql: ${TABLE}.phase_id ;;
  }

  dimension: project_category_id {
    type: number
    sql: ${TABLE}.project_category_id ;;
  }

  dimension: project_category_name {
    type: string
    sql: ${TABLE}.project_category_name ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      contest_id,
      contest_name,
      project_category_name,
      event.event_id,
      event.event_name,
      contest_prize.count,
      contest_project_xref.count,
      contest_result.count,
      contest_season_xref.count,
      contest_stage_xref.count,
      jira_issue.count,
      participation_metrics_report_copilot.count,
      participation_metrics_report_member.count,
      user_contest_prize.count
    ]
  }
}
