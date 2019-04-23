view: user_rating {
  sql_table_name: tcs_dw.user_rating ;;

  dimension_group: create_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.create_date_time ;;
  }

  dimension: highest_rating {
    type: number
    sql: ${TABLE}.highest_rating ;;
  }

  dimension: last_rated_project_id {
    type: number
    sql: ${TABLE}.last_rated_project_id ;;
  }

  dimension: lowest_rating {
    type: number
    sql: ${TABLE}.lowest_rating ;;
  }

  dimension_group: mod_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.mod_date_time ;;
  }

  dimension: phase_id {
    type: number
    sql: ${TABLE}.phase_id ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }

  dimension: rating_no_vol {
    type: number
    sql: ${TABLE}.rating_no_vol ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
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

  measure: vol {
    type: sum
    sql: ${TABLE}.vol ;;
  }

  measure: max_rating {
    type: max
    sql: ${TABLE}.rating ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: num_ratings {
    type: sum
    sql: ${TABLE}.num_ratings ;;
  }
}
