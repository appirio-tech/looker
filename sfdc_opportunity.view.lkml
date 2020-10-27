view: sfdc_opportunity {
  sql_table_name: tcs_dw.sfdc_opportunity ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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
    sql: ${TABLE}.owner_name__c;;
  }

  dimension: account_id {
  type: string
  sql: ${TABLE}.accountid ;;
  }

  measure: amount {
    type: sum
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
    value_format_name: percent_2
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

  dimension: account_address__c {
    type: string
    sql: ${TABLE}.account_address__c ;;
  }

  dimension: account_country__c {
    type: string
    sql: ${TABLE}.account_country__c ;;
  }

  dimension: account_executive__c {
    type: string
    sql: ${TABLE}.account_executive__c ;;
  }

  dimension: account_executive_name__c {
    type: string
    sql: ${TABLE}.account_executive_name__c ;;
  }

  dimension: account_industry__c {
    type: string
    sql: ${TABLE}.account_industry__c ;;
  }

  dimension: account_phone__c {
    type: string
    sql: ${TABLE}.account_phone__c ;;
  }

  dimension: account_region__c {
    type: string
    sql: ${TABLE}.account_region__c ;;
  }

  dimension: account_tenure__c {
    type: number
    sql: ${TABLE}.account_tenure__c ;;
  }

  dimension: accountid {
    type: string
    sql: ${TABLE}.accountid ;;
  }

  dimension: accounts_payable_contact__c {
    type: string
    sql: ${TABLE}.accounts_payable_contact__c ;;
  }

  dimension: accounts_payable_email__c {
    type: string
    sql: ${TABLE}.accounts_payable_email__c ;;
  }

  dimension: accounts_payable_phone__c {
    type: string
    sql: ${TABLE}.accounts_payable_phone__c ;;
  }

  dimension: age_1__c {
    type: number
    sql: ${TABLE}.age_1__c ;;
  }

  dimension: age__c {
    type: number
    sql: ${TABLE}.age__c ;;
  }

  dimension: age_of_last_update__c {
    type: number
    sql: ${TABLE}.age_of_last_update__c ;;
  }

  dimension: amount_days__c {
    type: number
    sql: ${TABLE}.amount_days__c ;;
  }

  dimension: amount_lost_usd__c {
    type: number
    sql: ${TABLE}.amount_lost_usd__c ;;
  }

  dimension: amount_usd__c {
    type: number
    sql: ${TABLE}.amount_usd__c ;;
  }

  dimension: amount_won_usd__c {
    type: number
    sql: ${TABLE}.amount_won_usd__c ;;
  }

  dimension: as_sold_margin__c {
    type: string
    sql: ${TABLE}.as_sold_margin__c ;;
  }

  dimension: as_sold_profit__c {
    type: number
    sql: ${TABLE}.as_sold_profit__c ;;
  }

  dimension: asm_billings__c {
    type: number
    sql: ${TABLE}.asm_billings__c ;;
  }

  dimension: asm_costs__c {
    type: number
    sql: ${TABLE}.asm_costs__c ;;
  }

  dimension: assigned__c {
    type: string
    sql: ${TABLE}.assigned__c ;;
  }

  dimension: auto_renewal__c {
    type: yesno
    sql: ${TABLE}.auto_renewal__c ;;
  }

  dimension: average_services_hourly_rate__c {
    type: number
    sql: ${TABLE}.average_services_hourly_rate__c ;;
  }

  dimension: avg_bill_rate_emea__c {
    type: number
    sql: ${TABLE}.avg_bill_rate_emea__c ;;
  }

  dimension: avg_bill_rate_jaipur__c {
    type: number
    sql: ${TABLE}.avg_bill_rate_jaipur__c ;;
  }

  dimension: avg_bill_rate_japan__c {
    type: number
    sql: ${TABLE}.avg_bill_rate_japan__c ;;
  }

  dimension: avg_bill_rate_u_s__c {
    type: number
    sql: ${TABLE}.avg_bill_rate_u_s__c ;;
  }

  dimension: avg_bill_rate_u_s_indianapolis__c {
    type: number
    sql: ${TABLE}.avg_bill_rate_u_s_indianapolis__c ;;
  }

  dimension: avg_bill_rate_u_s_strategy__c {
    type: number
    sql: ${TABLE}.avg_bill_rate_u_s_strategy__c ;;
  }

  dimension: avg_offshore_services_hourly_rate__c {
    type: number
    sql: ${TABLE}.avg_offshore_services_hourly_rate__c ;;
  }

  dimension: big_bet__c {
    type: string
    sql: ${TABLE}.big_bet__c ;;
  }

  dimension: big_deal__c {
    type: string
    sql: ${TABLE}.big_deal__c ;;
  }

  dimension: big_deal_spif__c {
    type: yesno
    sql: ${TABLE}.big_deal_spif__c ;;
  }

  dimension: billings_adjustment__c {
    type: number
    sql: ${TABLE}.billings_adjustment__c ;;
  }

  dimension: booking_goal_qtr__c {
    type: number
    sql: ${TABLE}.booking_goal_qtr__c ;;
  }

  dimension: booking_target_qtr__c {
    type: number
    sql: ${TABLE}.booking_target_qtr__c ;;
  }

  dimension: budget_confirmed__c {
    type: yesno
    sql: ${TABLE}.budget_confirmed__c ;;
  }

  dimension: business_unit__c {
    type: string
    sql: ${TABLE}.business_unit__c ;;
  }

  dimension: campaign_type__c {
    type: string
    sql: ${TABLE}.campaign_type__c ;;
  }

  dimension: campaignid {
    type: string
    sql: ${TABLE}.campaignid ;;
  }

  dimension: challenge_spend_and_product_fee_sum__c {
    type: number
    sql: ${TABLE}.challenge_spend_and_product_fee_sum__c ;;
  }

  dimension: challenge_spend_and_product_fee_sum_usd__c {
    type: number
    sql: ${TABLE}.challenge_spend_and_product_fee_sum_usd__c ;;
  }

  dimension: change_limit_exceed__c {
    type: yesno
    sql: ${TABLE}.change_limit_exceed__c ;;
  }

  dimension: change_limit_exceed_message__c {
    type: string
    sql: ${TABLE}.change_limit_exceed_message__c ;;
  }

  dimension: change_limit_exceed_month__c {
    type: number
    sql: ${TABLE}.change_limit_exceed_month__c ;;
  }

  dimension: change_limit_exceed_qtr__c {
    type: number
    sql: ${TABLE}.change_limit_exceed_qtr__c ;;
  }

  dimension: check_forecast__c {
    type: yesno
    sql: ${TABLE}.check_forecast__c ;;
  }

  dimension: check_owner__c {
    type: yesno
    sql: ${TABLE}.check_owner__c ;;
  }

  dimension: client_decision_maker__c {
    type: string
    sql: ${TABLE}.client_decision_maker__c ;;
  }

  dimension: client_goal__c {
    type: string
    sql: ${TABLE}.client_goal__c ;;
  }

  dimension: client_pains__c {
    type: string
    sql: ${TABLE}.client_pains__c ;;
  }

  dimension: client_wipro_owner__c {
    type: string
    sql: ${TABLE}.client_wipro_owner__c ;;
  }

  dimension: close_month_in_quarter__c {
    type: number
    sql: ${TABLE}.close_month_in_quarter__c ;;
  }

  dimension: close_quarter__c {
    type: string
    sql: ${TABLE}.close_quarter__c ;;
  }

  dimension: close_quarter_numeric__c {
    type: number
    sql: ${TABLE}.close_quarter_numeric__c ;;
  }

  dimension: close_week__c {
    type: number
    sql: ${TABLE}.close_week__c ;;
  }

  dimension: closed_in_quarter_created__c {
    type: yesno
    sql: ${TABLE}.closed_in_quarter_created__c ;;
  }

  dimension_group: closedate {
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
    sql: ${TABLE}.closedate ;;
  }

  dimension: cloudspokes_billing_amount__c {
    type: number
    sql: ${TABLE}.cloudspokes_billing_amount__c ;;
  }

  dimension: commit_to_count_against__c {
    type: string
    sql: ${TABLE}.commit_to_count_against__c ;;
  }

  dimension: con_ops_comment__c {
    type: string
    sql: ${TABLE}.con_ops_comment__c ;;
  }

  dimension: connect_project_link__c {
    type: string
    sql: ${TABLE}.connect_project_link__c ;;
  }

  dimension: contact_role_count__c {
    type: number
    sql: ${TABLE}.contact_role_count__c ;;
  }

  dimension_group: contract_end_date__c {
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

  dimension: contract_length__c {
    type: string
    sql: ${TABLE}.contract_length__c ;;
  }

  dimension_group: contract_start_date__c {
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

  dimension: conversion_rate__c {
    type: number
    sql: ${TABLE}.conversion_rate__c ;;
  }

  dimension: converted_expected_revenue__c {
    type: number
    sql: ${TABLE}.converted_expected_revenue__c ;;
  }

  dimension: corporate_plan_credit__c {
    type: number
    sql: ${TABLE}.corporate_plan_credit__c ;;
  }

  dimension: cost_adjustment__c {
    type: number
    sql: ${TABLE}.cost_adjustment__c ;;
  }

  dimension: cost_center__c {
    type: string
    sql: ${TABLE}.cost_center__c ;;
  }

  dimension: cost_rate_emea__c {
    type: number
    sql: ${TABLE}.cost_rate_emea__c ;;
  }

  dimension: cost_rate_jaipur__c {
    type: number
    sql: ${TABLE}.cost_rate_jaipur__c ;;
  }

  dimension: cost_rate_japan__c {
    type: number
    sql: ${TABLE}.cost_rate_japan__c ;;
  }

  dimension: cost_rate_u_s__c {
    type: number
    sql: ${TABLE}.cost_rate_u_s__c ;;
  }

  dimension: cost_rate_u_s_indianapolis__c {
    type: number
    sql: ${TABLE}.cost_rate_u_s_indianapolis__c ;;
  }

  dimension: cost_rate_u_s_strategy__c {
    type: number
    sql: ${TABLE}.cost_rate_u_s_strategy__c ;;
  }

  dimension: counts_for_appxpress_old__c {
    type: yesno
    sql: ${TABLE}.counts_for_appxpress_old__c ;;
  }

  dimension: counts_for_self_service__c {
    type: yesno
    sql: ${TABLE}.counts_for_self_service__c ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}.createdbyid ;;
  }

  dimension_group: createddate {
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
    sql: ${TABLE}.createddate ;;
  }

  dimension: crowd_deal_type__c {
    type: string
    sql: ${TABLE}.crowd_deal_type__c ;;
  }

  dimension: currencyisocode {
    type: string
    sql: ${TABLE}.currencyisocode ;;
  }

  dimension: current_solution__c {
    type: string
    sql: ${TABLE}.current_solution__c ;;
  }

  dimension: custom_development__c {
    type: yesno
    sql: ${TABLE}.custom_development__c ;;
  }

  dimension: customer_pain_point__c {
    type: string
    sql: ${TABLE}.customer_pain_point__c ;;
  }

  dimension: customer_segment__c {
    type: string
    sql: ${TABLE}.customer_segment__c ;;
  }

  dimension: customer_segment_at_close__c {
    type: string
    sql: ${TABLE}.customer_segment_at_close__c ;;
  }

  dimension_group: date_of_last_completed_milestone__c {
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

  dimension_group: date_of_last_stage_or_probability_change__c {
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

  dimension: days_past_close__c {
    type: number
    sql: ${TABLE}.days_past_close__c ;;
  }

  dimension: days_till_next_step__c {
    type: number
    sql: ${TABLE}.days_till_next_step__c ;;
  }

  dimension: days_until_close__c {
    type: number
    sql: ${TABLE}.days_until_close__c ;;
  }

  dimension: deal_next_steps__c {
    type: string
    sql: ${TABLE}.deal_next_steps__c ;;
  }

  dimension: deal_type__c {
    type: string
    sql: ${TABLE}.deal_type__c ;;
  }

  dimension: deal_type_old__c {
    type: string
    sql: ${TABLE}.deal_type_old__c ;;
  }

  dimension: delivery_partner__c {
    type: string
    sql: ${TABLE}.delivery_partner__c ;;
  }

  dimension: delivery_partner_account__c {
    type: string
    sql: ${TABLE}.delivery_partner_account__c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discovery_completed__c {
    type: yesno
    sql: ${TABLE}.discovery_completed__c ;;
  }

  dimension: due__c {
    type: string
    sql: ${TABLE}.due__c ;;
  }

  dimension_group: due_date__c {
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

  dimension: effort_offshore__c {
    type: string
    sql: ${TABLE}.effort_offshore__c ;;
  }

  dimension: employees__c {
    type: number
    sql: ${TABLE}.employees__c ;;
  }

  dimension: engagement_activity_2__c {
    type: string
    sql: ${TABLE}.engagement_activity_2__c ;;
  }

  dimension: engagement_activity__c {
    type: string
    sql: ${TABLE}.engagement_activity__c ;;
  }

  dimension: engagement_manager__c {
    type: string
    sql: ${TABLE}.engagement_manager__c ;;
  }

  dimension: engagement_offering_type__c {
    type: string
    sql: ${TABLE}.engagement_offering_type__c ;;
  }

  dimension_group: engagementstartdate__c {
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

  dimension: estimatedweeks__c {
    type: number
    sql: ${TABLE}.estimatedweeks__c ;;
  }

  dimension: exclude_from_con_ops_radar__c {
    type: yesno
    sql: ${TABLE}.exclude_from_con_ops_radar__c ;;
  }

  dimension: executive_sponsor__c {
    type: string
    sql: ${TABLE}.executive_sponsor__c ;;
  }

  dimension: expectedrevenue {
    type: number
    sql: ${TABLE}.expectedrevenue ;;
  }

  dimension: expert_community_amount__c {
    type: number
    sql: ${TABLE}.expert_community_amount__c ;;
  }

  dimension: expert_community_amount_converted__c {
    type: number
    sql: ${TABLE}.expert_community_amount_converted__c ;;
  }

  dimension: expert_community_amount_original__c {
    type: number
    sql: ${TABLE}.expert_community_amount_original__c ;;
  }

  dimension: fc_challenge_spend__c {
    type: number
    sql: ${TABLE}.fc_challenge_spend__c ;;
  }

  dimension: fc_expert_services__c {
    type: number
    sql: ${TABLE}.fc_expert_services__c ;;
  }

  dimension: fc_license_fee__c {
    type: number
    sql: ${TABLE}.fc_license_fee__c ;;
  }

  dimension: fc_product_fee__c {
    type: number
    sql: ${TABLE}.fc_product_fee__c ;;
  }

  dimension_group: first_forecast_date__c {
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

  dimension: first_product_of_intereset__c {
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

  dimension: fix_bid_project_link__c {
    type: string
    sql: ${TABLE}.fix_bid_project_link__c ;;
  }

  dimension: forecast_alert__c {
    type: string
    sql: ${TABLE}.forecast_alert__c ;;
  }

  dimension: forecast_status_image__c {
    type: string
    sql: ${TABLE}.forecast_status_image__c ;;
  }

  dimension: forecastcategory {
    type: string
    sql: ${TABLE}.forecastcategory ;;
  }

  dimension: forecastcategoryname {
    type: string
    sql: ${TABLE}.forecastcategoryname ;;
  }

  dimension: geo__c {
    type: string
    sql: ${TABLE}.geo__c ;;
  }

  dimension: has_resource_request_dnu__c {
    type: yesno
    sql: ${TABLE}.has_resource_request_dnu__c ;;
  }

  dimension: has_resource_requests__c {
    type: yesno
    sql: ${TABLE}.has_resource_requests__c ;;
  }

  dimension: hasopenactivity {
    type: yesno
    sql: ${TABLE}.hasopenactivity ;;
  }

  dimension: hasopportunitylineitem {
    type: yesno
    sql: ${TABLE}.hasopportunitylineitem ;;
  }

  dimension: hasoverduetask {
    type: yesno
    sql: ${TABLE}.hasoverduetask ;;
  }

  dimension: hours_emea__c {
    type: number
    sql: ${TABLE}.hours_emea__c ;;
  }

  dimension: hours_jaipur__c {
    type: number
    sql: ${TABLE}.hours_jaipur__c ;;
  }

  dimension: hours_japan__c {
    type: number
    sql: ${TABLE}.hours_japan__c ;;
  }

  dimension: hours_total__c {
    type: number
    sql: ${TABLE}.hours_total__c ;;
  }

  dimension: hours_u_s__c {
    type: number
    sql: ${TABLE}.hours_u_s__c ;;
  }

  dimension: hours_u_s_indianapolis__c {
    type: number
    sql: ${TABLE}.hours_u_s_indianapolis__c ;;
  }

  dimension: hours_u_s_strategy__c {
    type: number
    sql: ${TABLE}.hours_u_s_strategy__c ;;
  }

  dimension: indirect_account_name__c {
    type: string
    sql: ${TABLE}.indirect_account_name__c ;;
  }

  dimension: inside_sales_rep__c {
    type: string
    sql: ${TABLE}.inside_sales_rep__c ;;
  }

  dimension: inside_sales_rep_name__c {
    type: string
    sql: ${TABLE}.inside_sales_rep_name__c ;;
  }

  dimension: internal_notes__c {
    type: string
    sql: ${TABLE}.internal_notes__c ;;
  }

  dimension: invoice_contact_email__c {
    type: string
    sql: ${TABLE}.invoice_contact_email__c ;;
  }

  dimension: invoice_contact_name__c {
    type: string
    sql: ${TABLE}.invoice_contact_name__c ;;
  }

  dimension: invoice_ninja_client_id__c {
    type: number
    value_format_name: id
    sql: ${TABLE}.invoice_ninja_client_id__c ;;
  }

  dimension: is_smb__c {
    type: yesno
    sql: ${TABLE}.is_smb__c ;;
  }

  dimension: isclosed {
    type: yesno
    sql: ${TABLE}.isclosed ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: isprivate {
    type: yesno
    sql: ${TABLE}.isprivate ;;
  }

  dimension: issplit {
    type: yesno
    sql: ${TABLE}.issplit ;;
  }

  dimension: iswon {
    type: yesno
    sql: ${TABLE}.iswon ;;
  }

  dimension: last_completed_item__c {
    type: string
    sql: ${TABLE}.last_completed_item__c ;;
  }

  dimension_group: lastactivitydate {
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

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}.lastmodifiedbyid ;;
  }

  dimension_group: lastmodifieddate {
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

  dimension_group: lastreferenceddate {
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

  dimension_group: lastvieweddate {
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

  dimension: leadsource {
    type: string
    sql: ${TABLE}.leadsource ;;
  }

  dimension: legacy_id__c {
    type: string
    sql: ${TABLE}.legacy_id__c ;;
  }

  dimension: legacy_link__c {
    type: string
    sql: ${TABLE}.legacy_link__c ;;
  }

  dimension: legacy_system__c {
    type: string
    sql: ${TABLE}.legacy_system__c ;;
  }

  dimension: loss_description__c {
    type: string
    sql: ${TABLE}.loss_description__c ;;
  }

  dimension: loss_reason__c {
    type: string
    sql: ${TABLE}.loss_reason__c ;;
  }

  dimension: maincompetitor__c {
    type: string
    sql: ${TABLE}.maincompetitor__c ;;
  }

  dimension: marketing_influenced__c {
    type: yesno
    sql: ${TABLE}.marketing_influenced__c ;;
  }

  dimension: marketing_sourced__c {
    type: yesno
    sql: ${TABLE}.marketing_sourced__c ;;
  }

  dimension: master_opportunity__c {
    type: string
    sql: ${TABLE}.master_opportunity__c ;;
  }

  dimension: milestone_on_critical_path__c {
    type: string
    sql: ${TABLE}.milestone_on_critical_path__c ;;
  }

  dimension: multi_year_contract__c {
    type: yesno
    sql: ${TABLE}.multi_year_contract__c ;;
  }


  dimension: name_geo__c {
    type: string
    sql: ${TABLE}.name_geo__c ;;
  }

  dimension: new_or_follow_on__c {
    type: string
    sql: ${TABLE}.new_or_follow_on__c ;;
  }

  dimension: next_pending_item__c {
    type: string
    sql: ${TABLE}.next_pending_item__c ;;
  }

  dimension: next_qtr_amount_weighted__c {
    type: number
    sql: ${TABLE}.next_qtr_amount_weighted__c ;;
  }

  dimension: next_quarter_unweighted__c {
    type: number
    sql: ${TABLE}.next_quarter_unweighted__c ;;
  }

  dimension_group: next_step_date__c {
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

  dimension: nextstep {
    type: string
    sql: ${TABLE}.nextstep ;;
  }

  dimension: no_bill_project_link__c {
    type: string
    sql: ${TABLE}.no_bill_project_link__c ;;
  }

  dimension: no_of_resource_requests__c {
    type: number
    sql: ${TABLE}.no_of_resource_requests__c ;;
  }

  dimension: no_ppw_required__c {
    type: yesno
    sql: ${TABLE}.no_ppw_required__c ;;
  }

  dimension: num_line_items_consulting_services__c {
    type: number
    sql: ${TABLE}.num_line_items_consulting_services__c ;;
  }

  dimension: number_of_seats__c {
    type: number
    sql: ${TABLE}.number_of_seats__c ;;
  }

  dimension: onsite_requirements__c {
    type: string
    sql: ${TABLE}.onsite_requirements__c ;;
  }

  dimension: open_items__c {
    type: string
    sql: ${TABLE}.open_items__c ;;
  }

  dimension: opportunity_count_100_200_this_qtr__c {
    type: number
    sql: ${TABLE}.opportunity_count_100_200_this_qtr__c ;;
  }

  dimension: opportunity_count_100k_less_this_qtr__c {
    type: number
    sql: ${TABLE}.opportunity_count_100k_less_this_qtr__c ;;
  }

  dimension: opportunity_count_250k_this_qtr__c {
    type: number
    sql: ${TABLE}.opportunity_count_250k_this_qtr__c ;;
  }

  dimension: opportunity_owner_active__c {
    type: yesno
    sql: ${TABLE}.opportunity_owner_active__c ;;
  }

  dimension: opportunity_owner_s_role_in_hierarchy__c {
    type: string
    sql: ${TABLE}.opportunity_owner_s_role_in_hierarchy__c ;;
  }

  dimension_group: opportunity_stage_min_change_date__c {
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

  dimension: order_number__c {
    type: string
    sql: ${TABLE}.order_number__c ;;
  }

  dimension: our_value_to_partner__c {
    type: string
    sql: ${TABLE}.our_value_to_partner__c ;;
  }

  dimension: outcome_amount__c {
    type: number
    sql: ${TABLE}.outcome_amount__c ;;
  }

  dimension: outcome_amount_original__c {
    type: number
    sql: ${TABLE}.outcome_amount_original__c ;;
  }

  dimension: owner_name__c {
    type: string
    sql: ${TABLE}.owner_name__c ;;
  }

  dimension: owner_s_manager_at_time_of_deal__c {
    type: string
    sql: ${TABLE}.owner_s_manager_at_time_of_deal__c ;;
  }

  dimension: owner_tenure__c {
    type: number
    sql: ${TABLE}.owner_tenure__c ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}.ownerid ;;
  }

  dimension: parent_project__c {
    type: string
    sql: ${TABLE}.parent_project__c ;;
  }

  dimension: parent_project_link__c {
    type: string
    sql: ${TABLE}.parent_project_link__c ;;
  }

  dimension: partner_credit_type__c {
    type: string
    sql: ${TABLE}.partner_credit_type__c ;;
  }

  dimension: partner_driven__c {
    type: yesno
    sql: ${TABLE}.partner_driven__c ;;
  }

  dimension: partner_opportunity_amount__c {
    type: number
    sql: ${TABLE}.partner_opportunity_amount__c ;;
  }

  dimension: percent_hours_jaipur__c {
    type: string
    sql: ${TABLE}.percent_hours_jaipur__c ;;
  }

  dimension: percentage_covered_by_resource_requests__c {
    type: string
    sql: ${TABLE}.percentage_covered_by_resource_requests__c ;;
  }

  dimension: potential_sale_value__c {
    type: string
    sql: ${TABLE}.potential_sale_value__c ;;
  }

  dimension: potentialfollowon__c {
    type: string
    sql: ${TABLE}.potentialfollowon__c ;;
  }

  dimension: pre_pay__c {
    type: string
    sql: ${TABLE}.pre_pay__c ;;
  }

  dimension: previous_quarter_closed__c {
    type: number
    sql: ${TABLE}.previous_quarter_closed__c ;;
  }

  dimension: pricebook2id {
    type: string
    sql: ${TABLE}.pricebook2id ;;
  }

  dimension: pricingmethod__c {
    type: string
    sql: ${TABLE}.pricingmethod__c ;;
  }

  dimension: product_driven__c {
    type: yesno
    sql: ${TABLE}.product_driven__c ;;
  }

  dimension: product_list__c {
    type: string
    sql: ${TABLE}.product_list__c ;;
  }

  dimension: product_list_ids__c {
    type: string
    sql: ${TABLE}.product_list_ids__c ;;
  }

  dimension: product_list_names__c {
    type: string
    sql: ${TABLE}.product_list_names__c ;;
  }

  dimension: project_1__c {
    type: string
    sql: ${TABLE}.project_1__c ;;
  }

  dimension: project_2__c {
    type: string
    sql: ${TABLE}.project_2__c ;;
  }

  dimension: project_3__c {
    type: string
    sql: ${TABLE}.project_3__c ;;
  }

  dimension: project_exists__c {
    type: yesno
    sql: ${TABLE}.project_exists__c ;;
  }

  dimension: purchas__c {
    type: string
    sql: ${TABLE}.purchas__c ;;
  }

  dimension: purchase_contact_email__c {
    type: string
    sql: ${TABLE}.purchase_contact_email__c ;;
  }

  dimension: purchase_order__c {
    type: string
    sql: ${TABLE}.purchase_order__c ;;
  }

  dimension: purchase_order_required__c {
    type: string
    sql: ${TABLE}.purchase_order_required__c ;;
  }

  dimension: purchasing_contact__c {
    type: string
    sql: ${TABLE}.purchasing_contact__c ;;
  }

  dimension: quarter_booked_q1_q2_q3_q4__c {
    type: string
    sql: ${TABLE}.quarter_booked_q1_q2_q3_q4__c ;;
  }

  dimension: renewal_increase_percent__c {
    type: string
    sql: ${TABLE}.renewal_increase_percent__c ;;
  }

  dimension: reporting_account__c {
    type: string
    sql: ${TABLE}.reporting_account__c ;;
  }

  dimension: reporting_industry__c {
    type: string
    sql: ${TABLE}.reporting_industry__c ;;
  }

  dimension: reporting_sbu__c {
    type: string
    sql: ${TABLE}.reporting_sbu__c ;;
  }

  dimension: reviewed_by_finance_ops__c {
    type: yesno
    sql: ${TABLE}.reviewed_by_finance_ops__c ;;
  }

  dimension: reviewed_by_rev_rec_team__c {
    type: yesno
    sql: ${TABLE}.reviewed_by_rev_rec_team__c ;;
  }

  dimension: roi_analysis_completed__c {
    type: yesno
    sql: ${TABLE}.roi_analysis_completed__c ;;
  }

  dimension: sales_geography__c {
    type: string
    sql: ${TABLE}.sales_geography__c ;;
  }

  dimension: sales_partner__c {
    type: string
    sql: ${TABLE}.sales_partner__c ;;
  }

  dimension: sales_partner_account__c {
    type: string
    sql: ${TABLE}.sales_partner_account__c ;;
  }

  dimension: seat_description__c {
    type: string
    sql: ${TABLE}.seat_description__c ;;
  }

  dimension: second_product_of_interest__c {
    type: string
    sql: ${TABLE}.second_product_of_interest__c ;;
  }

  dimension: self_service_amount_converted__c {
    type: number
    sql: ${TABLE}.self_service_amount_converted__c ;;
  }

  dimension: smartsheet_id__c {
    type: string
    sql: ${TABLE}.smartsheet_id__c ;;
  }

  dimension: special_terms_conditions__c {
    type: string
    sql: ${TABLE}.special_terms_conditions__c ;;
  }

  dimension: staffing_lead_time__c {
    type: number
    sql: ${TABLE}.staffing_lead_time__c ;;
  }

  dimension: staffing_requirements__c {
    type: string
    sql: ${TABLE}.staffing_requirements__c ;;
  }

  dimension: stage_before_loss__c {
    type: string
    sql: ${TABLE}.stage_before_loss__c ;;
  }

  dimension: stagename {
    type: string
    sql: ${TABLE}.stagename ;;
  }

  dimension: sub_opportunity__c {
    type: yesno
    sql: ${TABLE}.sub_opportunity__c ;;
  }

  dimension: subcontracting_end_customer__c {
    type: string
    sql: ${TABLE}.subcontracting_end_customer__c ;;
  }

  dimension: subcontracting_end_customer_industry__c {
    type: string
    sql: ${TABLE}.subcontracting_end_customer_industry__c ;;
  }

  dimension: subcontracting_end_customer_type__c {
    type: string
    sql: ${TABLE}.subcontracting_end_customer_type__c ;;
  }

  dimension: subcontracting_end_customer_vertical__c {
    type: string
    sql: ${TABLE}.subcontracting_end_customer_vertical__c ;;
  }

  dimension: subcontracting_end_customr_topcoderprtnr__c {
    type: string
    sql: ${TABLE}.subcontracting_end_customr_topcoderprtnr__c ;;
  }

  dimension: subcontracting_sbu__c {
    type: string
    sql: ${TABLE}.subcontracting_sbu__c ;;
  }

  dimension: subcontracting_tier__c {
    type: string
    sql: ${TABLE}.subcontracting_tier__c ;;
  }

  dimension: subscription__c {
    type: string
    sql: ${TABLE}.subscription__c ;;
  }

  dimension: subscription_amount__c {
    type: number
    sql: ${TABLE}.subscription_amount__c ;;
  }

  dimension: subscription_level__c {
    type: string
    sql: ${TABLE}.subscription_level__c ;;
  }

  dimension: survey_status_nps__c {
    type: string
    sql: ${TABLE}.survey_status_nps__c ;;
  }

  dimension_group: systemmodstamp {
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

  dimension: t_m_project_link__c {
    type: string
    sql: ${TABLE}.t_m_project_link__c ;;
  }

  dimension_group: target_ppw_date__c {
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

  dimension: tc_connect_description__c {
    type: string
    sql: ${TABLE}.tc_connect_description__c ;;
  }

  dimension: tc_connect_direct_project_id__c {
    type: string
    sql: ${TABLE}.tc_connect_direct_project_id__c ;;
  }

  dimension: tc_connect_project_id__c {
    type: string
    sql: ${TABLE}.tc_connect_project_id__c ;;
  }

  dimension: tc_connect_project_id_formula__c {
    type: string
    sql: ${TABLE}.tc_connect_project_id_formula__c ;;
  }

  dimension: thank_yous__c {
    type: string
    sql: ${TABLE}.thank_yous__c ;;
  }

  dimension: third_product_of_interest__c {
    type: string
    sql: ${TABLE}.third_product_of_interest__c ;;
  }

  dimension: this_quarter_unweighted__c {
    type: number
    sql: ${TABLE}.this_quarter_unweighted__c ;;
  }

  dimension: this_quarter_weighted_pipeline__c {
    type: number
    sql: ${TABLE}.this_quarter_weighted_pipeline__c ;;
  }

  dimension: total_community_challenge_fees__c {
    type: number
    sql: ${TABLE}.total_community_challenge_fees__c ;;
  }

  dimension: total_community_challenge_memberpayments__c {
    type: number
    sql: ${TABLE}.total_community_challenge_memberpayments__c ;;
  }

  dimension: total_community_expert_services__c {
    type: number
    sql: ${TABLE}.total_community_expert_services__c ;;
  }

  dimension: total_community_license__c {
    type: number
    sql: ${TABLE}.total_community_license__c ;;
  }

  dimension: total_expenses__c {
    type: number
    sql: ${TABLE}.total_expenses__c ;;
  }

  dimension: total_hours_from_resource_requests__c {
    type: number
    sql: ${TABLE}.total_hours_from_resource_requests__c ;;
  }

  dimension: total_num_of_line_items__c {
    type: number
    sql: ${TABLE}.total_num_of_line_items__c ;;
  }

  dimension: total_potential_user__c {
    type: string
    sql: ${TABLE}.total_potential_user__c ;;
  }

  dimension: touch__c {
    type: yesno
    sql: ${TABLE}.touch__c ;;
  }

  dimension: trace_opportunity_number__c {
    type: string
    sql: ${TABLE}.trace_opportunity_number__c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: type__c {
    type: string
    sql: ${TABLE}.type__c ;;
  }

  dimension: unbooked_capacity__c {
    type: number
    sql: ${TABLE}.unbooked_capacity__c ;;
  }

  dimension: wbs_code__c {
    type: string
    sql: ${TABLE}.wbs_code__c ;;
  }

  dimension: which_stage__c {
    type: string
    sql: ${TABLE}.which_stage__c ;;
  }

  dimension: won_lost_open__c {
    type: string
    sql: ${TABLE}.won_lost_open__c ;;
  }

  dimension: year_in_current_contract__c {
    type: string
    sql: ${TABLE}.year_in_current_contract__c ;;
  }


  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
