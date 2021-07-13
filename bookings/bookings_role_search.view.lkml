view: bookings_role_search {

  sql_table_name: public.bookings_role_search ;;
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
    description: ""
    type: string
    hidden: yes
    sql: ${TABLE}.created_by ;;
  }

  dimension_group: deleted {
    description: "Deleted Date will be populated when record is deleted"
    type: time
    hidden: yes
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

  dimension: job_description {
    type: string
    sql: ${TABLE}.job_description ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: skills {
    type: string
    description: "Skill GUIDs as comma separated string"
    sql: ${TABLE}.skills ;;
  }

  dimension: skills_name {
    type: string
    description: "Skill Names as comma separated string"
    sql: ${TABLE}.skills_name ;;
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


  measure: count {
    type: count
    drill_fields: [id]
  }
}
