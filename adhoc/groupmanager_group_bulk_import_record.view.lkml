view: groupmanager_group_bulk_import_record {
  sql_table_name:groupmanager.bulk_import_record;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bulk_import_id {
    type: number
    sql: ${TABLE}.bulk_import_id ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: operation {
    type: string
    sql: ${TABLE}.operation ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
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
      bulk_import_id,
      group_name,
      email,
      operation,
      status,
      message,
      created_at_time,
      updated_at_time
    ]
  }
}
