view: challenge_type {
  derived_table: {
    sql: SELECT distinct phase_id,
       phase_desc
FROM tcs_dw.project
 ;;
  }

  dimension: phase_id {
    description: "This is actually the challenge type"
    type: number
    sql: ${TABLE}.phase_id ;;
  }

  dimension: phase_desc {
    description: "This is actually the challenge type"
    type: string
    sql: ${TABLE}.phase_desc ;;
  }
}
