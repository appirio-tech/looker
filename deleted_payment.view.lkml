view: deleted_payment {

  sql_table_name: adhoc.deleted_payment ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: net_amount {
    type: number
    sql: ${TABLE}.net_amount ;;
  }

  dimension: gross_amount {
    type: number
    sql: ${TABLE}.gross_amount ;;
  }

  dimension: payment_type_id {
    type: number
    sql: ${TABLE}.payment_type_id ;;
  }

  dimension: payment_type_desc {
    type: string
    sql: ${TABLE}.payment_type_desc ;;
  }

  dimension: reference_id {
    type: number
    sql: ${TABLE}.reference_id ;;
  }

  dimension: parent_payment_id {
    type: number
    sql: ${TABLE}.parent_payment_id ;;
  }

  dimension: charity_ind {
    type: number
    sql: ${TABLE}.charity_ind ;;
  }

  dimension: show_in_profile_ind {
    type: number
    sql: ${TABLE}.show_in_profile_ind ;;
  }

  dimension: show_details_ind {
    type: number
    sql: ${TABLE}.show_details_ind ;;
  }

  dimension: payment_status_id {
    type: number
    sql: ${TABLE}.payment_status_id ;;
  }

  dimension: payment_status_desc {
    type: string
    sql: ${TABLE}.payment_status_desc ;;
  }

  dimension: client {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension_group: modified_date {
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
    sql: ${TABLE}.modified_date ;;
  }

  dimension: installment_number {
    type: number
    sql: ${TABLE}.installment_number ;;
  }

  dimension: jira_ticket_id {
    type: string
    sql: ${TABLE}.jira_ticket_id ;;
  }

  dimension_group: created_date {
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
    sql: ${TABLE}.created_date ;;
  }

  dimension: payment_desc {
    type: string
    sql: ${TABLE}.payment_desc ;;
  }

  dimension_group: paid_date {
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
    sql: ${TABLE}.paid_date ;;
  }

  dimension_group: due_date {
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
    sql: ${TABLE}.due_date ;;
  }

  set: detail {
    fields: [
      payment_id,
      user_id,
      net_amount,
      gross_amount,
      payment_type_id,
      payment_type_desc,
      reference_id,
      parent_payment_id,
      charity_ind,
      show_in_profile_ind,
      show_details_ind,
      payment_status_id,
      payment_status_desc,
      client,
      modified_date_time,
      installment_number,
      jira_ticket_id,
      created_date_time,
      payment_desc,
      paid_date_time,
      due_date_time
    ]
  }
}
