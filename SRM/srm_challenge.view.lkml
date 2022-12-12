view: srm_challenge {
  sql_table_name: topcoder_dw.challenge ;;
  drill_fields: [challenge_id]

  dimension: challenge_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.challenge_id ;;
  }

  dimension: args {
    type: string
    sql: ${TABLE}.args ;;
  }

  dimension: challenger_id {
    type: number
    sql: ${TABLE}.challenger_id ;;
  }

  dimension: challenger_points {
    type: number
    sql: ${TABLE}.challenger_points ;;
  }

  dimension: defendant_id {
    type: number
    sql: ${TABLE}.defendant_id ;;
  }

  dimension: defendant_points {
    type: number
    sql: ${TABLE}.defendant_points ;;
  }

  dimension: expected {
    type: string
    sql: ${TABLE}.expected ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: problem_id {
    type: number
    sql: ${TABLE}.problem_id ;;
  }

  dimension: received {
    type: string
    sql: ${TABLE}.received ;;
  }

  dimension: round_id {
    type: number
    sql: ${TABLE}.round_id ;;
  }

  dimension: submit_time {
    type: number
    hidden: yes
    sql: ${TABLE}.submit_time ;;
  }

  dimension: submission_tme {
    type: date
    sql: timestamp 'epoch' + cast(${submit_time}  as bigint) / 1000 * interval '1 second'
    ;;
  }


  dimension_group: submission_date {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${submission_tme} ;;
  }


  dimension: succeeded {
    type: number
    sql: ${TABLE}.succeeded ;;
  }

  dimension: time_elapsed {
    type: number
    sql: ${TABLE}.time_elapsed ;;
  }

  measure: count {
    type: count
    drill_fields: [challenge_id]
  }
}
