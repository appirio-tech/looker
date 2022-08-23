# The name of this view in Looker is "Topcoder Billing Accounts"
view: topcoder_billing_accounts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: segment_tc_salesforce.topcoder_billing_accounts ;;
  drill_fields: [topcoder_billing_account_id_formula_c]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: topcoder_billing_account_id_formula_c {
    primary_key: yes
    type: string
    sql: ${TABLE}.topcoder_billing_account_id_formula_c ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Acceptance C" in Explore.

  dimension: acceptance_c {
    type: string
    sql: ${TABLE}.acceptance_c ;;
  }

  dimension: account_c {
    type: string
    sql: ${TABLE}.account_c ;;
  }

  dimension: account_name_c {
    type: string
    sql: ${TABLE}.account_name_c ;;
  }

  dimension: active_c {
    type: string
    sql: ${TABLE}.active_c ;;
  }

  dimension: actual_challenge_fee_looker_c {
    type: string
    sql: ${TABLE}.actual_challenge_fee_looker_c ;;
  }

  dimension: actual_challenge_fee_payment_c {
    type: string
    sql: ${TABLE}.actual_challenge_fee_payment_c ;;
  }

  dimension: actual_fee_c {
    type: string
    sql: ${TABLE}.actual_fee_c ;;
  }

  dimension: actual_member_payment_c {
    type: string
    sql: ${TABLE}.actual_member_payment_c ;;
  }

  dimension: actual_member_payment_looker_c {
    type: string
    sql: ${TABLE}.actual_member_payment_looker_c ;;
  }

  dimension: actual_member_payment_payment_c {
    type: string
    sql: ${TABLE}.actual_member_payment_payment_c ;;
  }

  dimension: actual_payment_to_consumed_budget_ratio_c {
    type: string
    sql: ${TABLE}.actual_payment_to_consumed_budget_ratio_c ;;
  }

  dimension: actual_total_challenge_c {
    type: string
    sql: ${TABLE}.actual_total_challenge_c ;;
  }

  dimension: actual_total_product_c {
    type: string
    sql: ${TABLE}.actual_total_product_c ;;
  }

  dimension: actuals_to_update_c {
    type: string
    sql: ${TABLE}.actuals_to_update_c ;;
  }

  dimension: alert_c {
    type: string
    sql: ${TABLE}.alert_c ;;
  }

  dimension: alert_now_c {
    type: string
    sql: ${TABLE}.alert_now_c ;;
  }

  dimension: approved_budget_of_project_stream_c {
    type: string
    sql: ${TABLE}.approved_budget_of_project_stream_c ;;
  }

  dimension: auto_move_in_ps_c {
    type: string
    sql: ${TABLE}.auto_move_in_ps_c ;;
  }

  dimension: ba_owner_name_c {
    type: string
    sql: ${TABLE}.ba_owner_name_c ;;
  }

  dimension: ba_owner_user_name_c {
    type: string
    sql: ${TABLE}.ba_owner_user_name_c ;;
  }

  dimension: ba_spoc_user_name_c {
    type: string
    sql: ${TABLE}.ba_spoc_user_name_c ;;
  }

  dimension: billable_amount_project_stream_c {
    type: string
    sql: ${TABLE}.billable_amount_project_stream_c ;;
  }

  dimension: billable_c {
    type: string
    sql: ${TABLE}.billable_c ;;
  }

  dimension: billing_account_in_workday_c {
    type: string
    sql: ${TABLE}.billing_account_in_workday_c ;;
  }

  dimension: billing_account_name_c {
    type: string
    sql: ${TABLE}.billing_account_name_c ;;
  }

  dimension: billing_account_type_c {
    type: string
    sql: ${TABLE}.billing_account_type_c ;;
  }

  dimension: billing_contact_information_c {
    type: string
    sql: ${TABLE}.billing_contact_information_c ;;
  }

  dimension: billing_frequency_c {
    type: string
    sql: ${TABLE}.billing_frequency_c ;;
  }

  dimension: billing_notes_c {
    type: string
    sql: ${TABLE}.billing_notes_c ;;
  }

  dimension: challenge_budget_c {
    type: string
    sql: ${TABLE}.challenge_budget_c ;;
  }

  dimension: challenge_fee_project_stream_c {
    type: string
    sql: ${TABLE}.challenge_fee_project_stream_c ;;
  }

  dimension: challenge_fee_to_member_pay_ratio_ps_c {
    type: string
    sql: ${TABLE}.challenge_fee_to_member_pay_ratio_ps_c ;;
  }

  dimension: check_looker_for_actuals_c {
    type: string
    sql: ${TABLE}.check_looker_for_actuals_c ;;
  }

  dimension: closed_as_fee_c {
    type: string
    sql: ${TABLE}.closed_as_fee_c ;;
  }

  dimension: closed_as_unused_c {
    type: string
    sql: ${TABLE}.closed_as_unused_c ;;
  }

  dimension: connect_project_c {
    type: string
    sql: ${TABLE}.connect_project_c ;;
  }

  dimension: connect_project_link_c {
    type: string
    sql: ${TABLE}.connect_project_link_c ;;
  }

  dimension: consumed_budget_c {
    type: string
    sql: ${TABLE}.consumed_budget_c ;;
  }

  dimension: consumed_c {
    type: string
    sql: ${TABLE}.consumed_c ;;
  }

  dimension: cost_center_c {
    type: string
    sql: ${TABLE}.cost_center_c ;;
  }

  dimension: counts_for_app_xpress_c {
    type: string
    sql: ${TABLE}.counts_for_app_xpress_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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

  dimension: days_until_expire_c {
    type: number
    sql: ${TABLE}.days_until_expire_c ;;
  }

  dimension: delivery_project_c {
    type: string
    sql: ${TABLE}.delivery_project_c ;;
  }

  dimension: don_t_show_on_payment_tool_c {
    type: string
    sql: ${TABLE}.don_t_show_on_payment_tool_c ;;
  }

  dimension: duration_days_c {
    type: number
    sql: ${TABLE}.duration_days_c ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_duration_days_c {
    type: sum
    sql: ${duration_days_c} ;;
  }

  measure: average_duration_days_c {
    type: average
    sql: ${duration_days_c} ;;
  }

  dimension: effective_budget_for_forecast_c {
    type: string
    sql: ${TABLE}.effective_budget_for_forecast_c ;;
  }

  dimension_group: end_date_c {
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
    sql: ${TABLE}.end_date_c ;;
  }

  dimension: error_in_load_c {
    type: string
    sql: ${TABLE}.error_in_load_c ;;
  }

  dimension: estimated_markup_c {
    type: string
    sql: ${TABLE}.estimated_markup_c ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: is_deleted {
    type: string
    sql: ${TABLE}.is_deleted ;;
  }

  dimension_group: last_challenge_complete_date_c {
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
    sql: ${TABLE}.last_challenge_complete_date_c ;;
  }

  dimension_group: last_manual_forecast_update_c {
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
    sql: ${TABLE}.last_manual_forecast_update_c ;;
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

  dimension_group: last_status_updated_date_c {
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
    sql: ${TABLE}.last_status_updated_date_c ;;
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

  dimension: legacy_id_c {
    type: string
    sql: ${TABLE}.legacy_id_c ;;
  }

  dimension: legacy_opportunity_id_c {
    type: string
    sql: ${TABLE}.legacy_opportunity_id_c ;;
  }

  dimension: lenth_of_name_c {
    type: number
    sql: ${TABLE}.lenth_of_name_c ;;
  }

  dimension: looker_process_ok_c {
    type: string
    sql: ${TABLE}.looker_process_ok_c ;;
  }

  dimension: manual_c {
    type: string
    sql: ${TABLE}.manual_c ;;
  }

  dimension: manual_forecast_update_delay_c {
    type: string
    sql: ${TABLE}.manual_forecast_update_delay_c ;;
  }

  dimension: mark_up_c {
    type: string
    sql: ${TABLE}.mark_up_c ;;
  }

  dimension: member_payment_difference_c {
    type: string
    sql: ${TABLE}.member_payment_difference_c ;;
  }

  dimension: member_payment_project_stream_c {
    type: string
    sql: ${TABLE}.member_payment_project_stream_c ;;
  }

  dimension: member_payment_waiting_to_move_c {
    type: string
    sql: ${TABLE}.member_payment_waiting_to_move_c ;;
  }

  dimension: merge_payments_c {
    type: string
    sql: ${TABLE}.merge_payments_c ;;
  }

  dimension: milestone_process_c {
    type: string
    sql: ${TABLE}.milestone_process_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: opportunity_c {
    type: string
    sql: ${TABLE}.opportunity_c ;;
  }

  dimension: opportunity_deal_type_c {
    type: string
    sql: ${TABLE}.opportunity_deal_type_c ;;
  }

  dimension: opportunity_project_c {
    type: string
    sql: ${TABLE}.opportunity_project_c ;;
  }

  dimension: opportunity_project_name_c {
    type: string
    sql: ${TABLE}.opportunity_project_name_c ;;
  }

  dimension: overflow_allowed_c {
    type: string
    sql: ${TABLE}.overflow_allowed_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension_group: parent_close_date_c {
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
    sql: ${TABLE}.parent_close_date_c ;;
  }

  dimension: parent_has_services_c {
    type: string
    sql: ${TABLE}.parent_has_services_c ;;
  }

  dimension: parent_id_c {
    type: string
    sql: ${TABLE}.parent_id_c ;;
  }

  dimension: payment_early_release_c {
    type: string
    sql: ${TABLE}.payment_early_release_c ;;
  }

  dimension: payment_terms_c {
    type: string
    sql: ${TABLE}.payment_terms_c ;;
  }

  dimension: payments_moved_after_invoice_c {
    type: string
    sql: ${TABLE}.payments_moved_after_invoice_c ;;
  }

  dimension: po_c {
    type: string
    sql: ${TABLE}.po_c ;;
  }

  dimension: po_information_c {
    type: string
    sql: ${TABLE}.po_information_c ;;
  }

  dimension: pre_sfdc_ba_c {
    type: string
    sql: ${TABLE}.pre_sfdc_ba_c ;;
  }

  dimension: pricing_method_c {
    type: string
    sql: ${TABLE}.pricing_method_c ;;
  }

  dimension: project_stream_billing_c {
    type: string
    sql: ${TABLE}.project_stream_billing_c ;;
  }

  dimension: psa_project_c {
    type: string
    sql: ${TABLE}.psa_project_c ;;
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

  dimension: remaining_budget_c {
    type: string
    sql: ${TABLE}.remaining_budget_c ;;
  }

  dimension: remaining_budget_project_stream_c {
    type: string
    sql: ${TABLE}.remaining_budget_project_stream_c ;;
  }

  dimension: remaining_planned_member_payment_c {
    type: string
    sql: ${TABLE}.remaining_planned_member_payment_c ;;
  }

  dimension: remaining_taas_weeks_c {
    type: number
    sql: ${TABLE}.remaining_taas_weeks_c ;;
  }

  dimension: remove_from_forecast_c {
    type: string
    sql: ${TABLE}.remove_from_forecast_c ;;
  }

  dimension: reporting_account_c {
    type: string
    sql: ${TABLE}.reporting_account_c ;;
  }

  dimension: resource_handle_c {
    type: string
    sql: ${TABLE}.resource_handle_c ;;
  }

  dimension: review_update_delivery_c {
    type: string
    sql: ${TABLE}.review_update_delivery_c ;;
  }

  dimension: secondary_spoc_c {
    type: string
    sql: ${TABLE}.secondary_spoc_c ;;
  }

  dimension: send_forecast_reminder_number_c {
    type: number
    sql: ${TABLE}.send_forecast_reminder_number_c ;;
  }

  dimension: spoc_c {
    type: string
    sql: ${TABLE}.spoc_c ;;
  }

  dimension_group: start_date_c {
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
    sql: ${TABLE}.start_date_c ;;
  }

  dimension: status_c {
    type: string
    sql: ${TABLE}.status_c ;;
  }

  dimension: status_update_ba_owner_c {
    type: string
    sql: ${TABLE}.status_update_ba_owner_c ;;
  }

  dimension: subscription_c {
    type: string
    sql: ${TABLE}.subscription_c ;;
  }

  dimension: subscription_project_c {
    type: string
    sql: ${TABLE}.subscription_project_c ;;
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

  dimension: taas_billing_account_c {
    type: string
    sql: ${TABLE}.taas_billing_account_c ;;
  }

  dimension: taas_margin_c {
    type: string
    sql: ${TABLE}.taas_margin_c ;;
  }

  dimension: taas_with_new_approach_c {
    type: string
    sql: ${TABLE}.taas_with_new_approach_c ;;
  }

  dimension: tc_connect_project_id_c {
    type: string
    sql: ${TABLE}.tc_connect_project_id_c ;;
  }

  dimension: title_c {
    type: string
    sql: ${TABLE}.title_c ;;
  }

  dimension_group: today_c {
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
    sql: ${TABLE}.today_c ;;
  }

  dimension: top_coder_billing_account_id_c {
    type: string
    sql: ${TABLE}.top_coder_billing_account_id_c ;;
  }

  dimension: topcoder_client_id_formula_c {
    type: string
    sql: ${TABLE}.topcoder_client_id_formula_c ;;
  }

  dimension: topcoder_client_id_in_account_c {
    type: string
    sql: ${TABLE}.topcoder_client_id_in_account_c ;;
  }

  dimension: topcoder_client_id_old_c {
    type: string
    sql: ${TABLE}.topcoder_client_id_old_c ;;
  }

  dimension: topcoder_client_name_old_c {
    type: string
    sql: ${TABLE}.topcoder_client_name_old_c ;;
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

  dimension: workday_contract_number_c {
    type: string
    sql: ${TABLE}.workday_contract_number_c ;;
  }

  measure: count {
    type: count
    drill_fields: [topcoder_billing_account_id_formula_c, name]
  }
}
