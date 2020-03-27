view: user_payment {
  sql_table_name: tcs_dw.user_payment ;;

  dimension: user_payment_id {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.payment_id, ${TABLE}.user_id) ;;
  }

  dimension: payment_id {
    type: number
    # hidden: true
    sql: ${TABLE}.payment_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: due_calendar_id {
    type: number
    sql: ${TABLE}.due_calendar_id ;;
  }

  dimension: paid_calendar_id {
    type: number
    sql: ${TABLE}.paid_calendar_id ;;
  }

  measure: count {
    type: count
    drill_fields: [payment.parent_payment_id]
  }

 measure: distinct_user_count {
   type: count_distinct
   sql:  ${user_id};;
   description: "Distinct Users Paid"
 }

  measure: gross_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    description: "Prize Money Amount Paid to the Winner"
    sql: ${TABLE}.gross_amount ;;
  }

  measure: net_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.net_amount ;;
  }

  measure: total_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    description: "Total Amount of Prize. A prize can be split into multiple payments. Use Gross Amount to get the amount paid"
    sql: ${TABLE}.total_amount ;;
  }
}
