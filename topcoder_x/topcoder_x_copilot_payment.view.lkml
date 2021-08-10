view: topcoder_x_copilot_payment {
  sql_table_name: tcs_dw.topcoder_x_copilot_payment ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  measure: amount {
    description: "Total Amount paid to the copilot"
    type: sum
    sql: ${TABLE}.amount ;;
  }

  dimension: challenge_id {
    description: "Challenge ID associated the the Payment"
    type: number
    sql: ${TABLE}.challenge_id ;;
  }

  dimension: closed {
    description: "Has the payment marked closed ?"
    type: yesno
    sql: ${TABLE}.closed ;;
  }

  dimension: description {
    description: "Details about the payment made"
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: project {
    description: "Topcoder X project Name"
    type: string
    sql: ${TABLE}.project ;;
  }

  dimension: status {
    description: "Status of the Payment"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_name {
    description: "Copilot Handle receiving the paymemnt"
    type: string
    sql: ${TABLE}.user_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, project, challenge_id,  user_name, amount, closed]
  }
}
