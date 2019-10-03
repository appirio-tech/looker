view: topcoder_x_project {
  sql_table_name: tcs_dw.topcoder_x_project ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: archived {
    type: yesno
    sql: ${TABLE}.archived ;;
  }

  dimension: copilot {
    type: string
    sql: ${TABLE}.copilot ;;
  }

  dimension: owner {
    type: string
    sql: ${TABLE}.owner ;;
  }

  dimension: repo_url {
    type: string
    sql: ${TABLE}.repo_url ;;
  }

  dimension: secret_webhook_key {
    type: string
    sql: ${TABLE}.secret_webhook_key ;;
  }

  dimension: tc_direct_id {
    type: number
    sql: ${TABLE}.tc_direct_id ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
