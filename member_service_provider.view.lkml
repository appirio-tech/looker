view: member_service_provider {
  sql_table_name: tcs_dw.member_service_provider ;;

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
      year
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
