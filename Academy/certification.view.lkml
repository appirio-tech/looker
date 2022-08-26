# The name of this view in Looker is "Certification"
view: certification {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: academy.certification ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Category" in Explore.

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: cert_type {
    type: string
    sql: ${TABLE}.cert_type ;;
  }

  dimension: certification {
    type: string
    sql: ${TABLE}.certification ;;
  }

  dimension: completion_hours {
    type: number
    sql: ${TABLE}.completion_hours ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_completion_hours {
    type: sum
    sql: ${completion_hours} ;;
  }

  measure: average_completion_hours {
    type: average
    sql: ${completion_hours} ;;
  }

  dimension: created_at {
    type: number
    sql: ${TABLE}.created_at ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: provider_certification_id {
    type: string
    sql: ${TABLE}.provider_certification_id ;;
  }

  dimension: provider_id {
    type: string
    sql: ${TABLE}.provider_id ;;
  }

  dimension: provider_name {
    type: string
    sql: ${TABLE}.provider_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: track_type {
    type: string
    sql: ${TABLE}.track_type ;;
  }

  dimension: updated_at {
    type: number
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, provider_name, certification_progress.count]
  }
}
