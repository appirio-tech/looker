view: job_candidates {

  sql_table_name: public.bookings_job_candidates ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    description: "unique identifier"
    type: string
    sql: ${TABLE}.id ;;
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
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension_group: deleted {
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
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: external_id {
    description: " Externam id mapped to the candidates"
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: job_id {
    description: "id of the job"
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension: resume {
    description: " resume of the candidate"
    type: string
    sql: ${TABLE}.resume ;;
  }

  dimension: status {
    description: " Status of the candidate"
    type: string
    sql: ${TABLE}.status ;;
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
    type: string
    sql: ${TABLE}.updated_by ;;
  }

  dimension: user_id {
    description: " user id of the candidate"
    type: string
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
