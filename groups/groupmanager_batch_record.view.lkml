view: groupmanager_batch_record {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: groupmanager.batch_record ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: batch_id {
    type: number
    sql: ${TABLE}.batch_id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: error_message {
    type: string
    sql: ${TABLE}.error_message ;;
  }

  dimension: user_api_request_json {
    type: string
    sql: ${TABLE}.user_api_request_json ;;
  }

  dimension: user_api_deactivation_json {
    type: string
    sql: ${TABLE}.user_api_deactivation_json ;;
  }

  dimension: user_api_request_groups_json {
    type: string
    sql: ${TABLE}.user_api_request_groups_json ;;
  }

  dimension: user_api_remove_groups_json {
    type: string
    sql: ${TABLE}.user_api_remove_groups_json ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: retry_count {
    type: number
    sql: ${TABLE}.retry_count ;;
  }

  set: detail {
    fields: [
      id,
      batch_id,
      email,
      status,
      error_message,
      user_api_request_json,
      user_api_deactivation_json,
      user_api_request_groups_json,
      user_api_remove_groups_json,
      created_at_time,
      updated_at_time,
      retry_count
    ]
  }

}
