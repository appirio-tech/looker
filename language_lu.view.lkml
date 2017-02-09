view: language_lu {
  sql_table_name: topcoder_dw.language_lu ;;

  dimension: language_desc {
    type: string
    sql: ${TABLE}.language_desc ;;
  }

  dimension: language_id {
    type: number
    sql: ${TABLE}.language_id ;;
  }

  dimension: language_name {
    type: string
    sql: ${TABLE}.language_name ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [language_name]
  }
}
