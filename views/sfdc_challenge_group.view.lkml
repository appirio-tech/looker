view: sfdc_challenge_group {
  sql_table_name: adhoc.sfdc_challenge_group ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: challenge_id {
    type: number
    sql: ${TABLE}.challenge_id ;;
  }

  dimension: group_updated {
    type: yesno
    sql: ${TABLE}.group_updated ;;
  }

  dimension: taas_resource {
    type: string
    sql: ${TABLE}.taas_resource ;;
  }

  dimension: taas_resource_direct_project_id {
    type: number
    sql: ${TABLE}.taas_resource_direct_project_id ;;
  }

  dimension: taas_resource_group_id {
    type: string
    sql: ${TABLE}.taas_resource_group_id ;;
  }

  dimension: taas_resource_group_name {
    type: string
    sql: ${TABLE}.taas_resource_group_name ;;
  }

  dimension: taas_resource_name {
    type: string
    sql: ${TABLE}.taas_resource_name ;;
  }

  dimension: taas_resource_resource_handle {
    type: string
    sql: ${TABLE}.taas_resource_resource_handle ;;
  }

  dimension_group: week_end {
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
    sql: ${TABLE}.week_end_date ;;
  }

  measure: count {
    type: count
    drill_fields: [id, taas_resource_group_name, taas_resource_name]
  }
}
