view: topcoder_x_user {
  sql_table_name: tcs_dw.topcoder_x_user ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: access_token {
    type: string
    sql: ${TABLE}.access_token ;;
  }

  dimension_group: access_token_expiration {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.access_token_expiration ;;
  }

  dimension: refresh_token {
    type: string
    sql: ${TABLE}.refresh_token ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: user_provider_id {
    type: number
    sql: ${TABLE}.user_provider_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, user_name]
  }
}
