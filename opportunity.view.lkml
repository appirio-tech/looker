view: opportunity {
  sql_table_name: tcs_dw.opportunity ;;

  dimension: opportunity_id {
    primary_key: yes
    view_label: "Transaction ID"
    type: string
    sql: ${TABLE}.opportunity_id ;;
  }

  dimension: _line_items_consulting_services {
    type: number
    sql: ${TABLE}."#_line_items_consulting_services" ;;
  }

  dimension: account_address {
    type: string
    sql: ${TABLE}.account_address ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_industry {
    type: string
    sql: ${TABLE}.account_industry ;;
  }

  dimension_group: account_last_activity {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.account_last_activity ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: account_phone {
    type: string
    sql: ${TABLE}.account_phone ;;
  }

  dimension: account_region {
    type: string
    sql: ${TABLE}.account_region ;;
  }

  dimension: account_tenure {
    type: number
    sql: ${TABLE}.account_tenure ;;
  }

  dimension: accounts_payable_contact {
    type: string
    sql: ${TABLE}.accounts_payable_contact ;;
  }

  dimension: accounts_payable_email {
    type: string
    sql: ${TABLE}.accounts_payable_email ;;
  }

  dimension: accounts_payable_phone {
    type: string
    sql: ${TABLE}.accounts_payable_phone ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: amount {
    view_label: "Transaction Revenue"
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.amount ;;
  }

  dimension: amount_constant_ {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}."amount_constant_$" ;;
  }

  dimension: amount_currency {
    view_label: "Transaction Revenue Currency"
    type: string
    sql: ${TABLE}.amount_currency ;;
  }

  dimension: amount_days {
    type: number
    sql: ${TABLE}.amount_days ;;
  }

  dimension: amount_lost_usd {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.amount_lost_usd ;;
  }

  dimension: amount_usd {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.amount_usd ;;
  }

  dimension: amount_won_usd {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.amount_won_usd ;;
  }

  dimension: as_sold_margin {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.as_sold_margin ;;
  }

  dimension: as_sold_profit {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.as_sold_profit ;;
  }

  dimension: as_sold_profit_currency {
    type: string
    sql: ${TABLE}.as_sold_profit_currency ;;
  }

  dimension: asm_billings {
    type: number
    sql: ${TABLE}.asm_billings ;;
  }

  dimension: asm_costs {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.asm_costs ;;
  }

  dimension: auto_renewal {
    type: yesno
    sql: ${TABLE}.auto_renewal ;;
  }

  dimension: avg_bill_rate__us_strategy {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.avg_bill_rate__us_strategy ;;
  }

  dimension: avg_bill_rate_emea {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.avg_bill_rate_emea ;;
  }

  dimension: avg_bill_rate_jaipur {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.avg_bill_rate_jaipur ;;
  }

  dimension: avg_bill_rate_japan {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.avg_bill_rate_japan ;;
  }

  dimension: avg_bill_rate_us {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.avg_bill_rate_us ;;
  }

  dimension: avg_bill_rate_us_indianapolis {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.avg_bill_rate_us_indianapolis ;;
  }

  dimension: avg_offshore_services_hourly_rate {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.avg_offshore_services_hourly_rate ;;
  }

  dimension: avg_offshore_services_hourly_rate_currency {
    type: string
    sql: ${TABLE}.avg_offshore_services_hourly_rate_currency ;;
  }

  dimension: avg_onshore_services_hourly_rate {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.avg_onshore_services_hourly_rate ;;
  }

  dimension: avg_onshore_services_hourly_rate_currency {
    type: string
    sql: ${TABLE}.avg_onshore_services_hourly_rate_currency ;;
  }

  dimension: big_bet {
    type: string
    sql: ${TABLE}.big_bet ;;
  }

  dimension: big_deal {
    type: string
    sql: ${TABLE}.big_deal ;;
  }

  dimension: big_deal_spif {
    type: yesno
    sql: ${TABLE}.big_deal_spif ;;
  }

  dimension: billings_adjustment {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.billings_adjustment ;;
  }

  dimension: budget_confirmed {
    type: yesno
    sql: ${TABLE}.budget_confirmed ;;
  }

  dimension: business_unit {
    type: string
    sql: ${TABLE}.business_unit ;;
  }

  dimension: campaign_type {
    type: string
    sql: ${TABLE}.campaign_type ;;
  }

  dimension: client_decision_maker {
    type: string
    sql: ${TABLE}.client_decision_maker ;;
  }

  dimension: client_goals {
    type: string
    sql: ${TABLE}.client_goals ;;
  }

  dimension: client_pains {
    type: string
    sql: ${TABLE}.client_pains ;;
  }

  dimension_group: close {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.close_date ;;
  }

  dimension_group: close_date_2 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.close_date_2 ;;
  }

  dimension_group: close_month {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.close_month ;;
  }

    dimension: closed {
    type: yesno
    sql: ${TABLE}.closed ;;
  }

  dimension: closed_in_quarter_created {
    type: yesno
    sql: ${TABLE}.closed_in_quarter_created ;;
  }

  dimension: connect_project_id {
    type: string
    sql: ${TABLE}.connect_project_id ;;
  }

  dimension: connect_project_link {
    type: string
    sql: ${TABLE}.connect_project_link ;;
  }

  dimension: contact_role_count {
    type: number
    sql: ${TABLE}.contact_role_count ;;
  }

  dimension_group: contract_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.contract_end_date ;;
  }

  dimension: contract_length {
    type: number
    sql: ${TABLE}.contract_length ;;
  }

  dimension: contract_number {
    type: number
    sql: ${TABLE}.contract_number ;;
  }

  dimension_group: contract_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.contract_start_date ;;
  }

  dimension: corporate_plan_credit {
    type: string
    sql: ${TABLE}.corporate_plan_credit ;;
  }

  dimension: corporate_plan_credit_currency {
    type: string
    sql: ${TABLE}.corporate_plan_credit_currency ;;
  }

  dimension: cost_adjustment {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.cost_adjustment ;;
  }

  dimension: cost_rate_emea {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.cost_rate_emea ;;
  }

  dimension: cost_rate_jaipur {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.cost_rate_jaipur ;;
  }

  dimension: cost_rate_japan {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.cost_rate_japan ;;
  }

  dimension: cost_rate_us {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.cost_rate_us ;;
  }

  dimension: cost_rate_us_indianapolis {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.cost_rate_us_indianapolis ;;
  }

  dimension: cost_rate_us_strategy {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.cost_rate_us_strategy ;;
  }

  dimension: counts_for_self_service {
    type: yesno
    sql: ${TABLE}.counts_for_self_service ;;
  }

  dimension: counts_for_self_service_old {
    type: yesno
    sql: ${TABLE}.counts_for_self_service_old ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_date ;;
  }

  dimension: crowd_deal_type {
    type: string
    sql: ${TABLE}.crowd_deal_type ;;
  }

  dimension: current_solution {
    type: string
    sql: ${TABLE}.current_solution ;;
  }

  dimension: custom_development {
    type: yesno
    sql: ${TABLE}.custom_development ;;
  }

  dimension: customer_pain_point {
    type: string
    sql: ${TABLE}.customer_pain_point ;;
  }

  dimension: customer_segment {
    type: string
    sql: ${TABLE}.customer_segment ;;
  }

  dimension: customer_segment_at_close {
    type: string
    sql: ${TABLE}.customer_segment_at_close ;;
  }

  dimension_group: date_of_last_stage_or_probability_change {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_of_last_stage_or_probability_change ;;
  }

  dimension: days_past_close {
    type: number
    sql: ${TABLE}.days_past_close ;;
  }

  dimension: days_till_next_step {
    type: number
    sql: ${TABLE}.days_till_next_step ;;
  }

  dimension: days_until_close {
    type: number
    sql: ${TABLE}.days_until_close ;;
  }

  dimension: deal_next_steps {
    type: string
    sql: ${TABLE}.deal_next_steps ;;
  }

  dimension: deal_type {
    type: string
    sql: ${TABLE}.deal_type ;;
  }

  dimension: deal_type_old {
    type: string
    sql: ${TABLE}.deal_type_old ;;
  }

  dimension: delivery_partner {
    type: string
    sql: ${TABLE}.delivery_partner ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: direct_project_id {
    type: string
    sql: ${TABLE}.direct_project_id ;;
  }

  dimension: discovery_completed {
    type: yesno
    sql: ${TABLE}.discovery_completed ;;
  }

  dimension: due_date_alert {
    type: string
    sql: ${TABLE}.due_date_alert ;;
  }

  dimension: employees {
    type: number
    sql: ${TABLE}.employees ;;
  }

  dimension: engagement_activity_1 {
    type: string
    sql: ${TABLE}.engagement_activity_1 ;;
  }

  dimension: engagement_activity_2 {
    type: string
    sql: ${TABLE}.engagement_activity_2 ;;
  }

  dimension: estimated_weeks {
    type: number
    sql: ${TABLE}.estimated_weeks ;;
  }

  dimension: executive_sponsor {
    type: string
    sql: ${TABLE}.executive_sponsor ;;
  }

  dimension: expected_revenue {
    type: number
    sql: ${TABLE}.expected_revenue ;;
  }

  dimension: expected_revenue_converted {
    type: number
    sql: ${TABLE}.expected_revenue_converted ;;
  }

  dimension: expected_revenue_converted_currency {
    type: string
    sql: ${TABLE}.expected_revenue_converted_currency ;;
  }

  dimension: expected_revenue_currency {
    type: string
    sql: ${TABLE}.expected_revenue_currency ;;
  }

  dimension: expert_community_amount_converted {
    type: number
    sql: ${TABLE}.expert_community_amount_converted ;;
  }

  dimension: first_product_of_interest {
    type: string
    sql: ${TABLE}.first_product_of_interest ;;
  }

  dimension: fiscal_period {
    type: string
    sql: ${TABLE}.fiscal_period ;;
  }

  dimension: fiscal_year {
    type: string
    sql: ${TABLE}.fiscal_year ;;
  }

  dimension: forecast {
    type: string
    sql: ${TABLE}.forecast ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}.forecast_category ;;
  }

  dimension: google_analytics_click_id {
    type: string
    sql: ${TABLE}.google_analytics_click_id ;;
  }

  dimension: google_analytics_client_id {
    view_label: "GA Client ID"
    type: string
    sql: ${TABLE}.google_analytics_client_id ;;
  }

  dimension: has_resource_request_dnu {
    type: yesno
    sql: ${TABLE}.has_resource_request_dnu ;;
  }

  dimension: has_resource_requests {
    type: yesno
    sql: ${TABLE}.has_resource_requests ;;
  }

  dimension: hours_emea {
    type: number
    sql: ${TABLE}.hours_emea ;;
  }

  dimension: hours_jaipur {
    type: number
    sql: ${TABLE}.hours_jaipur ;;
  }

  dimension: hours_japan {
    type: number
    sql: ${TABLE}.hours_japan ;;
  }

  dimension: hours_total {
    type: number
    sql: ${TABLE}.hours_total ;;
  }

  dimension: hours_us {
    type: number
    sql: ${TABLE}.hours_us ;;
  }

  dimension: hours_us_indianapolis {
    type: number
    sql: ${TABLE}.hours_us_indianapolis ;;
  }

  dimension: hours_us_strategy {
    type: number
    sql: ${TABLE}.hours_us_strategy ;;
  }

  dimension: inside_sales_rep {
    type: string
    sql: ${TABLE}.inside_sales_rep ;;
  }

  dimension: inside_sales_rep_name {
    type: string
    sql: ${TABLE}.inside_sales_rep_name ;;
  }

  dimension: internal_notes {
    type: string
    sql: ${TABLE}.internal_notes ;;
  }

  dimension: invoice_contact_email {
    type: string
    sql: ${TABLE}.invoice_contact_email ;;
  }

  dimension: invoice_contact_name {
    type: string
    sql: ${TABLE}.invoice_contact_name ;;
  }

  dimension: invoice_ninja_client_id {
    type: number
    sql: ${TABLE}.invoice_ninja_client_id ;;
  }

  dimension: is_split {
    type: yesno
    sql: ${TABLE}.is_split ;;
  }

  dimension_group: last_activity {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_activity ;;
  }

  dimension: last_modified_by {
    type: string
    sql: ${TABLE}.last_modified_by ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: legacy_id {
    type: string
    sql: ${TABLE}.legacy_id ;;
  }

  dimension: legacy_system {
    type: string
    sql: ${TABLE}.legacy_system ;;
  }

  dimension: loss_description {
    type: string
    sql: ${TABLE}.loss_description ;;
  }

  dimension: loss_reason {
    type: string
    sql: ${TABLE}.loss_reason ;;
  }

  dimension: main_competitor {
    type: string
    sql: ${TABLE}.main_competitor ;;
  }

  dimension: marketing_influenced {
    type: yesno
    sql: ${TABLE}.marketing_influenced ;;
  }

  dimension: marketing_sourced {
    type: yesno
    sql: ${TABLE}.marketing_sourced ;;
  }

  dimension: multi_year_contract {
    type: yesno
    sql: ${TABLE}.multi_year_contract ;;
  }

  dimension: name_geo {
    type: string
    sql: ${TABLE}.name_geo ;;
  }

  dimension: new_customer_or_followon_business {
    type: string
    sql: ${TABLE}.new_customer_or_followon_business ;;
  }

  dimension: new_vs_existing {
    type: string
    sql: ${TABLE}.new_vs_existing ;;
  }

  dimension: next_step {
    type: string
    sql: ${TABLE}.next_step ;;
  }

  dimension_group: next_step {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.next_step_date ;;
  }

  dimension: no_of_resource_requests {
    type: number
    sql: ${TABLE}.no_of_resource_requests ;;
  }

  dimension: no_ppw_required {
    type: yesno
    sql: ${TABLE}.no_ppw_required ;;
  }

  dimension: number_of_seats {
    type: number
    sql: ${TABLE}.number_of_seats ;;
  }

  dimension: onsite_requirements {
    type: string
    sql: ${TABLE}.onsite_requirements ;;
  }

  dimension: opportunity_currency {
    type: string
    sql: ${TABLE}.opportunity_currency ;;
  }

  dimension: opportunity_name {
    type: string
    sql: ${TABLE}.opportunity_name ;;
  }

  dimension: opportunity_owner {
    type: string
    sql: ${TABLE}.opportunity_owner ;;
  }

  dimension: opportunity_owner_active {
    type: yesno
    sql: ${TABLE}.opportunity_owner_active ;;
  }

  dimension: opportunity_owners_role_in_hierarchy {
    type: string
    sql: ${TABLE}.opportunity_owners_role_in_hierarchy ;;
  }

  dimension: opportunity_quantity {
    type: number
    sql: ${TABLE}.opportunity_quantity ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: our_value_to_partner {
    type: string
    sql: ${TABLE}.our_value_to_partner ;;
  }

  dimension: outcome_amount {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.outcome_amount ;;
  }

  dimension: owner_name {
    type: string
    sql: ${TABLE}.owner_name ;;
  }

  dimension: owner_tenure {
    type: number
    sql: ${TABLE}.owner_tenure ;;
  }

  dimension: owners_manager_at_time_of_deal {
    type: string
    sql: ${TABLE}.owners_manager_at_time_of_deal ;;
  }

  dimension: partner_credit_type {
    type: string
    sql: ${TABLE}.partner_credit_type ;;
  }

  dimension: partner_opportunity_amount {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.partner_opportunity_amount ;;
  }

  dimension: percentage_covered_by_resource_requests {
    type: number
    value_format: "0.##"
    sql: ${TABLE}.percentage_covered_by_resource_requests ;;
  }

  dimension: percentage_effort_offshore {
    type: number
    value_format: "0.##"
    sql: ${TABLE}.percentage_effort_offshore ;;
  }

  dimension: percentage_hours_jaipur {
    type: number
    value_format: "0.##"
    sql: ${TABLE}.percentage_hours_jaipur ;;
  }

  dimension: percentage_pre_pay {
    type: number
    value_format: "0.##"
    sql: ${TABLE}.percentage_pre_pay ;;
  }

  dimension: potential_follow_on {
    type: string
    sql: ${TABLE}.potential_follow_on ;;
  }

  dimension: potential_sale_value {
    type: string
    sql: ${TABLE}.potential_sale_value ;;
  }

  dimension: pricing_method {
    type: string
    sql: ${TABLE}.pricing_method ;;
  }

  dimension: primary_campaign_source {
    type: string
    sql: ${TABLE}.primary_campaign_source ;;
  }

  dimension: probability_percentage {
    type: number
    value_format: "0.##"
    sql: ${TABLE}.probability_percentage ;;
  }

  dimension: product_driven {
    type: yesno
    sql: ${TABLE}.product_driven ;;
  }

  dimension: product_list {
    view_label: "Item Name"
    type: string
    sql: ${TABLE}.product_list ;;
  }

  dimension: purchase_contact_email {
    type: string
    sql: ${TABLE}.purchase_contact_email ;;
  }

  dimension: purchase_order {
    type: string
    sql: ${TABLE}.purchase_order ;;
  }

  dimension: purchase_order_required {
    type: string
    sql: ${TABLE}.purchase_order_required ;;
  }

  dimension: purchasing_contact {
    type: string
    sql: ${TABLE}.purchasing_contact ;;
  }

  dimension: quarter_booked {
    type: string
    sql: ${TABLE}.quarter_booked ;;
  }

  dimension: renewal_increase_percent {
    type: number
    value_format: "0.##"
    sql: ${TABLE}.renewal_increase_percent ;;
  }

  dimension: reviewed_by_finance_ops {
    type: yesno
    sql: ${TABLE}.reviewed_by_finance_ops ;;
  }

  dimension: reviewed_by_rev_rec_team {
    type: yesno
    sql: ${TABLE}.reviewed_by_rev_rec_team ;;
  }

  dimension: roi_analysis_completed {
    type: yesno
    sql: ${TABLE}.roi_analysis_completed ;;
  }

  dimension: sales_geography {
    type: string
    sql: ${TABLE}.sales_geography ;;
  }

  dimension: sales_partner {
    type: string
    sql: ${TABLE}.sales_partner ;;
  }

  dimension: seat_description {
    type: string
    sql: ${TABLE}.seat_description ;;
  }

  dimension: second_product_of_interest {
    type: string
    sql: ${TABLE}.second_product_of_interest ;;
  }

  dimension: self_service_amount_converted {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.self_service_amount_converted ;;
  }

  dimension: special_terms_conditions {
    type: string
    sql: ${TABLE}.special_terms_conditions ;;
  }

  dimension: staffing_lead_time_weeks {
    type: number
    sql: ${TABLE}.staffing_lead_time_weeks ;;
  }

  dimension: staffing_requirements {
    type: string
    sql: ${TABLE}.staffing_requirements ;;
  }

  dimension: stage {
    type: string
    sql: ${TABLE}.stage ;;
  }

  dimension: stage_before_loss {
    type: string
    sql: ${TABLE}.stage_before_loss ;;
  }

  dimension: sub_opportunity {
    type: yesno
    sql: ${TABLE}.sub_opportunity ;;
  }

  dimension: subcontracting_end_customer {
    type: string
    sql: ${TABLE}.subcontracting_end_customer ;;
  }

  dimension: subcontracting_end_customer_industry {
    type: string
    sql: ${TABLE}.subcontracting_end_customer_industry ;;
  }

  dimension: subcontracting_end_customer_type {
    type: string
    sql: ${TABLE}.subcontracting_end_customer_type ;;
  }

  dimension: subcontracting_end_customr_topcoderprtnr {
    type: string
    sql: ${TABLE}.subcontracting_end_customr_topcoderprtnr ;;
  }

  dimension: subcontracting_sbu {
    type: string
    sql: ${TABLE}.subcontracting_sbu ;;
  }

  dimension: subcontracting_tier {
    type: string
    sql: ${TABLE}.subcontracting_tier ;;
  }

  dimension: subscription_amount_converted {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.subscription_amount_converted ;;
  }

  dimension: subscription_level {
    type: string
    sql: ${TABLE}.subscription_level ;;
  }

  dimension_group: target_ppw {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.target_ppw_date ;;
  }

  dimension: thank_yous {
    type: string
    sql: ${TABLE}.thank_yous ;;
  }

  dimension: third_product_of_interest {
    type: string
    sql: ${TABLE}.third_product_of_interest ;;
  }

  dimension: topcoder_billing_amount {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.topcoder_billing_amount ;;
  }

  dimension: topcoder_commit_to_count_against {
    type: string
    sql: ${TABLE}.topcoder_commit_to_count_against ;;
  }

  dimension: total__of_line_items {
    type: number
    sql: ${TABLE}."total_#_of_line_items" ;;
  }

  dimension: total_community_challenge_fees {
    view_label: "Item Price"
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.total_community_challenge_fees ;;
  }

  dimension: total_community_challenge_fees_currency {
    view_label: "Item Price Currency"
    type: string
    sql: ${TABLE}.total_community_challenge_fees_currency ;;
  }

  dimension: total_community_challenge_memberpayments {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.total_community_challenge_memberpayments ;;
  }

  dimension: total_community_challenge_memberpayments_currency {
    type: string
    sql: ${TABLE}.total_community_challenge_memberpayments_currency ;;
  }

  dimension: total_community_expert_services {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.total_community_expert_services ;;
  }

  dimension: total_community_expert_services_currency {
    type: string
    sql: ${TABLE}.total_community_expert_services_currency ;;
  }

  dimension: total_community_license {
    type: number
    value_format: "#,##0.00;(#,##0.00)"
    sql: ${TABLE}.total_community_license ;;
  }

  dimension: total_community_license_currency {
    type: string
    sql: ${TABLE}.total_community_license_currency ;;
  }

  dimension: total_hours_from_resource_requests {
    type: number
    sql: ${TABLE}.total_hours_from_resource_requests ;;
  }

  dimension: total_potential_user {
    type: string
    sql: ${TABLE}.total_potential_user ;;
  }

  dimension: touch {
    type: yesno
    sql: ${TABLE}.touch ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: unbooked_capacity {
    type: string
    sql: ${TABLE}.unbooked_capacity ;;
  }

  dimension: unbooked_capacity_currency {
    type: string
    sql: ${TABLE}.unbooked_capacity_currency ;;
  }

  dimension: which_stage {
    type: string
    sql: ${TABLE}.which_stage ;;
  }

  dimension: won {
    type: yesno
    sql: ${TABLE}.won ;;
  }

  dimension: won_lost_open {
    type: string
    sql: ${TABLE}.won_lost_open ;;
  }

  dimension_group: year_in_current_contract {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.year_in_current_contract ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      opportunity_id,
      invoice_contact_name,
      owner_name,
      inside_sales_rep_name,
      opportunity_name,
      account_name
    ]
  }
}
