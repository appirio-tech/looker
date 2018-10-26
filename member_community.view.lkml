view: member_community {
  sql_table_name: tcs_dw.member_community ;;

  dimension: blockchain {
    type: yesno
    description: "'Yes' indicates that the member is a part of blockchain community"
    sql: ${TABLE}.blockchain ;;
  }

  dimension: cognitive {
    type: yesno
    description: "'Yes' indicates that the member is a part of cognitive community"
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
    description: "'Yes' indicates that the member is a part of IOS community"
    sql: ${TABLE}.ios ;;
  }

  dimension: predix {
    type: yesno
    description: "'Yes' indicates that the member is a part of predix community"
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
    primary_key: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
