view: project_scorecard {
  #temporary table to load project scorecard
  sql_table_name: tcs_dw.project_scorecard ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: project_id {
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension: scorecard_id {
    type: number
    sql: ${TABLE}.scorecard_id ;;
  }

  dimension: scorecard_name {
    type: string
    sql: ${TABLE}.scorecard_name ;;
  }

  dimension_group: modify_date {
    type: time
    sql: ${TABLE}.modify_date ;;
  }

  set: detail {
    fields: [project_id, scorecard_id, scorecard_name, modify_date_time]
  }
}
