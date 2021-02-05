view: wipro_payment_validation {
  sql_table_name: adhoc.wipro_payment_validation ;;
  drill_fields: [id]


  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: challenge_id {
    description: "Challenge id to which the payment is mapped"
    type: number
    sql: ${TABLE}.challenge_id ;;
  }

  dimension_group: created {
    description: "Time of record creation"
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: gross_amount {
    type: number
    sql: ${TABLE}.gross_amount ;;
  }

  dimension: handle {
    description: "Handle of the user"
    type: string
    sql: ${TABLE}.handle ;;
  }

  dimension: isprocessed {
    description: "Flag to check if the record has been processed by Marker Process "
    type: yesno
    sql: ${TABLE}.isprocessed ;;
  }

  dimension: isvalidated {
    description: "Flag to check if the record passed validated against payment table from ifgx"
    type: yesno
    sql: ${TABLE}.isvalidated ;;
  }

  dimension: looker_amount {
    description: "Amount in the looker payment table"
    type: number
    sql: ${TABLE}.looker_amount ;;
  }

  dimension: payment_detail_id {
    description: "Payment detail id"
    type: number
    sql: ${TABLE}.payment_detail_id ;;
  }

  dimension: payment_id {
    description: "Payment id"
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension: payment_method_desc {
    description: "Payment method associated with the user"
    type: string
    sql: ${TABLE}.payment_method_desc ;;
  }

  dimension: payment_status_id {
    description: "Status id of the payment"
    type: number
    sql: ${TABLE}.payment_status_id ;;
  }

  dimension: topgear_amount {
    description: "Amount provided by the topgear team"
    type: number
    sql: ${TABLE}.topgear_amount ;;
  }

  dimension_group: updated {
    description: "Time for record updation"
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
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
