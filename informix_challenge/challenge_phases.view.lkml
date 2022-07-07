view: challenge_phases {
  sql_table_name: tcs_dw.project_phase ;;
  drill_fields: [
                  challenge_phase_id,challenge_id,
                    phase_name,
                    duration_in_days,
                    scheduled_start_date,
                    scheduled_end_date,
                    actual_start_date,
                    actual_end_date,
                    modify_date,
                    create_date
               ]

  dimension: challenge_phase_id {
    primary_key: yes
    value_format_name: id
    type: number
    sql: ${TABLE}.project_phase_id ;;
  }

  dimension_group: actual_end {
    description: "Actual end date for the challenge phase"
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
    description: "Actual start date for the challenge phase"
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
    hidden: yes
    type: number
    sql: ${TABLE}.duration ;;
  }

  dimension: duration_in_days {
    description: "Approximate Phase duration in days.The value is rounded"
    type: number
    value_format_name: decimal_0
    sql: (${TABLE}.duration/ ( 60 * 60 * 24 * 1000)) ;;
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
    hidden: yes
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

  dimension: phase_name {
    description: "Phase name e.g. Registration, Submission, Review, Iterative review etc"
    type: string
    sql: ${TABLE}.phase_name ;;
  }

  dimension: phase_status {
    description: "Is the Phase Scheduled, Open or Closed"
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
    value_format_name: id
    type: number
    sql: ${TABLE}.phase_type_id ;;
  }

  dimension: challenge_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.project_id ;;
  }

  dimension_group: scheduled_end {
    description: "Initial planned end date for phase"
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
    description: "Initial planned start date for phase"
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
    description: "Distinct Challenge count"
    type: count_distinct
    hidden: yes
    sql: ${TABLE}.project_id ;;
  }

  measure: phase_count {
    type: count
  }

  measure: average_duration {
    type: average
    sql: ${TABLE}.duration / ( 60 * 60 * 24 * 1000) ;;
  }


}
