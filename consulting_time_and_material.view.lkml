view: consulting_time_and_material {
  sql_table_name: tcs_dw.consulting_time_and_material ;;

  dimension: consulting_time_and_material_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.consulting_time_and_material_id ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension_group: end_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.end_date ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }

  dimension: resource_full_name {
    type: string
    sql: ${TABLE}.resource_full_name ;;
  }

  dimension: resource_topcoder_handle {
    type: string
    sql: ${TABLE}.resource_topcoder_handle ;;
  }

  dimension: resource_topcoder_user_id {
    type: number
    sql: ${TABLE}.resource_topcoder_user_id ;;
  }

  dimension_group: start_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.start_date ;;
  }

  dimension: timecard_id {
    type: string
    sql: ${TABLE}.timecard_id ;;
  }

  dimension: timecard_split_id {
    type: string
    sql: ${TABLE}.timecard_split_id ;;
  }

  measure: total_billable_hours {
    type: sum
    sql: ${TABLE}.total_billable_hours ;;
  }

  measure: total_hours {
    type: sum
    sql: ${TABLE}.total_hours ;;
  }

  measure: planned_bill_rate {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.planned_bill_rate ;;
  }

  measure: currency_planned_bill_rate {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.currency_planned_bill_rate ;;
  }

  measure: currency_t_and_m_equivalent_revenue_converted {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.currency_t_and_m_equivalent_revenue_converted ;;
  }

  measure: t_and_m_equivalent_revenue_converted {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.t_and_m_equivalent_revenue_converted ;;
  }

  measure: count {
    type: count
    drill_fields: [consulting_time_and_material_id, account_name, project_name, resource_full_name]
  }
}
