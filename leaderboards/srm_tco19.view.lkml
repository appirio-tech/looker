view: srm_tco19 {
  sql_table_name: tcs_dw.srm_tco19 ;;

  dimension: competition {
    type: string
    sql: ${TABLE}.competition ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: track {
    type: string
    description: "Available values are SRM, Marathon Match, Sponsored Marathan Match"
    sql: ${TABLE}.track ;;
  }

  dimension: handle {
    type: string
    sql: ${TABLE}.handle ;;
  }

  measure: points {
    type: sum
    sql: ${TABLE}.points ;;
  }

  dimension: round_id {
    type: number
    sql: ${TABLE}.round_id ;;
  }

  measure: score {
    type: sum
    sql: ${TABLE}.score ;;
  }

  dimension: stage {
    type: number
    sql: ${TABLE}.stage ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
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
