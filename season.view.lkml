view: season {
  sql_table_name: topcoder_dw.season ;;

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: end_calendar_id {
    type: number
    sql: ${TABLE}.end_calendar_id ;;
  }

  dimension: start_calendar_id {
    type: number
    sql: ${TABLE}.start_calendar_id ;;
  }

  dimension: season_id {
    type: number
    # hidden: true
    sql: ${TABLE}.season_id ;;
  }

  dimension: season_type_id {
    type: number
    sql: ${TABLE}.season_type_id ;;
  }

  dimension: season_type_desc {
    type: string
    sql: ${TABLE}.season_type_desc ;;
  }

  measure: count {
    type: count
    drill_fields: [season_id,season_type_id]
  }
}
