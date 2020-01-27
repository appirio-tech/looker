view: user_tax_form {
  sql_table_name: tcs_dw.user_tax_form ;;

  dimension_group: date_filed {
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
    sql: ${TABLE}.date_filed ;;
  }

  dimension: tax_form_desc {
    type: string
    sql: ${TABLE}.tax_form_desc ;;
  }

  dimension: tax_form_id {
    type: number
    sql: ${TABLE}.tax_form_id ;;
  }

  dimension: tax_form_name {
    type: string
    sql: ${TABLE}.tax_form_name ;;
  }

  dimension: tax_form_status {
    type: string
    sql: ${TABLE}.tax_form_status ;;
  }

  dimension: use_percentage {
    type: number
    sql: ${TABLE}.use_percentage ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: withholding_amount {
    type: number
    sql: ${TABLE}.withholding_amount ;;
  }

  dimension: withholding_percentage {
    type: number
    sql: ${TABLE}.withholding_percentage ;;
  }

  measure: count {
    type: count
    drill_fields: [tax_form_name]
  }
}
