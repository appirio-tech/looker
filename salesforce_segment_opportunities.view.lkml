view: salesforce_segment_opportunities {
  sql_table_name: segment_tc_salesforce.opportunities ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_address_c {
    type: string
    sql: ${TABLE}.account_address_c ;;
  }

  dimension: account_country_c {
    type: string
    sql: ${TABLE}.account_country_c ;;
  }

  dimension: account_executive_c {
    type: string
    sql: ${TABLE}.account_executive_c ;;
  }

  dimension: account_executive_name_c {
    type: string
    sql: ${TABLE}.account_executive_name_c ;;
  }

  dimension: account_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_industry_c {
    type: string
    sql: ${TABLE}.account_industry_c ;;
  }

  dimension: account_phone_c {
    type: string
    sql: ${TABLE}.account_phone_c ;;
  }

  dimension: account_region_c {
    type: string
    sql: ${TABLE}.account_region_c ;;
  }

  dimension: account_tenure_c {
    type: number
    sql: ${TABLE}.account_tenure_c ;;
  }

  dimension: accounts_payable_contact_c {
    type: string
    sql: ${TABLE}.accounts_payable_contact_c ;;
  }

  dimension: accounts_payable_email_c {
    type: string
    sql: ${TABLE}.accounts_payable_email_c ;;
  }

  dimension: accounts_payable_phone_c {
    type: string
    sql: ${TABLE}.accounts_payable_phone_c ;;
  }

  dimension: age_1_c {
    type: number
    sql: ${TABLE}.age_1_c ;;
  }

  dimension: age_c {
    type: number
    sql: ${TABLE}.age_c ;;
  }

  dimension: age_of_last_update_c {
    type: number
    sql: ${TABLE}.age_of_last_update_c ;;
  }

  dimension: amount {
    type: string
    sql: ${TABLE}.amount ;;
  }

  dimension: amount_days_c {
    type: number
    sql: ${TABLE}.amount_days_c ;;
  }

  dimension: amount_lost_usd_c {
    type: number
    sql: ${TABLE}.amount_lost_usd_c ;;
  }

  dimension: amount_usd_c {
    type: number
    sql: ${TABLE}.amount_usd_c ;;
  }

  dimension: amount_won_usd_c {
    type: number
    sql: ${TABLE}.amount_won_usd_c ;;
  }

  dimension: as_sold_margin_c {
    type: string
    sql: ${TABLE}.as_sold_margin_c ;;
  }

  dimension: as_sold_profit_c {
    type: string
    sql: ${TABLE}.as_sold_profit_c ;;
  }

  dimension: asm_billings_c {
    type: number
    sql: ${TABLE}.asm_billings_c ;;
  }

  dimension: asm_costs_c {
    type: number
    sql: ${TABLE}.asm_costs_c ;;
  }

  dimension: assigned_c {
    type: string
    sql: ${TABLE}.assigned_c ;;
  }

  dimension: auto_renewal_c {
    type: string
    sql: ${TABLE}.auto_renewal_c ;;
  }

  dimension: average_services_hourly_rate_c {
    type: string
    sql: ${TABLE}.average_services_hourly_rate_c ;;
  }

  dimension: avg_bill_rate_emea_c {
    type: number
    sql: ${TABLE}.avg_bill_rate_emea_c ;;
  }

  dimension: avg_bill_rate_jaipur_c {
    type: number
    sql: ${TABLE}.avg_bill_rate_jaipur_c ;;
  }

  dimension: avg_bill_rate_japan_c {
    type: number
    sql: ${TABLE}.avg_bill_rate_japan_c ;;
  }

  dimension: avg_bill_rate_u_s_c {
    type: number
    sql: ${TABLE}.avg_bill_rate_u_s_c ;;
  }

  dimension: avg_bill_rate_u_s_indianapolis_c {
    type: number
    sql: ${TABLE}.avg_bill_rate_u_s_indianapolis_c ;;
  }

  dimension: avg_bill_rate_u_s_strategy_c {
    type: number
    sql: ${TABLE}.avg_bill_rate_u_s_strategy_c ;;
  }

  dimension: avg_offshore_services_hourly_rate_c {
    type: string
    sql: ${TABLE}.avg_offshore_services_hourly_rate_c ;;
  }

  dimension: big_bet_c {
    type: string
    sql: ${TABLE}.big_bet_c ;;
  }

  dimension: big_deal_c {
    type: string
    sql: ${TABLE}.big_deal_c ;;
  }

  dimension: big_deal_spif_c {
    type: string
    sql: ${TABLE}.big_deal_spif_c ;;
  }

  dimension: billings_adjustment_c {
    type: number
    sql: ${TABLE}.billings_adjustment_c ;;
  }

  dimension: booking_goal_qtr_c {
    type: number
    sql: ${TABLE}.booking_goal_qtr_c ;;
  }

  dimension: booking_target_qtr_c {
    type: number
    sql: ${TABLE}.booking_target_qtr_c ;;
  }

  dimension: budget_confirmed_c {
    type: string
    sql: ${TABLE}.budget_confirmed_c ;;
  }

  dimension: business_unit_c {
    type: string
    sql: ${TABLE}.business_unit_c ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_type_c {
    type: string
    sql: ${TABLE}.campaign_type_c ;;
  }

  dimension: challenge_spend_and_product_fee_sum_c {
    type: string
    sql: ${TABLE}.challenge_spend_and_product_fee_sum_c ;;
  }

  dimension: challenge_spend_and_product_fee_sum_usd_c {
    type: number
    sql: ${TABLE}.challenge_spend_and_product_fee_sum_usd_c ;;
  }

  dimension: change_limit_exceed_c {
    type: string
    sql: ${TABLE}.change_limit_exceed_c ;;
  }

  dimension: change_limit_exceed_message_c {
    type: string
    sql: ${TABLE}.change_limit_exceed_message_c ;;
  }

  dimension: change_limit_exceed_month_c {
    type: number
    sql: ${TABLE}.change_limit_exceed_month_c ;;
  }

  dimension: change_limit_exceed_qtr_c {
    type: number
    sql: ${TABLE}.change_limit_exceed_qtr_c ;;
  }

  dimension: check_forecast_c {
    type: string
    sql: ${TABLE}.check_forecast_c ;;
  }

  dimension: check_owner_c {
    type: string
    sql: ${TABLE}.check_owner_c ;;
  }

  dimension: client_decision_maker_c {
    type: string
    sql: ${TABLE}.client_decision_maker_c ;;
  }

  dimension: client_goal_c {
    type: string
    sql: ${TABLE}.client_goal_c ;;
  }

  dimension: client_pains_c {
    type: string
    sql: ${TABLE}.client_pains_c ;;
  }

  dimension: client_wipro_owner_c {
    type: string
    sql: ${TABLE}.client_wipro_owner_c ;;
  }

  dimension_group: close {
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
    sql: ${TABLE}.close_date ;;
  }

  dimension: close_month_in_quarter_c {
    type: number
    sql: ${TABLE}.close_month_in_quarter_c ;;
  }

  dimension: close_quarter_c {
    type: string
    sql: ${TABLE}.close_quarter_c ;;
  }

  dimension: close_quarter_numeric_c {
    type: number
    sql: ${TABLE}.close_quarter_numeric_c ;;
  }

  dimension: close_week_c {
    type: number
    sql: ${TABLE}.close_week_c ;;
  }

  dimension: closed_in_quarter_created_c {
    type: string
    sql: ${TABLE}.closed_in_quarter_created_c ;;
  }

  dimension: cloud_spokes_billing_amount_c {
    type: number
    sql: ${TABLE}.cloud_spokes_billing_amount_c ;;
  }

  dimension: commit_to_count_against_c {
    type: string
    sql: ${TABLE}.commit_to_count_against_c ;;
  }

  dimension: con_ops_comment_c {
    type: string
    sql: ${TABLE}.con_ops_comment_c ;;
  }

  dimension: connect_project_link_c {
    type: string
    sql: ${TABLE}.connect_project_link_c ;;
  }

  dimension: contact_role_count_c {
    type: number
    sql: ${TABLE}.contact_role_count_c ;;
  }

  dimension_group: contract_end_date_c {
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
    sql: ${TABLE}.contract_end_date_c ;;
  }

  dimension_group: contract_start_date_c {
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
    sql: ${TABLE}.contract_start_date_c ;;
  }

  dimension: conversion_rate_c {
    type: number
    sql: ${TABLE}.conversion_rate_c ;;
  }

  dimension: converted_expected_revenue_c {
    type: number
    sql: ${TABLE}.converted_expected_revenue_c ;;
  }

  dimension: corporate_plan_credit_c {
    type: string
    sql: ${TABLE}.corporate_plan_credit_c ;;
  }

  dimension: cost_adjustment_c {
    type: number
    sql: ${TABLE}.cost_adjustment_c ;;
  }

  dimension: cost_center_c {
    type: string
    sql: ${TABLE}.cost_center_c ;;
  }

  dimension: cost_rate_emea_c {
    type: number
    sql: ${TABLE}.cost_rate_emea_c ;;
  }

  dimension: cost_rate_jaipur_c {
    type: number
    sql: ${TABLE}.cost_rate_jaipur_c ;;
  }

  dimension: cost_rate_japan_c {
    type: number
    sql: ${TABLE}.cost_rate_japan_c ;;
  }

  dimension: cost_rate_u_s_c {
    type: number
    sql: ${TABLE}.cost_rate_u_s_c ;;
  }

  dimension: cost_rate_u_s_indianapolis_c {
    type: number
    sql: ${TABLE}.cost_rate_u_s_indianapolis_c ;;
  }

  dimension: cost_rate_u_s_strategy_c {
    type: number
    sql: ${TABLE}.cost_rate_u_s_strategy_c ;;
  }

  dimension: counts_for_app_xpress_old_c {
    type: string
    sql: ${TABLE}.counts_for_app_xpress_old_c ;;
  }

  dimension: counts_for_self_service_c {
    type: string
    sql: ${TABLE}.counts_for_self_service_c ;;
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

  dimension: crowd_deal_type_c {
    type: string
    sql: ${TABLE}.crowd_deal_type_c ;;
  }

  dimension: currency_iso_code {
    type: string
    sql: ${TABLE}.currency_iso_code ;;
  }

  dimension: current_solution_c {
    type: string
    sql: ${TABLE}.current_solution_c ;;
  }

  dimension: custom_development_c {
    type: string
    sql: ${TABLE}.custom_development_c ;;
  }

  dimension: customer_pain_point_c {
    type: string
    sql: ${TABLE}.customer_pain_point_c ;;
  }

  dimension: customer_segment_at_close_c {
    type: string
    sql: ${TABLE}.customer_segment_at_close_c ;;
  }

  dimension: customer_segment_c {
    type: string
    sql: ${TABLE}.customer_segment_c ;;
  }

  dimension_group: date_of_last_completed_milestone_c {
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
    sql: ${TABLE}.date_of_last_completed_milestone_c ;;
  }

  dimension_group: date_of_last_stage_or_probability_change_c {
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
    sql: ${TABLE}.date_of_last_stage_or_probability_change_c ;;
  }

  dimension: days_past_close_c {
    type: number
    sql: ${TABLE}.days_past_close_c ;;
  }

  dimension: days_till_next_step_c {
    type: number
    sql: ${TABLE}.days_till_next_step_c ;;
  }

  dimension: days_until_close_c {
    type: number
    sql: ${TABLE}.days_until_close_c ;;
  }

  dimension: deal_next_steps_c {
    type: string
    sql: ${TABLE}.deal_next_steps_c ;;
  }

  dimension: deal_type_c {
    type: string
    sql: ${TABLE}.deal_type_c ;;
  }

  dimension: deal_type_old_c {
    type: string
    sql: ${TABLE}.deal_type_old_c ;;
  }

  dimension: delivery_partner_account_c {
    type: string
    sql: ${TABLE}.delivery_partner_account_c ;;
  }

  dimension: delivery_partner_c {
    type: string
    sql: ${TABLE}.delivery_partner_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discovery_completed_c {
    type: string
    sql: ${TABLE}.discovery_completed_c ;;
  }

  dimension: due_c {
    type: string
    sql: ${TABLE}.due_c ;;
  }

  dimension_group: due_date_c {
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
    sql: ${TABLE}.due_date_c ;;
  }

  dimension: effort_offshore_c {
    type: string
    sql: ${TABLE}.effort_offshore_c ;;
  }

  dimension: employees_c {
    type: number
    sql: ${TABLE}.employees_c ;;
  }

  dimension: engagement_activity_2_c {
    type: string
    sql: ${TABLE}.engagement_activity_2_c ;;
  }

  dimension: engagement_activity_c {
    type: string
    sql: ${TABLE}.engagement_activity_c ;;
  }

  dimension: engagement_manager_c {
    type: string
    sql: ${TABLE}.engagement_manager_c ;;
  }

  dimension_group: engagement_start_date_c {
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
    sql: ${TABLE}.engagement_start_date_c ;;
  }

  dimension: exclude_from_con_ops_radar_c {
    type: string
    sql: ${TABLE}.exclude_from_con_ops_radar_c ;;
  }

  dimension: executive_sponsor_c {
    type: string
    sql: ${TABLE}.executive_sponsor_c ;;
  }

  dimension: expected_revenue {
    type: string
    sql: ${TABLE}.expected_revenue ;;
  }

  dimension: expert_community_amount_c {
    type: number
    sql: ${TABLE}.expert_community_amount_c ;;
  }

  dimension: expert_community_amount_converted_c {
    type: number
    sql: ${TABLE}.expert_community_amount_converted_c ;;
  }

  dimension: expert_community_amount_original_c {
    type: string
    sql: ${TABLE}.expert_community_amount_original_c ;;
  }

  dimension: fc_challenge_spend_c {
    type: string
    sql: ${TABLE}.fc_challenge_spend_c ;;
  }

  dimension: fc_expert_services_c {
    type: string
    sql: ${TABLE}.fc_expert_services_c ;;
  }

  dimension: fc_license_fee_c {
    type: string
    sql: ${TABLE}.fc_license_fee_c ;;
  }

  dimension: fc_product_fee_c {
    type: string
    sql: ${TABLE}.fc_product_fee_c ;;
  }

  dimension_group: first_forecast_date_c {
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
    sql: ${TABLE}.first_forecast_date_c ;;
  }

  dimension: first_product_of_intereset_c {
    type: string
    sql: ${TABLE}.first_product_of_intereset_c ;;
  }

  dimension: fiscal {
    type: string
    sql: ${TABLE}.fiscal ;;
  }

  dimension: fiscal_quarter {
    type: number
    sql: ${TABLE}.fiscal_quarter ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}.fiscal_year ;;
  }

  dimension: fix_bid_project_link_c {
    type: string
    sql: ${TABLE}.fix_bid_project_link_c ;;
  }

  dimension: forecast_alert_c {
    type: string
    sql: ${TABLE}.forecast_alert_c ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}.forecast_category ;;
  }

  dimension: forecast_category_name {
    type: string
    sql: ${TABLE}.forecast_category_name ;;
  }

  dimension: forecast_status_image_c {
    type: string
    sql: ${TABLE}.forecast_status_image_c ;;
  }

  dimension: geo_c {
    type: string
    sql: ${TABLE}.geo_c ;;
  }

  dimension: google_analytics_click_id_c {
    type: string
    sql: ${TABLE}.google_analytics_click_id_c ;;
  }

  dimension: google_analytics_client_id_c {
    type: string
    sql: ${TABLE}.google_analytics_client_id_c ;;
  }

  dimension: has_open_activity {
    type: string
    sql: ${TABLE}.has_open_activity ;;
  }

  dimension: has_opportunity_line_item {
    type: string
    sql: ${TABLE}.has_opportunity_line_item ;;
  }

  dimension: has_overdue_task {
    type: string
    sql: ${TABLE}.has_overdue_task ;;
  }

  dimension: has_resource_request_dnu_c {
    type: string
    sql: ${TABLE}.has_resource_request_dnu_c ;;
  }

  dimension: has_resource_requests_c {
    type: string
    sql: ${TABLE}.has_resource_requests_c ;;
  }

  dimension: hours_emea_c {
    type: number
    sql: ${TABLE}.hours_emea_c ;;
  }

  dimension: hours_jaipur_c {
    type: number
    sql: ${TABLE}.hours_jaipur_c ;;
  }

  dimension: hours_japan_c {
    type: number
    sql: ${TABLE}.hours_japan_c ;;
  }

  dimension: hours_total_c {
    type: number
    sql: ${TABLE}.hours_total_c ;;
  }

  dimension: hours_u_s_c {
    type: number
    sql: ${TABLE}.hours_u_s_c ;;
  }

  dimension: hours_u_s_indianapolis_c {
    type: number
    sql: ${TABLE}.hours_u_s_indianapolis_c ;;
  }

  dimension: hours_u_s_strategy_c {
    type: number
    sql: ${TABLE}.hours_u_s_strategy_c ;;
  }

  dimension: indirect_account_name_c {
    type: string
    sql: ${TABLE}.indirect_account_name_c ;;
  }

  dimension: inside_sales_rep_c {
    type: string
    sql: ${TABLE}.inside_sales_rep_c ;;
  }

  dimension: inside_sales_rep_name_c {
    type: string
    sql: ${TABLE}.inside_sales_rep_name_c ;;
  }

  dimension: internal_notes_c {
    type: string
    sql: ${TABLE}.internal_notes_c ;;
  }

  dimension: invoice_contact_email_c {
    type: string
    sql: ${TABLE}.invoice_contact_email_c ;;
  }

  dimension: invoice_contact_name_c {
    type: string
    sql: ${TABLE}.invoice_contact_name_c ;;
  }

  dimension: invoice_ninja_client_id_c {
    type: number
    value_format_name: id
    sql: ${TABLE}.invoice_ninja_client_id_c ;;
  }

  dimension: is_closed {
    type: string
    sql: ${TABLE}.is_closed ;;
  }

  dimension: is_deleted {
    type: string
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_private {
    type: string
    sql: ${TABLE}.is_private ;;
  }

  dimension: is_smb_c {
    type: string
    sql: ${TABLE}.is_smb_c ;;
  }

  dimension: is_split {
    type: string
    sql: ${TABLE}.is_split ;;
  }

  dimension: is_won {
    type: string
    sql: ${TABLE}.is_won ;;
  }

  dimension_group: last_activity {
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
    sql: ${TABLE}.last_activity_date ;;
  }

  dimension: last_completed_item_c {
    type: string
    sql: ${TABLE}.last_completed_item_c ;;
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

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: legacy_id_c {
    type: string
    sql: ${TABLE}.legacy_id_c ;;
  }

  dimension: legacy_link_c {
    type: string
    sql: ${TABLE}.legacy_link_c ;;
  }

  dimension: legacy_system_c {
    type: string
    sql: ${TABLE}.legacy_system_c ;;
  }

  dimension: loss_description_c {
    type: string
    sql: ${TABLE}.loss_description_c ;;
  }

  dimension: loss_reason_c {
    type: string
    sql: ${TABLE}.loss_reason_c ;;
  }

  dimension: main_competitor_c {
    type: string
    sql: ${TABLE}.main_competitor_c ;;
  }

  dimension: marketing_influenced_c {
    type: string
    sql: ${TABLE}.marketing_influenced_c ;;
  }

  dimension: marketing_sourced_c {
    type: string
    sql: ${TABLE}.marketing_sourced_c ;;
  }

  dimension: master_opportunity_c {
    type: string
    sql: ${TABLE}.master_opportunity_c ;;
  }

  dimension: milestone_on_critical_path_c {
    type: string
    sql: ${TABLE}.milestone_on_critical_path_c ;;
  }

  dimension: multi_year_contract_c {
    type: string
    sql: ${TABLE}.multi_year_contract_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: name_geo_c {
    type: string
    sql: ${TABLE}.name_geo_c ;;
  }

  dimension: new_or_follow_on_c {
    type: string
    sql: ${TABLE}.new_or_follow_on_c ;;
  }

  dimension: next_pending_item_c {
    type: string
    sql: ${TABLE}.next_pending_item_c ;;
  }

  dimension: next_qtr_amount_weighted_c {
    type: string
    sql: ${TABLE}.next_qtr_amount_weighted_c ;;
  }

  dimension: next_quarter_unweighted_c {
    type: string
    sql: ${TABLE}.next_quarter_unweighted_c ;;
  }

  dimension: next_step {
    type: string
    sql: ${TABLE}.next_step ;;
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

  dimension: no_bill_project_link_c {
    type: string
    sql: ${TABLE}.no_bill_project_link_c ;;
  }

  dimension: no_of_resource_requests_c {
    type: number
    sql: ${TABLE}.no_of_resource_requests_c ;;
  }

  dimension: no_ppw_required_c {
    type: string
    sql: ${TABLE}.no_ppw_required_c ;;
  }

  dimension: num_line_items_consulting_services_c {
    type: number
    sql: ${TABLE}.num_line_items_consulting_services_c ;;
  }

  dimension: number_of_seats_c {
    type: number
    sql: ${TABLE}.number_of_seats_c ;;
  }

  dimension: onsite_requirements_c {
    type: string
    sql: ${TABLE}.onsite_requirements_c ;;
  }

  dimension: open_items_c {
    type: string
    sql: ${TABLE}.open_items_c ;;
  }

  dimension: opportunity_count_100_200_this_qtr_c {
    type: number
    sql: ${TABLE}.opportunity_count_100_200_this_qtr_c ;;
  }

  dimension: opportunity_count_100_k_less_this_qtr_c {
    type: number
    sql: ${TABLE}.opportunity_count_100_k_less_this_qtr_c ;;
  }

  dimension: opportunity_count_250_k_this_qtr_c {
    type: number
    sql: ${TABLE}.opportunity_count_250_k_this_qtr_c ;;
  }

  dimension: opportunity_owner_active_c {
    type: string
    sql: ${TABLE}.opportunity_owner_active_c ;;
  }

  dimension: opportunity_owner_s_role_in_hierarchy_c {
    type: string
    sql: ${TABLE}.opportunity_owner_s_role_in_hierarchy_c ;;
  }

  dimension_group: opportunity_stage_min_change_date_c {
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
    sql: ${TABLE}.opportunity_stage_min_change_date_c ;;
  }

  dimension: order_number_c {
    type: string
    sql: ${TABLE}.order_number_c ;;
  }

  dimension: our_value_to_partner_c {
    type: string
    sql: ${TABLE}.our_value_to_partner_c ;;
  }

  dimension: out_come_amount_original_c {
    type: string
    sql: ${TABLE}.out_come_amount_original_c ;;
  }

  dimension: outcome_amount_c {
    type: number
    sql: ${TABLE}.outcome_amount_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: owner_name_c {
    type: string
    sql: ${TABLE}.owner_name_c ;;
  }

  dimension: owner_s_manager_at_time_of_deal_c {
    type: string
    sql: ${TABLE}.owner_s_manager_at_time_of_deal_c ;;
  }

  dimension: parent_project_c {
    type: string
    sql: ${TABLE}.parent_project_c ;;
  }

  dimension: parent_project_link_c {
    type: string
    sql: ${TABLE}.parent_project_link_c ;;
  }

  dimension: partner_credit_type_c {
    type: string
    sql: ${TABLE}.partner_credit_type_c ;;
  }

  dimension: partner_driven_c {
    type: string
    sql: ${TABLE}.partner_driven_c ;;
  }

  dimension: partner_opportunity_amount_c {
    type: number
    sql: ${TABLE}.partner_opportunity_amount_c ;;
  }

  dimension: percent_hours_jaipur_c {
    type: string
    sql: ${TABLE}.percent_hours_jaipur_c ;;
  }

  dimension: percentage_covered_by_resource_requests_c {
    type: string
    sql: ${TABLE}.percentage_covered_by_resource_requests_c ;;
  }

  dimension: potential_sale_value_c {
    type: string
    sql: ${TABLE}.potential_sale_value_c ;;
  }

  dimension: pre_pay_c {
    type: string
    sql: ${TABLE}.pre_pay_c ;;
  }

  dimension: previous_quarter_closed_c {
    type: string
    sql: ${TABLE}.previous_quarter_closed_c ;;
  }

  dimension: pricebook_2_id {
    type: string
    sql: ${TABLE}.pricebook_2_id ;;
  }

  dimension: pricing_method_c {
    type: string
    sql: ${TABLE}.pricing_method_c ;;
  }

  dimension: probability {
    type: string
    sql: ${TABLE}.probability ;;
  }

  dimension: product_driven_c {
    type: string
    sql: ${TABLE}.product_driven_c ;;
  }

  dimension: product_list_c {
    type: string
    sql: ${TABLE}.product_list_c ;;
  }

  dimension: product_list_ids_c {
    type: string
    sql: ${TABLE}.product_list_ids_c ;;
  }

  dimension: product_list_names_c {
    type: string
    sql: ${TABLE}.product_list_names_c ;;
  }

  dimension: project_1_c {
    type: string
    sql: ${TABLE}.project_1_c ;;
  }

  dimension: project_2_c {
    type: string
    sql: ${TABLE}.project_2_c ;;
  }

  dimension: project_3_c {
    type: string
    sql: ${TABLE}.project_3_c ;;
  }

  dimension: project_exists_c {
    type: string
    sql: ${TABLE}.project_exists_c ;;
  }

  dimension: purchas_c {
    type: string
    sql: ${TABLE}.purchas_c ;;
  }

  dimension: purchase_contact_email_c {
    type: string
    sql: ${TABLE}.purchase_contact_email_c ;;
  }

  dimension: purchase_order_c {
    type: string
    sql: ${TABLE}.purchase_order_c ;;
  }

  dimension: purchase_order_required_c {
    type: string
    sql: ${TABLE}.purchase_order_required_c ;;
  }

  dimension: purchasing_contact_c {
    type: string
    sql: ${TABLE}.purchasing_contact_c ;;
  }

  dimension: quarter_booked_q1_q2_q3_q4_c {
    type: string
    sql: ${TABLE}.quarter_booked_q1_q2_q3_q4_c ;;
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

  dimension: reporting_industry_c {
    type: string
    sql: ${TABLE}.reporting_industry_c ;;
  }

  dimension: reporting_sbu_c {
    type: string
    sql: ${TABLE}.reporting_sbu_c ;;
  }

  dimension: reviewed_by_finance_ops_c {
    type: string
    sql: ${TABLE}.reviewed_by_finance_ops_c ;;
  }

  dimension: reviewed_by_rev_rec_team_c {
    type: string
    sql: ${TABLE}.reviewed_by_rev_rec_team_c ;;
  }

  dimension: roi_analysis_completed_c {
    type: string
    sql: ${TABLE}.roi_analysis_completed_c ;;
  }

  dimension: sales_geography_c {
    type: string
    sql: ${TABLE}.sales_geography_c ;;
  }

  dimension: sales_partner_account_c {
    type: string
    sql: ${TABLE}.sales_partner_account_c ;;
  }

  dimension: sales_partner_c {
    type: string
    sql: ${TABLE}.sales_partner_c ;;
  }

  dimension: seat_description_c {
    type: string
    sql: ${TABLE}.seat_description_c ;;
  }

  dimension: second_product_of_interest_c {
    type: string
    sql: ${TABLE}.second_product_of_interest_c ;;
  }

  dimension: self_service_amount_converted_c {
    type: number
    sql: ${TABLE}.self_service_amount_converted_c ;;
  }

  dimension: special_terms_conditions_c {
    type: string
    sql: ${TABLE}.special_terms_conditions_c ;;
  }

  dimension: staffing_lead_time_c {
    type: number
    sql: ${TABLE}.staffing_lead_time_c ;;
  }

  dimension: staffing_requirements_c {
    type: string
    sql: ${TABLE}.staffing_requirements_c ;;
  }

  dimension: stage_before_loss_c {
    type: string
    sql: ${TABLE}.stage_before_loss_c ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stage_name ;;
  }

  dimension: sub_opportunity_c {
    type: string
    sql: ${TABLE}.sub_opportunity_c ;;
  }

  dimension: subcontracting_end_customer_c {
    type: string
    sql: ${TABLE}.subcontracting_end_customer_c ;;
  }

  dimension: subcontracting_end_customer_industry_c {
    type: string
    sql: ${TABLE}.subcontracting_end_customer_industry_c ;;
  }

  dimension: subcontracting_end_customer_type_c {
    type: string
    sql: ${TABLE}.subcontracting_end_customer_type_c ;;
  }

  dimension: subcontracting_end_customer_vertical_c {
    type: string
    sql: ${TABLE}.subcontracting_end_customer_vertical_c ;;
  }

  dimension: subcontracting_end_customr_topcoder_prtnr_c {
    type: string
    sql: ${TABLE}.subcontracting_end_customr_topcoder_prtnr_c ;;
  }

  dimension: subcontracting_sbu_c {
    type: string
    sql: ${TABLE}.subcontracting_sbu_c ;;
  }

  dimension: subcontracting_tier_c {
    type: string
    sql: ${TABLE}.subcontracting_tier_c ;;
  }

  dimension: subscription_amount_c {
    type: number
    sql: ${TABLE}.subscription_amount_c ;;
  }

  dimension: subscription_c {
    type: string
    sql: ${TABLE}.subscription_c ;;
  }

  dimension: subscription_level_c {
    type: string
    sql: ${TABLE}.subscription_level_c ;;
  }

  dimension: survey_status_nps_c {
    type: string
    sql: ${TABLE}.survey_status_nps_c ;;
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

  dimension: t_m_project_link_c {
    type: string
    sql: ${TABLE}.t_m_project_link_c ;;
  }

  dimension_group: target_ppw_date_c {
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
    sql: ${TABLE}.target_ppw_date_c ;;
  }

  dimension: tc_connect_description_c {
    type: string
    sql: ${TABLE}.tc_connect_description_c ;;
  }

  dimension: tc_connect_direct_project_id_c {
    type: string
    sql: ${TABLE}.tc_connect_direct_project_id_c ;;
  }

  dimension: tc_connect_project_id_c {
    type: string
    sql: ${TABLE}.tc_connect_project_id_c ;;
  }

  dimension: tc_connect_project_id_formula_c {
    type: string
    sql: ${TABLE}.tc_connect_project_id_formula_c ;;
  }

  dimension: thank_yous_c {
    type: string
    sql: ${TABLE}.thank_yous_c ;;
  }

  dimension: third_product_of_interest_c {
    type: string
    sql: ${TABLE}.third_product_of_interest_c ;;
  }

  dimension: this_quarter_unweighted_c {
    type: string
    sql: ${TABLE}.this_quarter_unweighted_c ;;
  }

  dimension: this_quarter_weighted_pipeline_c {
    type: string
    sql: ${TABLE}.this_quarter_weighted_pipeline_c ;;
  }

  dimension: total_community_challenge_fees_c {
    type: string
    sql: ${TABLE}.total_community_challenge_fees_c ;;
  }

  dimension: total_community_challenge_member_payments_c {
    type: string
    sql: ${TABLE}.total_community_challenge_member_payments_c ;;
  }

  dimension: total_community_expert_services_c {
    type: string
    sql: ${TABLE}.total_community_expert_services_c ;;
  }

  dimension: total_community_license_c {
    type: string
    sql: ${TABLE}.total_community_license_c ;;
  }

  dimension: total_expenses_c {
    type: string
    sql: ${TABLE}.total_expenses_c ;;
  }

  dimension: total_hours_from_resource_requests_c {
    type: number
    sql: ${TABLE}.total_hours_from_resource_requests_c ;;
  }

  dimension: total_num_of_line_items_c {
    type: number
    sql: ${TABLE}.total_num_of_line_items_c ;;
  }

  dimension: total_potential_user_c {
    type: string
    sql: ${TABLE}.total_potential_user_c ;;
  }

  dimension: touch_c {
    type: string
    sql: ${TABLE}.touch_c ;;
  }

  dimension: trace_opportunity_number_c {
    type: string
    sql: ${TABLE}.trace_opportunity_number_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: unbooked_capacity_c {
    type: string
    sql: ${TABLE}.unbooked_capacity_c ;;
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

  dimension: wbs_code_c {
    type: string
    sql: ${TABLE}.wbs_code_c ;;
  }

  dimension: which_stage_c {
    type: string
    sql: ${TABLE}.which_stage_c ;;
  }

  dimension: won_lost_open_c {
    type: string
    sql: ${TABLE}.won_lost_open_c ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      stage_name,
      forecast_category_name,
      name,
      accounts.name,
      accounts.id
    ]
  }
}
