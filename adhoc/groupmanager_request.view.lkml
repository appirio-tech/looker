view: groupmanager_request {

  sql_table_name: groupmanager.request;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: details {
    type: string
    sql: ${TABLE}.details ;;
  }

  dimension: request_type {
    type: string
    sql: ${TABLE}.request_type ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: processed {
    type: number
    sql: ${TABLE}.processed ;;
  }

  dimension: errors {
    type: number
    sql: ${TABLE}.errors ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}.created_by ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: common {
    type: string
    sql: ${TABLE}.common ;;
  }

  set: detail {
    fields: [
      id,
      name,
      details,
      request_type,
      status,
      total,
      processed,
      errors,
      created_by,
      created_at_time,
      updated_at_time,
      common
    ]
  }
}
