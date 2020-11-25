view: groupmanager_connect {
  sql_table_name: groupmanager.connect ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  dimension: connect_id {
    type: number
    sql: ${TABLE}.connect_id ;;
  }

  dimension: api_response {
    type: string
    sql: ${TABLE}.api_response ;;
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

  dimension: created_by {
    type: number
    sql: ${TABLE}.created_by ;;
  }

  dimension: details_old {
    type: string
    sql: ${TABLE}.details_old ;;
  }

  dimension: details_update {
    type: string
    sql: ${TABLE}.details_update ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: retry_count {
    type: number
    sql: ${TABLE}.retry_count ;;
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

  dimension: updated_by {
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  set: detail {
    fields: [
      id,
      connect_id,
      created_by,
      message,
      name,
      retry_count,
      updated_by,
      status,
      details_update,
      api_response
    ]
  }
}
