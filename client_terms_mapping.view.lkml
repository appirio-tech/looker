view: client_terms_mapping {
  sql_table_name: tcs_dw.client_terms_mapping ;;

  dimension: client_terms_mapping_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.client_terms_mapping_id ;;
  }

  dimension: billing_account_id {
    type: number
    sql: ${TABLE}.billing_account_id ;;
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

  dimension: resource_role {
    type: string
    sql: ${TABLE}.resource_role ;;
  }

  dimension: resource_role_id {
    type: number
    hidden: yes
    sql: ${TABLE}.resource_role_id ;;
  }

  dimension: terms_of_use_id {
    type: number
    hidden: yes
    sql: ${TABLE}.terms_of_use_id ;;
  }

  measure: count {
    type: count
    drill_fields: [client_terms_mapping_id, terms_of_use.terms_of_use_id]
  }
}
