view: member_device {
  sql_table_name: tcs_dw.member_device ;;

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

  dimension: device_type {
    type: string
    description: "Type of device member is using to compete in challenges like Laptop, Desktop, Mobile etc."
    sql: ${TABLE}.device_type ;;
  }

  dimension: manufacturer {
    type: string
    description: "Manufacturer of the device that the member is using like Dell, HP, Apple etc."
    sql: ${TABLE}.manufacturer ;;
  }

  dimension: model {
    type: string
    description: "Specific model of the device manufacturer that the member is using"
    sql: ${TABLE}.model ;;
  }

  dimension: operating_system {
    type: string
    description: "Operating System of the device that the member is using"
    sql: ${TABLE}.operating_system ;;
  }

  dimension: os_language {
    type: string
    sql: ${TABLE}.os_language ;;
  }

  dimension: os_version {
    type: string
    description: "Version of the Operating system on the device member is using"
    sql: ${TABLE}.os_version ;;
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

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
