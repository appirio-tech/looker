view: algo_rating_history {
  sql_table_name: topcoder_dw.algo_rating_history ;;

  dimension: algo_rating_type_id {
    type: number
    sql: ${TABLE}.algo_rating_type_id ;;
  }

  dimension: coder_id {
    type: number
    sql: ${TABLE}.coder_id ;;
  }

  dimension: num_ratings {
    type: number
    sql: ${TABLE}.num_ratings ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }

  dimension: round_id {
    type: number
    sql: ${TABLE}.round_id ;;
  }

  dimension: vol {
    type: number
    sql: ${TABLE}.vol ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
