view: client_project_dim {
  sql_table_name: tcs_dw.client_project_dim ;;

  dimension: billing_account_code {
    type: string
    sql: ${TABLE}.billing_account_code ;;
  }

  dimension: billing_account_id {
    type: number
    sql: ${TABLE}.billing_project_id ;;
  }

  dimension_group: client_create {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.client_create_date ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: client_modification {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.client_modification_date ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: client_project_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.client_project_id ;;
  }

  dimension: cmc_account_id {
    type: string
    sql: ${TABLE}.cmc_account_id ;;
  }

  dimension: customer_number {
    type: string
    sql: ${TABLE}.customer_number ;;
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

  dimension: billing_account_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }

  dimension: subscription_number {
    type: string
    sql: ${TABLE}.subscription_number ;;
  }

  dimension: billing_account_status {
    type: string
    sql: ${TABLE}.billing_account_status ;;
  }

  dimension_group: billing_account_start_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.billing_account_start_date ;;
  }

  dimension_group: billing_account_end_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.billing_account_end_date ;;
  }

  measure: billing_account_budget {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.billing_account_budget ;;
  }


  measure: count {
    type: count
    drill_fields: [client_name]
  }
}
