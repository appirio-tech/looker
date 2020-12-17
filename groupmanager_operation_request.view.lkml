view: groupmanager_operation_request {
  sql_table_name: groupmanager.operation_request ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: challenge_id {
    type: string
    sql: ${TABLE}.challenge_id__c ;;
  }

  dimension_group: created {
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

  dimension: destination_ba {
    type: string
    sql: ${TABLE}.destination_ba__c ;;
  }

  dimension: destination_tc_billing_account_id {
    type: string
    sql: ${TABLE}.destination_tc_billing_account_id__c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: operation {
    type: string
    sql: ${TABLE}.operation__c ;;
  }

  dimension: source_ba {
    type: string
    sql: ${TABLE}.source_ba__c ;;
  }

  dimension: source_tc_billing_account_id {
    type: string
    sql: ${TABLE}.source_tc_billing_account_id__c ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: updated {
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
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      challenge_id,
      name,
      destination_ba,
      destination_tc_billing_account_id,
      source_ba,
      source_tc_billing_account_id,
      operation,
      status
    ]
  }
}
