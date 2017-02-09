view: direct_project_dim {
  sql_table_name: tcs_dw.direct_project_dim ;;

  dimension: billing_account_id {
    type: number
    sql: ${TABLE}.billing_project_id ;;
  }

  dimension: direct_project_id {
    type: number
    sql: ${TABLE}.direct_project_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: project_create {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.project_create_date ;;
  }

  dimension_group: project_modification {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.project_modification_date ;;
  }

  dimension: project_status_id {
    type: number
    sql: ${TABLE}.project_status_id ;;
  }

  dimension: project_status_desc {
    type: string
    sql: CASE WHEN ${project_status_id} = 1 THEN 'Active'
          WHEN ${project_status_id} = 2 THEN 'Inactive'
          WHEN ${project_status_id} = 3 THEN 'Cancelled'
          WHEN ${project_status_id} = 4 THEN 'Completed'
          WHEN ${project_status_id} = 5 THEN 'Draft'
          ELSE 'NA'
      END
       ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
