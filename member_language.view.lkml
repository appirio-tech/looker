view: member_language {
  sql_table_name: tcs_dw.member_language ;;

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.user_id || ${TABLE}.language ;;
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
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}.created_by ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: spoken_level {
    type: string
    sql: ${TABLE}.spoken_level ;;
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
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: updated_by {
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: written_level {
    type: string
    sql: ${TABLE}.written_level ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
