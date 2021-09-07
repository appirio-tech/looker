view: direct_budget {
  derived_table: {
    sql: SELECT
      payment_id,
      reference_id,
      parent_payment_id,
      payment_desc
      FROM tcs_dw.payment
       ;;
    distribution: "payment_id"
    persist_for: "8 hours"
    sortkeys: ["payment_id","reference_id"]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension: reference_id {
    type: number
    sql: ${TABLE}.reference_id ;;
  }

  dimension: parent_payment_id {
    type: number
    sql: ${TABLE}.parent_payment_id ;;
  }

  dimension: payment_desc {
    type: string
    sql: ${TABLE}.payment_desc ;;
  }

  set: detail {
    fields: [payment_id, reference_id, parent_payment_id, payment_desc]
  }
}
