view: sfdc_opportunity {
  sql_table_name: tcs_dw.sfdc_opportunity ;;

  dimension: sfdc_opportunity_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: X_15_digit_id {
    type: string
    description: "SFDC has 15 Digit ID in the URL which is case sensitive"
    case_sensitive: yes
    sql: LEFT(${TABLE}.id,15) ;;
  }

  dimension: connect_project_id  {
    type: number
    description: "Connect Project Id associated with the Opportunity"
    sql: ${TABLE}.tc_connect_project_id__c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: owner {
    description: "Opportunity Owner Name"
    hidden: yes
    sql: ${TABLE}.owner_name__c;;
  }

  dimension: account_id {
  type: string
  sql: ${TABLE}.accountid ;;
  }

  measure: amount {
    type: sum_distinct
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.amount ;;
  }

  dimension: executive_sponsor {
    type: string
    sql: ${TABLE}.executive_sponsor__c ;;
  }

  dimension: pricingmethod {
    type: string
    sql: ${TABLE}.pricingmethod__c ;;
  }

  dimension: deal_type {
    type: string
    sql: ${TABLE}.deal_type__c ;;
  }

  dimension: subscription {
    type: string
    sql: ${TABLE}.subscription__c ;;
  }

  dimension: reporting_sbu {
    type: string
    sql: ${TABLE}.reporting_sbu__c ;;
  }


  dimension: reporting_industry {
    type: string
    sql: ${TABLE}.reporting_industry__c ;;
  }

  measure: total_expenses {
    type: sum
    sql: ${TABLE}.total_expenses__c ;;
  }

  dimension_group: close {
    type: time
    description: "Date when opportunity marked closed in SFDC"
    timeframes: [
      raw,
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
    sql: ${TABLE}.closedate ;;
  }

  dimension_group: created {
    type: time
    description: "When the Opportunity was created by the user in SFDC"
    timeframes: [
      raw,
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
    sql: ${TABLE}.createddate ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stagename ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}.forecastcategory ;;
  }

  dimension: probability {
    type:  number
    sql: ${TABLE}.probability ;;
  }

  measure: expected_revenue {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.expectedrevenue ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}.geo__c ;;
  }

  dimension: account_address {
    type: string
    sql: ${TABLE}.account_address__c ;;
  }

  dimension: account_country {
    type: string
    sql: ${TABLE}.account_country__c ;;
  }

  dimension: account_executive {
    type: string
    sql: ${TABLE}.account_executive__c ;;
  }

  dimension: account_executive_name {
    type: string
    sql: ${TABLE}.account_executive_name__c ;;
  }

  dimension: account_industry {
    type: string
    sql: ${TABLE}.account_industry__c ;;
  }

  dimension: account_phone {
    type: string
    sql: ${TABLE}.account_phone__c ;;
  }

  dimension: account_region {
    type: string
    sql: ${TABLE}.account_region__c ;;
  }

  dimension: account_tenure {
    type: number
    sql: ${TABLE}.account_tenure__c ;;
  }

  dimension: accounts_payable_contact {
    type: string
    sql: ${TABLE}.accounts_payable_contact__c ;;
  }

  dimension: accounts_payable_email {
    type: string
    sql: ${TABLE}.accounts_payable_email__c ;;
  }

  dimension: accounts_payable_phone {
    type: string
    sql: ${TABLE}.accounts_payable_phone__c ;;
  }

  dimension: age_1 {
    type: number
    sql: ${TABLE}.age_1__c ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age__c ;;
  }

  dimension: age_of_last_update {
    type: number
    sql: ${TABLE}.age_of_last_update__c ;;
  }

  dimension: amount_days {
    type: number
    sql: ${TABLE}.amount_days__c ;;
  }

  dimension: amount_lost {
    type: number
    sql: ${TABLE}.amount_lost_usd__c ;;
  }

  measure: amount_usd {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.amount_usd__c ;;
  }

  measure: amount_won {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.amount_won_usd__c ;;
  }

  dimension: as_sold_margin {
    type: string
    sql: ${TABLE}.as_sold_margin__c ;;
  }

  dimension: as_sold_profit {
    type: number
    sql: ${TABLE}.as_sold_profit__c ;;
  }

  dimension: asm_billings {
    type: number
    sql: ${TABLE}.asm_billings__c ;;
  }

  dimension: asm_costs {
    type: number
    sql: ${TABLE}.asm_costs__c ;;
  }

  dimension: assigned {
    type: string
    sql: ${TABLE}.assigned__c ;;
  }

  dimension: auto_renewal {
    type: yesno
    sql: ${TABLE}.auto_renewal__c ;;
  }

  dimension: average_services_hourly_rate {
    type: number
    sql: ${TABLE}.average_services_hourly_rate__c ;;
  }

  dimension: avg_bill_rate_emea {
    type: number
    sql: ${TABLE}.avg_bill_rate_emea__c ;;
  }

  dimension: avg_bill_rate_jaipur {
    type: number
    sql: ${TABLE}.avg_bill_rate_jaipur__c ;;
  }

  dimension: avg_bill_rate_japan {
    type: number
    sql: ${TABLE}.avg_bill_rate_japan__c ;;
  }

  dimension: avg_bill_rate_u_s {
    type: number
    sql: ${TABLE}.avg_bill_rate_u_s__c ;;
  }

  dimension: avg_bill_rate_u_s_indianapolis {
    type: number
    sql: ${TABLE}.avg_bill_rate_u_s_indianapolis__c ;;
  }

  dimension: avg_bill_rate_u_s_strategy {
    type: number
    sql: ${TABLE}.avg_bill_rate_u_s_strategy__c ;;
  }

  dimension: avg_offshore_services_hourly_rate {
    type: number
    sql: ${TABLE}.avg_offshore_services_hourly_rate__c ;;
  }

  dimension: big_bet {
    type: string
    sql: ${TABLE}.big_bet__c ;;
  }

  dimension: big_deal {
    type: string
    sql: ${TABLE}.big_deal__c ;;
  }

  dimension: big_deal_spif {
    type: yesno
    sql: ${TABLE}.big_deal_spif__c ;;
  }

  dimension: billings_adjustment {
    type: number
    sql: ${TABLE}.billings_adjustment__c ;;
  }

  dimension: booking_goal_qtr {
    type: number
    sql: ${TABLE}.booking_goal_qtr__c ;;
  }

  dimension: booking_target_qtr {
    type: number
    sql: ${TABLE}.booking_target_qtr__c ;;
  }

  dimension: budget_confirmed {
    type: yesno
    sql: ${TABLE}.budget_confirmed__c ;;
  }

  dimension: business_unit {
    type: string
    sql: ${TABLE}.business_unit__c ;;
  }

  dimension: campaign_type {
    type: string
    sql: ${TABLE}.campaign_type__c ;;
  }

  dimension: campaignid {
    type: string
    sql: ${TABLE}.campaignid ;;
  }

  dimension: challenge_spend_and_product_fee_sum {
    type: number
    sql: ${TABLE}.challenge_spend_and_product_fee_sum__c ;;
  }

  dimension: challenge_spend_and_product_fee_sum_usd {
    type: number
    sql: ${TABLE}.challenge_spend_and_product_fee_sum_usd__c ;;
  }

  dimension: change_limit_exceed {
    type: yesno
    sql: ${TABLE}.change_limit_exceed__c ;;
  }

  dimension: change_limit_exceed_message {
    type: string
    sql: ${TABLE}.change_limit_exceed_message__c ;;
  }

  dimension: change_limit_exceed_month {
    type: number
    sql: ${TABLE}.change_limit_exceed_month__c ;;
  }

  dimension: change_limit_exceed_qtr {
    type: number
    sql: ${TABLE}.change_limit_exceed_qtr__c ;;
  }

  dimension: check_forecast {
    type: yesno
    sql: ${TABLE}.check_forecast__c ;;
  }

  dimension: check_owner {
    type: yesno
    sql: ${TABLE}.check_owner__c ;;
  }

  dimension: client_decision_maker {
    type: string
    sql: ${TABLE}.client_decision_maker__c ;;
  }

  dimension: client_goal {
    type: string
    sql: ${TABLE}.client_goal__c ;;
  }

  dimension: client_pains {
    type: string
    sql: ${TABLE}.client_pains__c ;;
  }

  dimension: client_wipro_owner {
    type: string
    sql: ${TABLE}.client_wipro_owner__c ;;
  }

  dimension: close_month_in_quarter {
    type: number
    sql: ${TABLE}.close_month_in_quarter__c ;;
  }

  dimension: close_qtr {
    type: string
    sql: ${TABLE}.close_quarter__c ;;
  }

  dimension: close_quarter_numeric {
    type: number
    sql: ${TABLE}.close_quarter_numeric__c ;;
  }

  dimension: closeweek {
    type: number
    sql: ${TABLE}.close_week__c ;;
  }

  dimension: closed_in_quarter_created {
    type: yesno
    sql: ${TABLE}.closed_in_quarter_created__c ;;
  }

  measure: cloudspokes_billing_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.cloudspokes_billing_amount__c ;;
  }

  dimension: commit_to_count_against {
    type: string
    sql: ${TABLE}.commit_to_count_against__c ;;
  }

  dimension: con_ops_comment {
    type: string
    sql: ${TABLE}.con_ops_comment__c ;;
  }

  dimension: connect_project_link {
    type: string
    sql: ${TABLE}.connect_project_link__c ;;
  }

  dimension: contact_role_count {
    type: number
    sql: ${TABLE}.contact_role_count__c ;;
  }

  dimension_group: contract_end {
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
    sql: ${TABLE}.contract_end_date__c ;;
  }

  dimension: contract_length {
    type: string
    sql: ${TABLE}.contract_length__c ;;
  }

  dimension_group: contract_start {
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
    sql: ${TABLE}.contract_start_date__c ;;
  }

  dimension: conversion_rate {
    type: number
    sql: ${TABLE}.conversion_rate__c ;;
  }

  dimension: converted_expected_revenue {
    type: number
    sql: ${TABLE}.converted_expected_revenue__c ;;
  }

  dimension: corporate_plan_credit {
    type: number
    sql: ${TABLE}.corporate_plan_credit__c ;;
  }

  dimension: cost_adjustment {
    type: number
    sql: ${TABLE}.cost_adjustment__c ;;
  }

  dimension: cost_center {
    type: string
    sql: ${TABLE}.cost_center__c ;;
  }

  dimension: cost_rate_emea {
    type: number
    sql: ${TABLE}.cost_rate_emea__c ;;
  }

  dimension: cost_rate_jaipur {
    type: number
    sql: ${TABLE}.cost_rate_jaipur__c ;;
  }

  dimension: cost_rate_japan {
    type: number
    sql: ${TABLE}.cost_rate_japan__c ;;
  }

  dimension: cost_rate_u_s {
    type: number
    sql: ${TABLE}.cost_rate_u_s__c ;;
  }

  dimension: cost_rate_u_s_indianapolis {
    type: number
    sql: ${TABLE}.cost_rate_u_s_indianapolis__c ;;
  }

  dimension: cost_rate_u_s_strategy {
    type: number
    sql: ${TABLE}.cost_rate_u_s_strategy__c ;;
  }

  dimension: counts_for_appxpress_old {
    type: yesno
    sql: ${TABLE}.counts_for_appxpress_old__c ;;
  }

  dimension: counts_for_self_service {
    type: yesno
    sql: ${TABLE}.counts_for_self_service__c ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}.createdbyid ;;
  }

  dimension: crowd_deal_type {
    type: string
    sql: ${TABLE}.crowd_deal_type__c ;;
  }

  dimension: currency_iso_code {
    type: string
    sql: ${TABLE}.currencyisocode ;;
  }

  dimension: current_solution {
    type: string
    sql: ${TABLE}.current_solution__c ;;
  }

  dimension: custom_development {
    type: yesno
    sql: ${TABLE}.custom_development__c ;;
  }

  dimension: customer_pain_point {
    type: string
    sql: ${TABLE}.customer_pain_point__c ;;
  }

  dimension: customer_segment {
    type: string
    sql: ${TABLE}.customer_segment__c ;;
  }

  dimension: customer_segment_at_close {
    type: string
    sql: ${TABLE}.customer_segment_at_close__c ;;
  }

  dimension_group: date_of_last_completed_milestone {
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
    sql: ${TABLE}.date_of_last_completed_milestone__c ;;
  }

  dimension_group: date_of_last_stage_or_probability_change {
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
    sql: ${TABLE}.date_of_last_stage_or_probability_change__c ;;
  }

  dimension: days_past_close {
    type: number
    sql: ${TABLE}.days_past_close__c ;;
  }

  dimension: days_till_next_step {
    type: number
    sql: ${TABLE}.days_till_next_step__c ;;
  }

  dimension: days_until_close {
    type: number
    sql: ${TABLE}.days_until_close__c ;;
  }

  dimension: deal_next_steps {
    type: string
    sql: ${TABLE}.deal_next_steps__c ;;
  }

  dimension: deal_type_old {
    type: string
    sql: ${TABLE}.deal_type_old__c ;;
  }

  dimension: delivery_partner {
    type: string
    sql: ${TABLE}.delivery_partner__c ;;
  }

  dimension: delivery_partner_account {
    type: string
    sql: ${TABLE}.delivery_partner_account__c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discovery_completed {
    type: yesno
    sql: ${TABLE}.discovery_completed__c ;;
  }

  dimension: due {
    type: string
    sql: ${TABLE}.due__c ;;
  }

  dimension_group: due_date {
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
    sql: ${TABLE}.due_date__c ;;
  }

  dimension: effort_offshore {
    type: string
    sql: ${TABLE}.effort_offshore__c ;;
  }

  dimension: employees {
    type: number
    sql: ${TABLE}.employees__c ;;
  }

  dimension: engagement_activity_2 {
    type: string
    sql: ${TABLE}.engagement_activity_2__c ;;
  }

  dimension: engagement_activity {
    type: string
    sql: ${TABLE}.engagement_activity__c ;;
  }

  dimension: engagement_manager {
    type: string
    sql: ${TABLE}.engagement_manager__c ;;
  }

  dimension: engagement_offering_type {
    type: string
    sql: ${TABLE}.engagement_offering_type__c ;;
  }

  dimension_group: engagement_start {
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
    sql: ${TABLE}.engagementstartdate__c ;;
  }

  dimension: estimated_weeks {
    type: number
    sql: ${TABLE}.estimatedweeks__c ;;
  }

  dimension: exclude_from_con_ops_radar {
    type: yesno
    sql: ${TABLE}.exclude_from_con_ops_radar__c ;;
  }

  measure: expert_community_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.expert_community_amount__c ;;
  }

  measure: expert_community_amount_converted {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.expert_community_amount_converted__c ;;
  }

  measure: expert_community_amount_original {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.expert_community_amount_original__c ;;
  }

  dimension: fc_challenge_spend {
    type: number
    sql: ${TABLE}.fc_challenge_spend__c ;;
  }

  dimension: fc_expert_services {
    type: number
    sql: ${TABLE}.fc_expert_services__c ;;
  }

  dimension: fc_license_fee {
    type: number
    sql: ${TABLE}.fc_license_fee__c ;;
  }

  dimension: fc_product_fee {
    type: number
    sql: ${TABLE}.fc_product_fee__c ;;
  }

  dimension_group: first_forecast {
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
    sql: ${TABLE}.first_forecast_date__c ;;
  }

  dimension: first_product_of_intereset {
    type: string
    sql: ${TABLE}.first_product_of_intereset__c ;;
  }

  dimension: fiscal {
    type: string
    sql: ${TABLE}.fiscal ;;
  }

  dimension: fiscalquarter {
    type: number
    sql: ${TABLE}.fiscalquarter ;;
  }

  dimension: fiscalyear {
    type: number
    sql: ${TABLE}.fiscalyear ;;
  }

  dimension: fix_bid_project_link {
    type: string
    sql: ${TABLE}.fix_bid_project_link__c ;;
  }

  dimension: forecast_alert {
    type: string
    sql: ${TABLE}.forecast_alert__c ;;
  }

  dimension: forecast_status_image {
    type: string
    sql: ${TABLE}.forecast_status_image__c ;;
  }

  dimension: forecast_category_name {
    type: string
    sql: ${TABLE}.forecastcategoryname ;;
  }

  dimension: has_resource_request_dnu {
    type: yesno
    sql: ${TABLE}.has_resource_request_dnu__c ;;
  }

  dimension: has_resource_requests {
    type: yesno
    sql: ${TABLE}.has_resource_requests__c ;;
  }

  dimension: has_open_activity {
    type: yesno
    sql: ${TABLE}.hasopenactivity ;;
  }

  dimension: has_opportunity_line_item {
    type: yesno
    sql: ${TABLE}.hasopportunitylineitem ;;
  }

  dimension: has_over_due_task {
    type: yesno
    sql: ${TABLE}.hasoverduetask ;;
  }

  dimension: hours_emea {
    type: number
    sql: ${TABLE}.hours_emea__c ;;
  }

  dimension: hours_jaipur {
    type: number
    sql: ${TABLE}.hours_jaipur__c ;;
  }

  dimension: hours_japan {
    type: number
    sql: ${TABLE}.hours_japan__c ;;
  }

  dimension: hours_total {
    type: number
    sql: ${TABLE}.hours_total__c ;;
  }

  dimension: hours_u_s {
    type: number
    sql: ${TABLE}.hours_u_s__c ;;
  }

  dimension: hours_u_s_indianapolis {
    type: number
    sql: ${TABLE}.hours_u_s_indianapolis__c ;;
  }

  dimension: hours_u_s_strategy {
    type: number
    sql: ${TABLE}.hours_u_s_strategy__c ;;
  }

  dimension: indirect_account_name {
    type: string
    sql: ${TABLE}.indirect_account_name__c ;;
  }

  dimension: inside_sales_rep {
    type: string
    sql: ${TABLE}.inside_sales_rep__c ;;
  }

  dimension: inside_sales_rep_name {
    type: string
    sql: ${TABLE}.inside_sales_rep_name__c ;;
  }

  dimension: internal_notes {
    type: string
    sql: ${TABLE}.internal_notes__c ;;
  }

  dimension: invoice_contact_email {
    type: string
    sql: ${TABLE}.invoice_contact_email__c ;;
  }

  dimension: invoice_contact_name {
    type: string
    sql: ${TABLE}.invoice_contact_name__c ;;
  }

  dimension: invoice_ninja_client_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.invoice_ninja_client_id__c ;;
  }

  dimension: is_smb {
    type: yesno
    sql: ${TABLE}.is_smb__c ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}.isclosed ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: is_private {
    type: yesno
    sql: ${TABLE}.isprivate ;;
  }

  dimension: is_split {
    type: yesno
    sql: ${TABLE}.issplit ;;
  }

  dimension: is_won {
    type: yesno
    sql: ${TABLE}.iswon ;;
  }

  dimension: last_completed_item {
    type: string
    sql: ${TABLE}.last_completed_item__c ;;
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
    sql: ${TABLE}.lastactivitydate ;;
  }

  dimension: last_modifiedby_id {
    type: string
    sql: ${TABLE}.lastmodifiedbyid ;;
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
    sql: ${TABLE}.lastmodifieddate ;;
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
    sql: ${TABLE}.lastreferenceddate ;;
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
    sql: ${TABLE}.lastvieweddate ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.leadsource ;;
  }

  dimension: legacy_id {
    type: string
    sql: ${TABLE}.legacy_id__c ;;
  }

  dimension: legacy_link {
    type: string
    sql: ${TABLE}.legacy_link__c ;;
  }

  dimension: legacy_system {
    type: string
    sql: ${TABLE}.legacy_system__c ;;
  }

  dimension: loss_description {
    type: string
    sql: ${TABLE}.loss_description__c ;;
  }

  dimension: loss_reason {
    type: string
    sql: ${TABLE}.loss_reason__c ;;
  }

  dimension: maincompetitor {
    type: string
    sql: ${TABLE}.maincompetitor__c ;;
  }

  dimension: marketing_influenced {
    type: yesno
    sql: ${TABLE}.marketing_influenced__c ;;
  }

  dimension: marketing_sourced {
    type: yesno
    sql: ${TABLE}.marketing_sourced__c ;;
  }

  dimension: master_opportunity {
    type: string
    sql: ${TABLE}.master_opportunity__c ;;
  }

  dimension: milestone_on_critical_path {
    type: string
    sql: ${TABLE}.milestone_on_critical_path__c ;;
  }

  dimension: multi_year_contract {
    type: yesno
    sql: ${TABLE}.multi_year_contract__c ;;
  }


  dimension: name_geo {
    type: string
    sql: ${TABLE}.name_geo__c ;;
  }

  dimension: new_or_follow_on {
    type: string
    sql: ${TABLE}.new_or_follow_on__c ;;
  }

  dimension: next_pending_item {
    type: string
    sql: ${TABLE}.next_pending_item__c ;;
  }

  measure: next_qtr_amount_weighted {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.next_qtr_amount_weighted__c ;;
  }

  dimension: next_quarter_unweighted {
    type: number
    sql: ${TABLE}.next_quarter_unweighted__c ;;
  }

  dimension_group: next_step {
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
    sql: ${TABLE}.next_step_date__c ;;
  }

  dimension: next_step {
    type: string
    sql: ${TABLE}.nextstep ;;
  }

  dimension: no_bill_project_link {
    type: string
    sql: ${TABLE}.no_bill_project_link__c ;;
  }

  dimension: no_of_resource_requests {
    type: number
    sql: ${TABLE}.no_of_resource_requests__c ;;
  }

  dimension: no_ppw_required {
    type: yesno
    sql: ${TABLE}.no_ppw_required__c ;;
  }

  dimension: num_line_items_consulting_services {
    type: number
    sql: ${TABLE}.num_line_items_consulting_services__c ;;
  }

  dimension: number_of_seats {
    type: number
    sql: ${TABLE}.number_of_seats__c ;;
  }

  dimension: onsite_requirements {
    type: string
    sql: ${TABLE}.onsite_requirements__c ;;
  }

  dimension: open_items {
    type: string
    sql: ${TABLE}.open_items__c ;;
  }

  dimension: opportunity_count_100_200_this_qtr {
    type: number
    sql: ${TABLE}.opportunity_count_100_200_this_qtr__c ;;
  }

  dimension: opportunity_count_100k_less_this_qtr {
    type: number
    sql: ${TABLE}.opportunity_count_100k_less_this_qtr__c ;;
  }

  dimension: opportunity_count_250k_this_qtr {
    type: number
    sql: ${TABLE}.opportunity_count_250k_this_qtr__c ;;
  }

  dimension: opportunity_owner_active {
    type: yesno
    sql: ${TABLE}.opportunity_owner_active__c ;;
  }

  dimension: opportunity_owner_s_role_in_hierarchy {
    type: string
    sql: ${TABLE}.opportunity_owner_s_role_in_hierarchy__c ;;
  }

  dimension_group: opportunity_stage_min_change {
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
    sql: ${TABLE}.opportunity_stage_min_change_date__c ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number__c ;;
  }

  dimension: our_value_to_partner {
    type: string
    sql: ${TABLE}.our_value_to_partner__c ;;
  }

  measure: outcome_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.outcome_amount__c ;;
  }

  measure: outcome_amount_original {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.outcome_amount_original__c ;;
  }

  dimension: owner_s_manager_at_time_of_deal {
    type: string
    sql: ${TABLE}.owner_s_manager_at_time_of_deal__c ;;
  }

  dimension: owner_tenure {
    type: number
    sql: ${TABLE}.owner_tenure__c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.ownerid ;;
  }

  dimension: parent_project {
    type: string
    sql: ${TABLE}.parent_project__c ;;
  }

  dimension: parent_project_link {
    type: string
    sql: ${TABLE}.parent_project_link__c ;;
  }

  dimension: partner_credit_type {
    type: string
    sql: ${TABLE}.partner_credit_type__c ;;
  }

  dimension: partner_driven {
    type: yesno
    sql: ${TABLE}.partner_driven__c ;;
  }

  measure: partner_opportunity_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.partner_opportunity_amount__c ;;
  }

  dimension: percent_hours_jaipur {
    type: string
    sql: ${TABLE}.percent_hours_jaipur__c ;;
  }

  dimension: percentage_covered_by_resource_requests {
    type: string
    sql: ${TABLE}.percentage_covered_by_resource_requests__c ;;
  }

  dimension: potential_sale_value {
    type: string
    sql: ${TABLE}.potential_sale_value__c ;;
  }

  dimension: potentialfollowon {
    type: string
    sql: ${TABLE}.potentialfollowon__c ;;
  }

  dimension: pre_pay {
    type: string
    sql: ${TABLE}.pre_pay__c ;;
  }

  dimension: previous_quarter_closed {
    type: number
    sql: ${TABLE}.previous_quarter_closed__c ;;
  }

  dimension: price_book_2_id {
    type: string
    sql: ${TABLE}.pricebook2id ;;
  }

  dimension: product_driven {
    type: yesno
    sql: ${TABLE}.product_driven__c ;;
  }

  dimension: product_list {
    type: string
    sql: ${TABLE}.product_list__c ;;
  }

  dimension: product_list_ids {
    type: string
    sql: ${TABLE}.product_list_ids__c ;;
  }

  dimension: product_list_names {
    type: string
    sql: ${TABLE}.product_list_names__c ;;
  }

  dimension: project_1 {
    type: string
    sql: ${TABLE}.project_1__c ;;
  }

  dimension: project_2 {
    type: string
    sql: ${TABLE}.project_2__c ;;
  }

  dimension: project_3 {
    type: string
    sql: ${TABLE}.project_3__c ;;
  }

  dimension: project_exists {
    type: yesno
    sql: ${TABLE}.project_exists__c ;;
  }

  dimension: purchasing_timeframe {
    type: string
    sql: ${TABLE}.purchas__c ;;
  }

  dimension: purchase_contact_email {
    type: string
    sql: ${TABLE}.purchase_contact_email__c ;;
  }

  dimension: purchase_order {
    type: string
    sql: ${TABLE}.purchase_order__c ;;
  }

  dimension: purchase_order_required {
    type: string
    sql: ${TABLE}.purchase_order_required__c ;;
  }

  dimension: purchasing_contact {
    type: string
    sql: ${TABLE}.purchasing_contact__c ;;
  }

  dimension: quarter_booked_q1_q2_q3_q4 {
    type: string
    sql: ${TABLE}.quarter_booked_q1_q2_q3_q4__c ;;
  }

  dimension: renewal_increase_percent {
    type: string
    sql: ${TABLE}.renewal_increase_percent__c ;;
  }

  dimension: reporting_account {
    type: string
    sql: ${TABLE}.reporting_account__c ;;
  }

  dimension: reviewed_by_finance_ops {
    type: yesno
    sql: ${TABLE}.reviewed_by_finance_ops__c ;;
  }

  dimension: reviewed_by_rev_rec_team {
    type: yesno
    sql: ${TABLE}.reviewed_by_rev_rec_team__c ;;
  }

  dimension: roi_analysis_completed {
    type: yesno
    sql: ${TABLE}.roi_analysis_completed__c ;;
  }

  dimension: sales_geography {
    type: string
    sql: ${TABLE}.sales_geography__c ;;
  }

  dimension: sales_partner {
    type: string
    sql: ${TABLE}.sales_partner__c ;;
  }

  dimension: sales_partner_account {
    type: string
    sql: ${TABLE}.sales_partner_account__c ;;
  }

  dimension: seat_description {
    type: string
    sql: ${TABLE}.seat_description__c ;;
  }

  dimension: second_product_of_interest {
    type: string
    sql: ${TABLE}.second_product_of_interest__c ;;
  }

  measure: self_service_amount_converted {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.self_service_amount_converted__c ;;
  }

  dimension: smartsheet_id {
    type: string
    sql: ${TABLE}.smartsheet_id__c ;;
  }

  dimension: special_terms_conditions {
    type: string
    sql: ${TABLE}.special_terms_conditions__c ;;
  }

  dimension: staffing_lead_time {
    type: number
    sql: ${TABLE}.staffing_lead_time__c ;;
  }

  dimension: staffing_requirements {
    type: string
    sql: ${TABLE}.staffing_requirements__c ;;
  }

  dimension: stage_before_loss {
    type: string
    sql: ${TABLE}.stage_before_loss__c ;;
  }

  dimension: sub_opportunity {
    type: yesno
    sql: ${TABLE}.sub_opportunity__c ;;
  }

  dimension: subcontracting_end_customer {
    type: string
    sql: ${TABLE}.subcontracting_end_customer__c ;;
  }

  dimension: subcontracting_end_customer_industry {
    type: string
    sql: ${TABLE}.subcontracting_end_customer_industry__c ;;
  }

  dimension: subcontracting_end_customer_type {
    type: string
    sql: ${TABLE}.subcontracting_end_customer_type__c ;;
  }

  dimension: subcontracting_end_customer_vertical {
    type: string
    sql: ${TABLE}.subcontracting_end_customer_vertical__c ;;
  }

  dimension: subcontracting_end_customr_topcoderprtnr {
    type: string
    sql: ${TABLE}.subcontracting_end_customr_topcoderprtnr__c ;;
  }

  dimension: subcontracting_sbu {
    type: string
    sql: ${TABLE}.subcontracting_sbu__c ;;
  }

  dimension: subcontracting_tier {
    type: string
    sql: ${TABLE}.subcontracting_tier__c ;;
  }

  measure: subscription_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.subscription_amount__c ;;
  }

  dimension: subscription_level {
    type: string
    sql: ${TABLE}.subscription_level__c ;;
  }

  dimension: survey_status_nps {
    type: string
    sql: ${TABLE}.survey_status_nps__c ;;
  }

  dimension_group: system_mod_stamp {
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
    sql: ${TABLE}.systemmodstamp ;;
  }

  dimension: t_m_project_link {
    type: string
    sql: ${TABLE}.t_m_project_link__c ;;
  }

  dimension_group: target_ppw {
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
    sql: ${TABLE}.target_ppw_date__c ;;
  }

  dimension: tc_connect_description {
    type: string
    sql: ${TABLE}.tc_connect_description__c ;;
  }

  dimension: tc_connect_direct_project_id {
    type: string
    sql: ${TABLE}.tc_connect_direct_project_id__c ;;
  }

  dimension: tc_connect_project_id {
    type: string
    sql: ${TABLE}.tc_connect_project_id__c ;;
  }

  dimension: tc_connect_project_id_formula {
    type: string
    sql: ${TABLE}.tc_connect_project_id_formula__c ;;
  }

  dimension: thank_yous {
    type: string
    sql: ${TABLE}.thank_yous__c ;;
  }

  dimension: third_product_of_interest {
    type: string
    sql: ${TABLE}.third_product_of_interest__c ;;
  }

  dimension: this_quarter_unweighted {
    type: number
    sql: ${TABLE}.this_quarter_unweighted__c ;;
  }

  dimension: this_quarter_weighted_pipeline {
    type: number
    sql: ${TABLE}.this_quarter_weighted_pipeline__c ;;
  }

  dimension: total_community_challenge_fees {
    type: number
    sql: ${TABLE}.total_community_challenge_fees__c ;;
  }

  dimension: total_community_challenge_memberpayments {
    type: number
    sql: ${TABLE}.total_community_challenge_memberpayments__c ;;
  }

  dimension: total_community_expert_services {
    type: number
    sql: ${TABLE}.total_community_expert_services__c ;;
  }

  dimension: total_community_license {
    type: number
    sql: ${TABLE}.total_community_license__c ;;
  }

  dimension: total_hours_from_resource_requests {
    type: number
    sql: ${TABLE}.total_hours_from_resource_requests__c ;;
  }

  dimension: total_num_of_line_items {
    type: number
    sql: ${TABLE}.total_num_of_line_items__c ;;
  }

  dimension: total_potential_user {
    type: string
    sql: ${TABLE}.total_potential_user__c ;;
  }

  dimension: touch {
    type: yesno
    sql: ${TABLE}.touch__c ;;
  }

  dimension: trace_opportunity_number {
    type: string
    sql: ${TABLE}.trace_opportunity_number__c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: type__c {
    hidden: yes
    type: string
    sql: ${TABLE}.type__c ;;
  }

  dimension: unbooked_capacity {
    type: number
    sql: ${TABLE}.unbooked_capacity__c ;;
  }

  dimension: wbs_code {
    type: string
    sql: ${TABLE}.wbs_code__c ;;
  }

  dimension: which_stage {
    type: string
    sql: ${TABLE}.which_stage__c ;;
  }

  dimension: won_lost_open {
    type: string
    sql: ${TABLE}.won_lost_open__c ;;
  }

  dimension: year_in_current_contract {
    type: string
    sql: ${TABLE}.year_in_current_contract__c ;;
  }

  measure: amount_without_wipro_services {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.amount_without_wipro_services__c ;;
  }

  dimension: challenge_fee {
    type: number
    sql: ${TABLE}.challenge_fee__c ;;
  }

  dimension: comments_for_billable_psr {
    type: string
    sql: ${TABLE}.comments_for_billable_psr__c ;;
  }

  dimension: con_ops_mismatch_justified {
    type: yesno
    sql: ${TABLE}.con_ops_mismatch_justified__c ;;
  }

  dimension: customer_success_manager {
    type: string
    sql: ${TABLE}.customer_success_manager__c ;;
  }

  dimension: debooking_reason {
    type: string
    sql: ${TABLE}.debooking_reason__c ;;
  }

  dimension: debook_opportunity {
    type: string
    sql: ${TABLE}.debook_opportunity__c ;;
  }

  dimension: debook_request {
    type: string
    sql: ${TABLE}.debook_request__c ;;
  }

  dimension: debook_request_formula {
    type: string
    sql: ${TABLE}.debook_request_formula__c ;;
  }

  dimension_group: debook_request {
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
    sql: ${TABLE}.debook_request_date__c ;;
  }

  dimension: debook_requester {
    type: string
    sql: ${TABLE}.debook_requester__c ;;
  }

  dimension: fc_expert_services_no_wipro {
    type: number
    sql: ${TABLE}.fc_expert_services_no_wipro__c ;;
  }

  dimension: has_wbs_code {
    type: yesno
    sql: ${TABLE}.has_wbs_code__c ;;
  }

  dimension: has_wipro_sow {
    type: yesno
    sql: ${TABLE}.has_wipro_sow__c ;;
  }

  dimension: is_owner_current_user {
    type: yesno
    sql: ${TABLE}.is_owner_current_user__c ;;
  }

  dimension: is_ps_budget_same_as_opportunity {
    type: yesno
    sql: ${TABLE}.is_ps_budget_same_as_opportunity__c ;;
  }

  dimension: marketing_influenced_sourced {
    type: yesno
    sql: ${TABLE}.marketing_influenced_sourced__c ;;
  }

  dimension: markup {
    type: number
    sql: ${TABLE}.markup__c ;;
  }

  dimension: member_payment {
    type: number
    sql: ${TABLE}.member_payment__c ;;
  }

  dimension: owner_name {
    type: string
    sql: ${TABLE}.owner_name_formula__c ;;
  }

  dimension: psr_billable {
    type: yesno
    sql: ${TABLE}.psr_billable__c ;;
  }

  dimension: public_sector {
    type: yesno
    sql: ${TABLE}.public_sector__c ;;
  }

  dimension: remove_from_forecast {
    type: yesno
    sql: ${TABLE}.remove_from_forecast__c ;;
  }

  dimension: services_total {
    type: number
    sql: ${TABLE}.services_total__c ;;
  }

  measure: fc_taas_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.fc_taas_amount__c ;;
  }

  measure: total_amount_including_expense {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.total_amount_including_expense__c ;;
  }

  dimension: total_approved_budget {
    type: number
    sql: ${TABLE}.total_approved_budget_ps__c ;;
  }

  dimension: total_backlog {
    type: number
    sql: ${TABLE}.total_backlog_ps__c ;;
  }

  dimension: total_billings {
    type: number
    sql: ${TABLE}.total_billings_ps__c ;;
  }

  measure: total_invoiced_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.total_invoiced_amount_ps__c ;;
  }

  dimension: total_sponsorship {
    type: number
    sql: ${TABLE}.total_sponsorship__c ;;
  }

  dimension: trace_opportunity_id {
    type: string
    sql: ${TABLE}.trace_opportunity_id__c ;;
  }

  dimension: wipro_services {
    type: number
    sql: ${TABLE}.wipro_services__c ;;
  }

  measure: count_opportunity {
    label: "Count (Distinct)"
    type: count_distinct
    sql: ${TABLE}.id ;;
    description: "Opportunity Count"
    drill_fields: [sfdc_opportunity_id, name]
  }

  measure: count_opportunity {
    label: "Count (Distinct)"
    type: count_distinct
    sql: ${TABLE}.id ;;
    description: "Opportunity Count"
    drill_fields: [sfdc_opportunity_id, name]
  }
}
