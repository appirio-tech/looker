view: terms_of_use {
  sql_table_name: tcs_dw.terms_of_use ;;

  dimension: terms_of_use_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.terms_of_use_id ;;
  }

  dimension_group: create {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.create_date ;;
  }

  dimension: docusign_template_id {
    type: string
    sql: ${TABLE}.docusign_template_id ;;
  }

  dimension_group: modify {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.modify_date ;;
  }

  dimension: terms_of_use_agreeability_type_desc {
    type: string
    sql: ${TABLE}.terms_of_use_agreeability_type_desc ;;
  }

  dimension: terms_of_use_agreeability_type_id {
    type: number
    sql: ${TABLE}.terms_of_use_agreeability_type_id ;;
  }

  dimension: terms_of_use_type_desc {
    type: string
    sql: ${TABLE}.terms_of_use_type_desc ;;
  }

  dimension: terms_of_use_type_id {
    type: number
    sql: ${TABLE}.terms_of_use_type_id ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: [terms_of_use_id, client_terms_mapping.count]
  }
}
