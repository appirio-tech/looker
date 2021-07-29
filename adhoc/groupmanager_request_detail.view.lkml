view: groupmanager_request_detail {
  sql_table_name:groupmanager.request_detail;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: request_id {
    type: number
    sql: ${TABLE}.request_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: error_message {
    type: string
    sql: ${TABLE}.error_message ;;
  }

  dimension: detail {
    type: string
    sql: ${TABLE}.detail ;;
  }

  dimension: retry_count {
    type: number
    sql: ${TABLE}.retry_count ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  set: detail {
    fields: [
      id,
      request_id,
      status,
      error_message,
      detail,
      retry_count,
      created_at_time,
      updated_at_time
    ]
  }
}
