view: country_rank {
  sql_table_name: topcoder_dw.country_rank ;;

  dimension: algo_rating_type_id {
    type: number
    sql: ${TABLE}.algo_rating_type_id ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: member_count {
    type: number
    sql: ${TABLE}.member_count ;;
  }

  dimension: percentile {
    type: number
    sql: ${TABLE}.percentile ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
