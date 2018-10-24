view: member_community {
  sql_table_name: tcs_dw.member_community ;;

  dimension: blockchain {
    type: yesno
    sql: ${TABLE}.blockchain ;;
  }

  dimension: cognitive {
    type: yesno
    sql: ${TABLE}.cognitive ;;
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
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}.created_by ;;
  }

  dimension: ios {
    type: yesno
    sql: ${TABLE}.ios ;;
  }

  dimension: predix {
    type: yesno
    sql: ${TABLE}.predix ;;
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
    drill_fields: []
  }
}
