# The name of this view in Looker is "Certification Progress"
view: certification_progress {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: academy.certification_progress ;;

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Academic Honesty Policy Accepted At" in Explore.

  dimension: academic_honesty_policy_accepted_at {
    type: number
    sql: ${TABLE}.academic_honesty_policy_accepted_at ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  measure: completed_cert {
    type: count
    filters: {
      field: status
      value: "completed"
    }
  }

  measure: in_progress_cert {
    type: count
    filters: {
      field: status
      value: "in-progress"
    }
  }


  dimension: cert_type {
    type: string
    sql: ${TABLE}.cert_type ;;
  }

  dimension: certification {
    type: string
    sql: ${TABLE}.certification ;;
  }

  dimension: certification_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.certification_id ;;
  }

  dimension: certification_title {
    type: string
    sql: ${TABLE}.certification_title ;;
  }

  dimension: certification_track_type {
    type: string
    sql: ${TABLE}.certification_track_type ;;
  }

  dimension: course_id {
    type: string
    sql: ${TABLE}.course_id ;;
  }

  dimension: course_key {
    type: string
    sql: ${TABLE}.course_key ;;
  }

  dimension: created_at {
    type: number
    sql: ${TABLE}.created_at ;;
  }

  dimension: current_lesson {
    type: string
    sql: ${TABLE}.current_lesson ;;
  }

  dimension: modules {
    type: string
    sql: ${TABLE}.modules ;;
  }

  dimension: provider {
    type: string
    sql: ${TABLE}.provider ;;
  }

  dimension: provider_url {
    type: string
    sql: ${TABLE}.provider_url ;;
  }

  dimension: start_date {
    type: number
    sql: ${TABLE}.start_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: last_updated {
    type: date
    hidden: yes
    sql: timestamp 'epoch' + cast(${updated_at}  as bigint) / 1000 * interval '1 second';;
  }


  dimension_group: last_activity {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${last_updated} ;;
  }


  dimension: updated_at {
    type: number
    sql:${TABLE}.updated_at;;
    }


  dimension: user_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.user_id ;;
  }


  measure: count {
    type: count_distinct
    sql:${user_id}   ;;

  }



}
