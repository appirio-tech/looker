view: season_rank_history {
  sql_table_name: topcoder_dw.season_rank_history ;;

  dimension: coder_id {
    type: number
    sql: ${TABLE}.coder_id ;;
  }

  dimension: percentile {
    type: number
    sql: ${TABLE}.percentile ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: round_id {
    type: number
    sql: ${TABLE}.round_id ;;
  }

  dimension: season_id {
    type: number
    sql: ${TABLE}.season_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
