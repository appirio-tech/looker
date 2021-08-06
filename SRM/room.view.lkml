view: room {
  sql_table_name: topcoder_dw.room ;;

  dimension: room_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.room_id ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: division_desc {
    type: string
    sql: ${TABLE}.division_desc ;;
  }

  dimension: division_id {
    type: number
    sql: ${TABLE}.division_id ;;
  }

  dimension: eligible {
    type: number
    sql: ${TABLE}.eligible ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: room_type_desc {
    type: string
    sql: ${TABLE}.room_type_desc ;;
  }

  dimension: room_type_id {
    type: number
    sql: ${TABLE}.room_type_id ;;
  }

  dimension: round_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.round_id ;;
  }

  dimension: state_code {
    type: string
    sql: ${TABLE}.state_code ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
  }

  dimension: unrated {
    type: number
    sql: ${TABLE}.unrated ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      room_id,
      name,
      state_name,
      country_name,
      round.round_id,
      round.name,
      round.short_name,
      request.count,
      room_result.count
    ]
  }
}
