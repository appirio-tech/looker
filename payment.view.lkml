view: payment {
  sql_table_name: tcs_dw.payment ;;

  dimension: payment_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  #-----------------------------Challenge IDs ----------------------------------#
  dimension: challenge_guid {
    label: "Challenge GUID"
    description: "Challenge GUID for the payment. Available for a V5 Payment Task"
    sql: ${TABLE}.challenge_guid ;;
  }


  dimension: challenge_system_id {
    type: string
    can_filter: no
    description:  "Legacy Id is present,display legacy Id else GUID
    (This field is useful for exporting at JSON.Use Blended Id for filtering)"
    sql:TRIM(${TABLE}.challenge_blended_id) ;;
  }


  dimension: challenge_blended_id {
    type: string
    hidden: yes
    description: "If Legacy Id is present,display legacy Id else GUID"
    sql: ${TABLE}.challenge_blended_id;;
  }


  dimension: reference_id {
    type: number
    sql: ${TABLE}.reference_id ;;
  }

  #-----------------------------End of Id column ---------------------------------#

  dimension: parent_payment_id {
    type: number
    sql: ${TABLE}.parent_payment_id ;;
  }

  dimension: charity_ind {
    type: number
    sql: ${TABLE}.charity_ind ;;
  }

  dimension: client {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension: created_calendar_id {
    type: number
    sql: ${TABLE}.created_calendar_id ;;
  }

  dimension: created_time_id {
    type: number
    sql: ${TABLE}.created_time_id ;;
  }

  dimension: installment_number {
    type: number
    sql: ${TABLE}.installment_number ;;
  }

  dimension: jira_ticket_id {
    type: string
    sql: ${TABLE}.jira_ticket_id ;;
  }

  dimension: modified_calendar_id {
    type: number
    sql: ${TABLE}.modified_calendar_id ;;
  }

  dimension: modified_time_id {
    type: number
    sql: ${TABLE}.modified_time_id ;;
  }

  dimension: payment_desc {
    type: string
    sql: ${TABLE}.payment_desc ;;
  }

  dimension: payment_status_desc {
    type: string
    sql: ${TABLE}.payment_status_desc ;;
  }

  dimension: payment_status_id {
    type: number
    sql: ${TABLE}.payment_status_id ;;
  }

  dimension: payment_type_desc {
    type: string
    sql: ${TABLE}.payment_type_desc ;;
  }

  dimension: payment_type_id {
    type: number
    sql: ${TABLE}.payment_type_id ;;
  }

  dimension: show_details_ind {
    type: number
    sql: ${TABLE}.show_details_ind ;;
  }

  dimension: show_in_profile_ind {
    type: number
    sql: ${TABLE}.show_in_profile_ind ;;
  }

  measure: count {
    type: count
    drill_fields: [parent_payment_id, payment.parent_payment_id, payment.count, user_payment.count]
  }
}
