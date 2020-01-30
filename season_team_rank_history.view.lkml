view: season_team_rank_history {
  sql_table_name: topcoder_dw.season_team_rank_history ;;

  dimension: percentile {
    type: number
    sql: ${TABLE}.percentile ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: round_id {
    type: number
    sql: ${TABLE}.round_id ;;
  }

  dimension: season_id {
    type: number
    sql: ${TABLE}.season_id ;;
  }

  dimension: team_id {
    type: number
    sql: ${TABLE}.team_id ;;
  }

  dimension: team_points {
    type: number
    sql: ${TABLE}.team_points ;;
  }

  dimension: team_rank_type_id {
    type: number
    sql: ${TABLE}.team_rank_type_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
