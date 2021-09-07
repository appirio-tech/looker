view: track_contest {
  sql_table_name: tcs_dw.track_contest ;;

  dimension: track_contest_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.track_contest_id ;;
  }

  dimension: track_contest_desc {
    type: string
    sql: ${TABLE}.track_contest_desc ;;
  }

  dimension: track_contest_type_desc {
    type: string
    sql: ${TABLE}.track_contest_type_desc ;;
  }

  dimension: track_contest_type_id {
    type: number
    sql: ${TABLE}.track_contest_type_id ;;
  }

  dimension: track_id {
    type: number
    # hidden: true
    sql: ${TABLE}.track_id ;;
  }

  measure: count {
    type: count
    drill_fields: [track_contest_id, track.track_id, track_contest_results.count]
  }
}
