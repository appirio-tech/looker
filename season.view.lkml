view: season {
  sql_table_name: topcoder_dw.season ;;

  dimension: next_rookie_season_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.next_rookie_season_id ;;
  }

  dimension: end_calendar_id {
    type: number
    sql: ${TABLE}.end_calendar_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: rookie_competition_ind {
    type: number
    sql: ${TABLE}.rookie_competition_ind ;;
  }

  dimension: season_id {
    type: number
    # hidden: true
    sql: ${TABLE}.season_id ;;
  }

  dimension: start_calendar_id {
    type: number
    sql: ${TABLE}.start_calendar_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      next_rookie_season_id,
      name,
      season.name,
      season.next_rookie_season_id,
      contest_season_xref.count,
      rookie.count,
      season.count,
      stage.count
    ]
  }
}
