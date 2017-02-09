view: algo_rating_type_lu {
  sql_table_name: topcoder_dw.algo_rating_type_lu ;;

  dimension: algo_rating_type_desc {
    type: string
    sql: ${TABLE}.algo_rating_type_desc ;;
  }

  dimension: algo_rating_type_id {
    type: number
    sql: ${TABLE}.algo_rating_type_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
