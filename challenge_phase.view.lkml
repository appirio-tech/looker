view: challenge_phase {
  sql_table_name: tcs_dw.project_phase ;;
  drill_fields: [challenge_phase_id,challenge_id,challenge_phase,duration,duration_in_days,scheduled_end_date,scheduled_start_date,actual_end_date,actual_start_date,modify_by,modify_date,create_date,created_by]

  dimension: challenge_phase_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.project_phase_id ;;
  }

  dimension_group: actual_end {
    description: "Date on which the challenge phase is actually ended "
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
    sql: ${TABLE}.actual_end_time ;;
  }

  dimension_group: actual_start {
    description: "Date on which the challenge phase is actually started "
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
    sql: ${TABLE}.actual_start_time ;;
  }

  dimension_group: create {
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
    sql: ${TABLE}.create_date ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}.created_by ;;
  }

  dimension: duration {
    description: "Challenge duration in milliseconds"
    type: number
    sql: ${TABLE}.duration ;;
  }

  dimension: duration_in_days {
    description: "Challenge duration in days "
    type: number
    sql: (${TABLE}.duration/ (60*60*24*1000)) ;;
  }

  dimension_group: fixed_start {
    hidden: yes
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
    sql: ${TABLE}.fixed_start_time ;;
  }

  dimension: modify_by {
    type: number
    sql: ${TABLE}.modify_by ;;
  }

  dimension_group: modify {
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
    sql: ${TABLE}.modify_date ;;
  }

  dimension: challenge_phase {
    description: "Challenge Phase like registration, submission, review, iterative review etc "
    type: string
    sql: ${TABLE}.phase_name ;;
  }

  dimension: challenge_phase_status {
    description: "Challenge Phase status like scheduled, open and closed "
    type: string
    sql: ${TABLE}.phase_status_desc ;;
  }

  dimension: phase_status_id {
    hidden: yes
    type: number
    sql: ${TABLE}.phase_status_id ;;
  }

  dimension: phase_type_id {
    hidden: yes
    type: number
    sql: ${TABLE}.phase_type_id ;;
  }

  dimension: challenge_id {
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension_group: scheduled_end {
    description: "Date on which the challenge phase is scheduled to end "
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
    sql: ${TABLE}.scheduled_end_time ;;
  }

  dimension_group: scheduled_start {
    description: "Date on which the challenge phase is scheduled to start "
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
    sql: ${TABLE}.scheduled_start_time ;;
  }

  measure: challenge_count {
    description: "The distinct challenge count"
    type: count_distinct
    sql: ${TABLE}.project_id ;;
  }

  measure: challenge_phase_count {
    type: count
    drill_fields: [challenge_id]
  }
}
