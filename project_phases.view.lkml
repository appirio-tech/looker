view: connect_project_phases {
  sql_table_name: public.project_phases ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
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
    type: number
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

  dimension: deleted_by {
    type: number
    sql: ${TABLE}.deleted_by ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: phase_product_actual_price {
    type: number
    sql: ${TABLE}.phase_product_actual_price ;;
  }

  dimension: phase_product_estimated_price {
    type: number
    sql: ${TABLE}.phase_product_estimated_price ;;
  }

  dimension: phase_product_id {
    type: number
    sql: ${TABLE}.phase_product_id ;;
  }

  dimension: phase_product_name {
    type: string
    sql: ${TABLE}.phase_product_name ;;
  }

  dimension: phase_product_template_id {
    type: number
    sql: ${TABLE}.phase_product_template_id ;;
  }

  dimension: phase_product_type {
    type: string
    sql: ${TABLE}.phase_product_type ;;
  }

  dimension: product_template_brief {
    type: string
    sql: ${TABLE}.product_template_brief ;;
  }

  dimension: product_template_category {
    type: string
    sql: ${TABLE}.product_template_category ;;
  }

  dimension: product_template_details {
    type: string
    sql: ${TABLE}.product_template_details ;;
  }

  dimension: product_template_disabled {
    type: yesno
    sql: ${TABLE}.product_template_disabled ;;
  }

  dimension: product_template_hidden {
    type: yesno
    sql: ${TABLE}.product_template_hidden ;;
  }

  dimension: product_template_name {
    type: string
    sql: ${TABLE}.product_template_name ;;
  }

  dimension: product_template_product_key {
    type: string
    sql: ${TABLE}.product_template_product_key ;;
  }

  dimension: progress {
    type: number
    sql: ${TABLE}.progress ;;
  }

  dimension: project_id {
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension: spent_budget {
    type: number
    sql: ${TABLE}.spent_budget ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: status {
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
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  measure: count {
    type: count
    drill_fields: [id, product_template_name, phase_product_name, name]
  }
}
