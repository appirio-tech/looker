view: state_coder_rank {
  sql_table_name: topcoder_dw.state_coder_rank ;;

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

  dimension: rank_no_tie {
    type: number
    sql: ${TABLE}.rank_no_tie ;;
  }

  dimension: state_code {
    type: string
    sql: ${TABLE}.state_code ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
