view: topcoder_x_copilot_payment {
  sql_table_name: tcs_dw.topcoder_x_copilot_payment ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  measure: amount {
    type: sum
    sql: ${TABLE}.amount ;;
  }

  dimension: challenge_id {
    type: number
    sql: ${TABLE}.challenge_id ;;
  }

  dimension: closed {
    type: yesno
    sql: ${TABLE}.closed ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: project {
    type: string
    sql: ${TABLE}.project ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, user_name]
  }
}
