view: coder_rank_history {
  sql_table_name: topcoder_dw.coder_rank_history ;;

  dimension: algo_rating_type_id {
    type: number
    sql: ${TABLE}.algo_rating_type_id ;;
  }

  dimension: coder_id {
    type: number
    sql: ${TABLE}.coder_id ;;
  }

  dimension: coder_rank_type_id {
    type: number
    sql: ${TABLE}.coder_rank_type_id ;;
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

  measure: count {
    type: count
    drill_fields: []
  }
}
