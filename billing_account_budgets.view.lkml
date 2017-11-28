view: billing_account_budgets {
  derived_table: {
    sql: select cpd.client_id,
       cpd.client_name as customer_name,
       cpd.billing_project_id as billing_account_id,
       cpd.project_name as billing_account_name,
       cpd.billing_account_budget,
       cpd.billing_account_start_date,
       cpd.billing_account_end_date,
       cpd.billing_account_status,
       sum(ct.line_item_amount) as actual_total_spend,
       sum(CASE WHEN ct.line_item_category = 'Contest Fee' THEN ct.line_item_amount ELSE 0 END ) as fees,
       sum(CASE WHEN ct.line_item_category != 'Contest Fee' THEN ct.line_item_amount ELSE 0 END ) as member_payments
from client_project_dim cpd LEFT OUTER JOIN cost_transaction ct
      ON cpd.billing_project_id = ct.billing_project_id
WHERE (ct.contest_status is null OR ct.contest_status = 'Completed')
group by 1,2,3,4,5,6,7,8
       ;;
    sortkeys: ["customer_name", "billing_account_name", "billing_account_id"]
    distribution: "customer_name"
    persist_for: "8 hours"
  }

  dimension: customer_name {
    description: ""
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: client_id {
    description: ""
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: billing_account_id {
    type: number
    sql: ${TABLE}.billing_account_id ;;
  }

  dimension: billing_account_name {
    description: ""
    type: string
    sql: ${TABLE}.billing_account_name ;;
  }

  dimension: billing_account_status {
    description: ""
    type: string
    sql: ${TABLE}.billing_account_status ;;
  }

#  dimension: contest_status {
#    description: ""
#    type: string
#    sql: ${TABLE}.contest_status ;;
#  }

  dimension_group: billing_account_start_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
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
      year,
      quarter
    ]
    sql: ${TABLE}.billing_account_end_date ;;
  }

  measure: billing_account_budget {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.billing_account_budget ;;
  }

  measure: actual_total_spend {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.actual_total_spend ;;
  }

  measure: fees {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.fees ;;
  }

  measure: member_payments {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.member_payments ;;
  }


  measure: count {
    type: count
  }
}
