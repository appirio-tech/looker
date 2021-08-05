view: algo_rating {
  sql_table_name: topcoder_dw.algo_rating ;;

  dimension: algo_rating_type_id {
    type: number
    sql: ${TABLE}.algo_rating_type_id ;;
  }

  dimension: coder_id {
    type: number
    # hidden: yes
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

  dimension: rating_tier {
    type: tier
    tiers: [
      0,
      100,
      200,
      300,
      400,
      500,
      600,
      700,
      800,
      900,
      1000,
      1100,
      1200,
      1300,
      1400,
      1500,
      1600,
      1700,
      1800,
      1900,
      2000,
      2100,
      2200,
      2300,
      2400,
      2500,
      2600,
      2700,
      2800,
      2900,
      3000,
      3100,
      3200,
      3300,
      3400
    ]
    # the default value, could be excluded
    style: integer
    sql: ${rating} ;;
  }

  dimension: vol {
    type: number
    sql: ${TABLE}.vol ;;
  }

  measure: count {
    type: count
    drill_fields: [coder.coder_id, coder.first_name, coder.last_name, coder.middle_name]
  }
}
