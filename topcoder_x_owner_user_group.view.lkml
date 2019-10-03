view: topcoder_x_owner_user_group {
  sql_table_name: tcs_dw.topcoder_x_owner_user_group ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: owner_user_name {
    type: string
    sql: ${TABLE}.owner_user_name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, owner_user_name]
  }
}
