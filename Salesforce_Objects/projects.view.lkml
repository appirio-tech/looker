# The name of this view in Looker is "Projects"
view: projects {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: segment_tc_salesforce.projects ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: tc_connect_project_id_c {

    type: string
    sql: ${TABLE}.tc_connect_project_id_c ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Bu C" in Explore.

  dimension: bu_c {
    type: string
    sql: ${TABLE}.bu_c ;;
  }

  dimension: budget_c {
    type: string
    sql: ${TABLE}.budget_c ;;
  }

  dimension: budget_from_extension_c {
    type: string
    sql: ${TABLE}.budget_from_extension_c ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: close_date_c {
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
    sql: ${TABLE}.close_date_c ;;
  }

  dimension: con_ops_comments_c {
    type: string
    sql: ${TABLE}.con_ops_comments_c ;;
  }

  dimension: connect_project_c {
    type: string
    sql: ${TABLE}.connect_project_c ;;
  }

  dimension: connect_project_link_c {
    type: string
    sql: ${TABLE}.connect_project_link_c ;;
  }

  dimension: copy_payables_c {
    type: string
    sql: ${TABLE}.copy_payables_c ;;
  }

  dimension: cost_centre_c {
    type: string
    sql: ${TABLE}.cost_centre_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
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
    sql: ${TABLE}.created_date ;;
  }

  dimension: currency_iso_code {
    type: string
    sql: ${TABLE}.currency_iso_code ;;
  }

  dimension: customer_success_manager_c {
    type: string
    sql: ${TABLE}.customer_success_manager_c ;;
  }

  dimension: customer_success_manager_id_account_c {
    type: string
    sql: ${TABLE}.customer_success_manager_id_account_c ;;
  }

  dimension: customer_success_manager_name_c {
    type: string
    sql: ${TABLE}.customer_success_manager_name_c ;;
  }

  dimension: customer_success_segment_c {
    type: string
    sql: ${TABLE}.customer_success_segment_c ;;
  }

  dimension: data_science_budget_c {
    type: string
    sql: ${TABLE}.data_science_budget_c ;;
  }

  dimension: delivery_project_c {
    type: string
    sql: ${TABLE}.delivery_project_c ;;
  }

  dimension: delivery_status_c {
    type: string
    sql: ${TABLE}.delivery_status_c ;;
  }

  dimension: description_c {
    type: string
    sql: ${TABLE}.description_c ;;
  }

  dimension: direct_expense_c {
    type: string
    sql: ${TABLE}.direct_expense_c ;;
  }

  dimension: exchange_rate_c {
    type: number
    sql: ${TABLE}.exchange_rate_c ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_exchange_rate_c {
    type: sum
    sql: ${exchange_rate_c} ;;
  }

  measure: average_exchange_rate_c {
    type: average
    sql: ${exchange_rate_c} ;;
  }

  dimension: exclude_from_con_ops_radar_c {
    type: string
    sql: ${TABLE}.exclude_from_con_ops_radar_c ;;
  }

  dimension_group: first_start_date_c {
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
    sql: ${TABLE}.first_start_date_c ;;
  }

  dimension: forecast_on_hold_c {
    type: string
    sql: ${TABLE}.forecast_on_hold_c ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: is_closed_c {
    type: string
    sql: ${TABLE}.is_closed_c ;;
  }

  dimension: is_deleted {
    type: string
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_goodwill_c {
    type: string
    sql: ${TABLE}.is_goodwill_c ;;
  }

  dimension: is_owner_current_user_c {
    type: string
    sql: ${TABLE}.is_owner_current_user_c ;;
  }

  dimension: is_ps_budget_same_as_project_c {
    type: string
    sql: ${TABLE}.is_ps_budget_same_as_project_c ;;
  }

  dimension: is_won_c {
    type: string
    sql: ${TABLE}.is_won_c ;;
  }

  dimension_group: last_end_date_c {
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
    sql: ${TABLE}.last_end_date_c ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: last_referenced {
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
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension_group: last_viewed {
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
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension: mark_complete_c {
    type: string
    sql: ${TABLE}.mark_complete_c ;;
  }

  dimension: mark_up_c {
    type: string
    sql: ${TABLE}.mark_up_c ;;
  }

  dimension: marketing_influenced_c {
    type: string
    sql: ${TABLE}.marketing_influenced_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: next_step_c {
    type: string
    sql: ${TABLE}.next_step_c ;;
  }

  dimension_group: next_step_date_c {
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
    sql: ${TABLE}.next_step_date_c ;;
  }

  dimension: owner_name_c {
    type: string
    sql: ${TABLE}.owner_name_c ;;
  }

  dimension: owner_name_formula_c {
    type: string
    sql: ${TABLE}.owner_name_formula_c ;;
  }

  dimension: pricing_method_c {
    type: string
    sql: ${TABLE}.pricing_method_c ;;
  }

  dimension: probability_c {
    type: string
    sql: ${TABLE}.probability_c ;;
  }

  dimension_group: project_complete_date_c {
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
    sql: ${TABLE}.project_complete_date_c ;;
  }

  dimension: project_exists_c {
    type: string
    sql: ${TABLE}.project_exists_c ;;
  }

  dimension: project_owner_c {
    type: string
    sql: ${TABLE}.project_owner_c ;;
  }

  dimension: project_status_c {
    type: string
    sql: ${TABLE}.project_status_c ;;
  }

  dimension: purchase_order_c {
    type: string
    sql: ${TABLE}.purchase_order_c ;;
  }

  dimension: purchase_order_required_c {
    type: string
    sql: ${TABLE}.purchase_order_required_c ;;
  }

  dimension_group: received {
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
    sql: ${TABLE}.received_at ;;
  }

  dimension: reporting_account_c {
    type: string
    sql: ${TABLE}.reporting_account_c ;;
  }

  dimension: request_complete_requester_c {
    type: string
    sql: ${TABLE}.request_complete_requester_c ;;
  }

  dimension: request_mark_complete_c {
    type: string
    sql: ${TABLE}.request_mark_complete_c ;;
  }

  dimension: requestor_name_c {
    type: string
    sql: ${TABLE}.requestor_name_c ;;
  }

  dimension: smartsheet_id_c {
    type: string
    sql: ${TABLE}.smartsheet_id_c ;;
  }

  dimension: smartsheet_url_c {
    type: string
    sql: ${TABLE}.smartsheet_url_c ;;
  }

  dimension: solution_engineer_c {
    type: string
    sql: ${TABLE}.solution_engineer_c ;;
  }

  dimension: status_c {
    type: string
    sql: ${TABLE}.status_c ;;
  }

  dimension: subscription_c {
    type: string
    sql: ${TABLE}.subscription_c ;;
  }

  dimension: subscription_name_c {
    type: string
    sql: ${TABLE}.subscription_name_c ;;
  }

  dimension_group: system_modstamp {
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
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: total_approved_budget_ps_c {
    type: string
    sql: ${TABLE}.total_approved_budget_ps_c ;;
  }

  dimension: total_backlog_ps_c {
    type: string
    sql: ${TABLE}.total_backlog_ps_c ;;
  }

  dimension: total_billings_ps_c {
    type: string
    sql: ${TABLE}.total_billings_ps_c ;;
  }

  dimension: total_budget_c {
    type: string
    sql: ${TABLE}.total_budget_c ;;
  }

  dimension: total_challenge_fee_c {
    type: string
    sql: ${TABLE}.total_challenge_fee_c ;;
  }

  dimension: total_challenge_spend_c {
    type: string
    sql: ${TABLE}.total_challenge_spend_c ;;
  }

  dimension: total_expert_services_c {
    type: string
    sql: ${TABLE}.total_expert_services_c ;;
  }

  dimension: total_invoiced_amount_ps_c {
    type: string
    sql: ${TABLE}.total_invoiced_amount_ps_c ;;
  }

  dimension: total_license_fee_c {
    type: string
    sql: ${TABLE}.total_license_fee_c ;;
  }

  dimension: total_member_payment_c {
    type: string
    sql: ${TABLE}.total_member_payment_c ;;
  }

  dimension: total_product_amount_c {
    type: string
    sql: ${TABLE}.total_product_amount_c ;;
  }

  dimension: total_sponsorship_c {
    type: string
    sql: ${TABLE}.total_sponsorship_c ;;
  }

  dimension: total_taas_amount_c {
    type: string
    sql: ${TABLE}.total_taas_amount_c ;;
  }

  dimension: total_wipro_services_c {
    type: string
    sql: ${TABLE}.total_wipro_services_c ;;
  }

  dimension_group: uuid_ts {
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
    sql: ${TABLE}.uuid_ts ;;
  }

  measure: count {
    type: count
    drill_fields: [tc_connect_project_id_c, name]
  }
}
