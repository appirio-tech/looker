view: season_rank {
  sql_table_name: topcoder_dw.season_rank ;;

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

  dimension: season_id {
    type: number
    sql: ${TABLE}.season_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
