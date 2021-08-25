view: user_payment_method {
  sql_table_name: tcs_dw.user_payment_method ;;

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

  dimension: payment_method_desc {
    type: string
    sql: ${TABLE}.payment_method_desc ;;
    description: "User payment method such as payoneer,Western Union, Wipro payroll etc."
  }

  dimension: payment_method_id {
    type: number
    sql: ${TABLE}.payment_method_id ;;
    description: "Id associated with the payment method"
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
