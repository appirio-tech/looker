view: revenue_details {
  sql_table_name: tcs_dw.revenue_details ;;

  dimension_group: accounting {
    type: time
    timeframes: [
      raw,
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
    sql: ${TABLE}.accounting_date ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }

  dimension: end_customer {
    type: string
    sql: ${TABLE}.end_customer ;;
  }

  dimension: opportunity {
    type: string
    sql: ${TABLE}.opportunity ;;
  }

  measure: revenue {
    type: sum
    sql: ${TABLE}.revenue ;;
  }

  dimension: sales_item_reclass {
    type: string
    sql: ${TABLE}.sales_item_reclass ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
