view: season_team_rank {
  sql_table_name: topcoder_dw.season_team_rank ;;

  dimension: percentile {
    type: number
    sql: ${TABLE}.percentile ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
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
