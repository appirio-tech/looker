view: topcoder_x_user_mapping {
  sql_table_name: tcs_dw.topcoder_x_user_mapping ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: github_user_id {
    type: number
    sql: ${TABLE}.github_user_id ;;
  }

  dimension: github_user_name {
    type: string
    sql: ${TABLE}.github_user_name ;;
  }

  dimension: gitlab_user_id {
    type: number
    sql: ${TABLE}.gitlab_user_id ;;
  }

  dimension: gitlab_user_name {
    type: string
    sql: ${TABLE}.gitlab_user_name ;;
  }

  dimension: topcoder_user_name {
    type: string
    sql: ${TABLE}.topcoder_user_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, topcoder_user_name, gitlab_user_name, github_user_name]
  }
}
