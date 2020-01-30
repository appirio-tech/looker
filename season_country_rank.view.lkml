view: season_country_rank {
  sql_table_name: topcoder_dw.season_country_rank ;;

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

  dimension: season_id {
    type: number
    sql: ${TABLE}.season_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
