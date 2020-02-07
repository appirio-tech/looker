view: member_service_provider {
  sql_table_name: tcs_dw.member_service_provider ;;

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.user_id || ${TABLE}.name || ${TABLE}.service_provider_type ;;
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

  dimension: name {
    type: string
    description: "Name of Service Provider like Airtel, ATT etc."
    sql: ${TABLE}.name ;;
  }

  dimension: service_provider_type {
    type: string
    description: "Mobile Carrier/Internet Service Provider/Television/Other"
    sql: ${TABLE}.service_provider_type ;;
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

  measure: count {
    type: count
    drill_fields: [name]
  }
}
