view: topcoder_x_owner_user_team {
  sql_table_name: tcs_dw.topcoder_x_owner_user_team ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: owner_token {
    type: string
    sql: ${TABLE}.owner_token ;;
  }

  dimension: owner_user_name {
    type: string
    sql: ${TABLE}.owner_user_name ;;
  }

  dimension: team_id {
    type: number
    sql: ${TABLE}.team_id ;;
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
