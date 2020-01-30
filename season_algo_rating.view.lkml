view: season_algo_rating {
  sql_table_name: topcoder_dw.season_algo_rating ;;

  dimension: coder_id {
    type: number
    sql: ${TABLE}.coder_id ;;
  }

  dimension: first_rated_round_id {
    type: number
    sql: ${TABLE}.first_rated_round_id ;;
  }

  dimension: highest_rating {
    type: number
    sql: ${TABLE}.highest_rating ;;
  }

  dimension: last_rated_round_id {
    type: number
    sql: ${TABLE}.last_rated_round_id ;;
  }

  dimension: lowest_rating {
    type: number
    sql: ${TABLE}.lowest_rating ;;
  }

  dimension: num_competitions {
    type: number
    sql: ${TABLE}.num_competitions ;;
  }

  dimension: num_ratings {
    type: number
    sql: ${TABLE}.num_ratings ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }

  dimension: season_id {
    type: number
    sql: ${TABLE}.season_id ;;
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
