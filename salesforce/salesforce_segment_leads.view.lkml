view: salesforce_segment_leads {
  sql_table_name: segment_tc_salesforce.leads ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_type_c {
    type: string
    sql: ${TABLE}.account_type_c ;;
  }

  dimension: activity_count_c {
    type: number
    sql: ${TABLE}.activity_count_c ;;
  }

  dimension: annual_revenue {
    type: string
    sql: ${TABLE}.annual_revenue ;;
  }

  dimension: autonumber_for_lead_assignment_c {
    type: string
    sql: ${TABLE}.autonumber_for_lead_assignment_c ;;
  }

  dimension: basic_persona_c {
    type: string
    sql: ${TABLE}.basic_persona_c ;;
  }

  dimension: bdr_working_status_c {
    type: string
    sql: ${TABLE}.bdr_working_status_c ;;
  }

  dimension: category_c {
    type: string
    sql: ${TABLE}.category_c ;;
  }

  dimension_group: changed_from_open_on_c {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.changed_from_open_on_c ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension_group: closed_on_c {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.closed_on_c ;;
  }

  dimension: community_member_c {
    type: string
    sql: ${TABLE}.community_member_c ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: company_type_c {
    type: string
    sql: ${TABLE}.company_type_c ;;
  }

  dimension: connect_project_link_c {
    type: string
    sql: ${TABLE}.connect_project_link_c ;;
  }

  dimension: contains_campaign_c {
    type: string
    sql: ${TABLE}.contains_campaign_c ;;
  }

  dimension: converted_account_id {
    type: string
    sql: ${TABLE}.converted_account_id ;;
  }

  dimension: converted_contact_id {
    type: string
    sql: ${TABLE}.converted_contact_id ;;
  }

  dimension_group: converted {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.converted_date ;;
  }

  dimension: converted_opportunity_id {
    type: string
    sql: ${TABLE}.converted_opportunity_id ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.created_date ;;
  }

  dimension: currency_iso_code {
    type: string
    sql: ${TABLE}.currency_iso_code ;;
  }

  dimension_group: date_connect_project_created_c {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.date_connect_project_created_c ;;
  }

  dimension: days_in_current_status_c {
    type: number
    sql: ${TABLE}.days_in_current_status_c ;;
  }

  dimension: days_in_open_status_c {
    type: number
    sql: ${TABLE}.days_in_open_status_c ;;
  }

  dimension: days_to_close_c {
    type: number
    sql: ${TABLE}.days_to_close_c ;;
  }

  dimension: days_to_convert_from_mql_c {
    type: number
    sql: ${TABLE}.days_to_convert_from_mql_c ;;
  }

  dimension: days_to_legitimate_c {
    type: number
    sql: ${TABLE}.days_to_legitimate_c ;;
  }

  dimension: days_to_mql_from_legitimate_c {
    type: number
    sql: ${TABLE}.days_to_mql_from_legitimate_c ;;
  }

  dimension: decison_role_c {
    type: string
    sql: ${TABLE}.decison_role_c ;;
  }

  dimension: department_c {
    type: string
    sql: ${TABLE}.department_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: duplicate_lead_exists_c {
    type: string
    sql: ${TABLE}.duplicate_lead_exists_c ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_body_1_c {
    type: string
    sql: ${TABLE}.email_body_1_c ;;
  }

  dimension: email_body_2_c {
    type: string
    sql: ${TABLE}.email_body_2_c ;;
  }

  dimension: email_body_3_c {
    type: string
    sql: ${TABLE}.email_body_3_c ;;
  }

  dimension_group: email_bounced {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.email_bounced_date ;;
  }

  dimension: email_bounced_reason {
    type: string
    sql: ${TABLE}.email_bounced_reason ;;
  }

  dimension: email_notification_c {
    type: string
    sql: ${TABLE}.email_notification_c ;;
  }

  dimension: email_subject_1_c {
    type: string
    sql: ${TABLE}.email_subject_1_c ;;
  }

  dimension: email_subject_2_c {
    type: string
    sql: ${TABLE}.email_subject_2_c ;;
  }

  dimension: email_subject_3_c {
    type: string
    sql: ${TABLE}.email_subject_3_c ;;
  }

  dimension: email_subscription_c {
    type: string
    sql: ${TABLE}.email_subscription_c ;;
  }

  dimension: enterprise_c {
    type: string
    sql: ${TABLE}.enterprise_c ;;
  }

  dimension: executive_c {
    type: string
    sql: ${TABLE}.executive_c ;;
  }

  dimension: existing_customer_c {
    type: string
    sql: ${TABLE}.existing_customer_c ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: field_for_hubspot_c {
    type: string
    sql: ${TABLE}.field_for_hubspot_c ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gameplan_quote_delivered_c {
    type: string
    sql: ${TABLE}.gameplan_quote_delivered_c ;;
  }

  dimension: gdpr_opt_in_c {
    type: string
    sql: ${TABLE}.gdpr_opt_in_c ;;
  }

  dimension: gdpr_opt_in_text_c {
    type: string
    sql: ${TABLE}.gdpr_opt_in_text_c ;;
  }

  dimension: google_analytics_click_id_c {
    type: string
    sql: ${TABLE}.google_analytics_click_id_c ;;
  }

  dimension: google_analytics_client_id_c {
    type: string
    sql: ${TABLE}.google_analytics_client_id_c ;;
  }

  dimension: has_opted_out_of_email {
    type: string
    sql: ${TABLE}.has_opted_out_of_email ;;
  }

  dimension: hubspot_lifecycle_stage_c {
    type: string
    sql: ${TABLE}.hubspot_lifecycle_stage_c ;;
  }

  dimension: in_connect_c {
    type: string
    sql: ${TABLE}.in_connect_c ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: industry_category_c {
    type: string
    sql: ${TABLE}.industry_category_c ;;
  }

  dimension: inferred_state_c {
    type: string
    sql: ${TABLE}.inferred_state_c ;;
  }

  dimension: insta_page_name_c {
    type: string
    sql: ${TABLE}.insta_page_name_c ;;
  }

  dimension: is_converted {
    type: string
    sql: ${TABLE}.is_converted ;;
  }

  dimension: is_deleted {
    type: string
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_unread_by_owner {
    type: string
    sql: ${TABLE}.is_unread_by_owner ;;
  }

  dimension: jigsaw {
    type: string
    sql: ${TABLE}.jigsaw ;;
  }

  dimension: jigsaw_contact_id {
    type: string
    sql: ${TABLE}.jigsaw_contact_id ;;
  }

  dimension: landing_page_id_c {
    type: string
    sql: ${TABLE}.landing_page_id_c ;;
  }

  dimension_group: last_activity {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.last_activity_date ;;
  }

  dimension: last_campaign_c {
    type: string
    sql: ${TABLE}.last_campaign_c ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension_group: last_status_change_c {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.last_status_change_c ;;
  }

  dimension: lead_action_c {
    type: string
    sql: ${TABLE}.lead_action_c ;;
  }

  dimension: lead_action_status_c {
    type: string
    sql: ${TABLE}.lead_action_status_c ;;
  }

  dimension: lead_age_c {
    type: number
    sql: ${TABLE}.lead_age_c ;;
  }

  dimension: lead_comments_c {
    type: string
    sql: ${TABLE}.lead_comments_c ;;
  }

  dimension: lead_lifetime_c {
    type: number
    sql: ${TABLE}.lead_lifetime_c ;;
  }

  dimension: lead_notes_c {
    type: string
    sql: ${TABLE}.lead_notes_c ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: lead_source_as_text_c {
    type: string
    sql: ${TABLE}.lead_source_as_text_c ;;
  }

  dimension: lead_source_summarised_c {
    type: string
    sql: ${TABLE}.lead_source_summarised_c ;;
  }

  dimension_group: lead_status_change_c {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.lead_status_change_c ;;
  }

  dimension: lead_sub_type_c {
    type: string
    sql: ${TABLE}.lead_sub_type_c ;;
  }

  dimension: lead_type_c {
    type: string
    sql: ${TABLE}.lead_type_c ;;
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

  dimension: legitimate_c {
    type: string
    sql: ${TABLE}.legitimate_c ;;
  }

  dimension_group: legitimate_lead_established_date_c {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.legitimate_lead_established_date_c ;;
  }

  dimension: level_c {
    type: string
    sql: ${TABLE}.level_c ;;
  }

  dimension: linked_in_c {
    type: string
    sql: ${TABLE}.linked_in_c ;;
  }

  dimension: linked_in_url_c {
    type: string
    sql: ${TABLE}.linked_in_url_c ;;
  }

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
  }

  dimension: mc4_sf_mc_subscriber_c {
    type: string
    sql: ${TABLE}.mc4_sf_mc_subscriber_c ;;
  }

  dimension: meeting_scheduled_c {
    type: string
    sql: ${TABLE}.meeting_scheduled_c ;;
  }

  dimension_group: meeting_scheduled_date_c {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.meeting_scheduled_date_c ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: mql_c {
    type: string
    sql: ${TABLE}.mql_c ;;
  }

  dimension_group: mql_established_date_c {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.mql_established_date_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: no_of_employees_c {
    type: string
    sql: ${TABLE}.no_of_employees_c ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: original_source_c {
    type: string
    sql: ${TABLE}.original_source_c ;;
  }

  dimension: original_source_drill_down_1_c {
    type: string
    sql: ${TABLE}.original_source_drill_down_1_c ;;
  }

  dimension: original_source_drill_down_2_c {
    type: string
    sql: ${TABLE}.original_source_drill_down_2_c ;;
  }

  dimension: other_expertise_c {
    type: string
    sql: ${TABLE}.other_expertise_c ;;
  }

  dimension: other_lifecycle_detail_c {
    type: string
    sql: ${TABLE}.other_lifecycle_detail_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: owner_name_c {
    type: string
    sql: ${TABLE}.owner_name_c ;;
  }

  dimension: partner_referral_account_c {
    type: string
    sql: ${TABLE}.partner_referral_account_c ;;
  }

  dimension: partner_type_c {
    type: string
    sql: ${TABLE}.partner_type_c ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: primary_campaign_c {
    type: string
    sql: ${TABLE}.primary_campaign_c ;;
  }

  dimension: project_purchase_timeframe_c {
    type: string
    sql: ${TABLE}.project_purchase_timeframe_c ;;
  }

  dimension: qualified_by_c {
    type: string
    sql: ${TABLE}.qualified_by_c ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}.rating ;;
  }

  dimension_group: received {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.received_at ;;
  }

  dimension: ref_code_c {
    type: string
    sql: ${TABLE}.ref_code_c ;;
  }

  dimension: referred_by_rep_name_c {
    type: string
    sql: ${TABLE}.referred_by_rep_name_c ;;
  }

  dimension: referred_lead_to_c {
    type: string
    sql: ${TABLE}.referred_lead_to_c ;;
  }

  dimension: region_c {
    type: string
    sql: ${TABLE}.region_c ;;
  }

  dimension: response_time_c {
    type: number
    sql: ${TABLE}.response_time_c ;;
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}.salutation ;;
  }

  dimension: sequence_scheduled_c {
    type: string
    sql: ${TABLE}.sequence_scheduled_c ;;
  }

  dimension: skype_c {
    type: string
    sql: ${TABLE}.skype_c ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}.suffix ;;
  }

  dimension: suspect_status_c {
    type: string
    sql: ${TABLE}.suspect_status_c ;;
  }

  dimension_group: system_modstamp {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: tc_connect_budget_c {
    type: string
    sql: ${TABLE}.tc_connect_budget_c ;;
  }

  dimension: tc_connect_budget_type_c {
    type: string
    sql: ${TABLE}.tc_connect_budget_type_c ;;
  }

  dimension: tc_connect_cancel_reason_c {
    type: string
    sql: ${TABLE}.tc_connect_cancel_reason_c ;;
  }

  dimension: tc_connect_deadline_c {
    type: string
    sql: ${TABLE}.tc_connect_deadline_c ;;
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

  dimension: tc_connect_project_status_c {
    type: string
    sql: ${TABLE}.tc_connect_project_status_c ;;
  }

  dimension: tc_connect_project_type_c {
    type: string
    sql: ${TABLE}.tc_connect_project_type_c ;;
  }

  dimension: tc_connect_raw_project_c {
    type: string
    sql: ${TABLE}.tc_connect_raw_project_c ;;
  }

  dimension: tc_connect_when_to_start_c {
    type: string
    sql: ${TABLE}.tc_connect_when_to_start_c ;;
  }

  dimension: tc_handle_c {
    type: string
    sql: ${TABLE}.tc_handle_c ;;
  }

  dimension: technical_expertise_1_c {
    type: string
    sql: ${TABLE}.technical_expertise_1_c ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: twitter_url_c {
    type: string
    sql: ${TABLE}.twitter_url_c ;;
  }

  dimension: updated_by_connect_c {
    type: string
    sql: ${TABLE}.updated_by_connect_c ;;
  }

  dimension: utm_campaign_c {
    type: string
    sql: ${TABLE}.utm_campaign_c ;;
  }

  dimension: utm_medium_c {
    type: string
    sql: ${TABLE}.utm_medium_c ;;
  }

  dimension: utm_source_c {
    type: string
    sql: ${TABLE}.utm_source_c ;;
  }

  dimension_group: uuid_ts {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.uuid_ts ;;
  }

  dimension: web_source_c {
    type: string
    sql: ${TABLE}.web_source_c ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: wipro_owner_c {
    type: string
    sql: ${TABLE}.wipro_owner_c ;;
  }

  dimension: wipro_region_c {
    type: string
    sql: ${TABLE}.wipro_region_c ;;
  }

  dimension: x1_c {
    type: number
    sql: ${TABLE}.x1_c ;;
  }

  dimension: x24_hours_crossed_c {
    type: string
    sql: ${TABLE}.x24_hours_crossed_c ;;
  }

  dimension: yahoo_messenger_c {
    type: string
    sql: ${TABLE}.yahoo_messenger_c ;;
  }

  dimension: zendesk_create_in_zendesk_c {
    type: string
    sql: ${TABLE}.zendesk_create_in_zendesk_c ;;
  }

  dimension: zendesk_is_created_updated_flag_c {
    type: string
    sql: ${TABLE}.zendesk_is_created_updated_flag_c ;;
  }

  dimension: zendesk_notes_c {
    type: string
    sql: ${TABLE}.zendesk_notes_c ;;
  }

  dimension: zendesk_zendesk_outof_sync_c {
    type: string
    sql: ${TABLE}.zendesk_zendesk_outof_sync_c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, middle_name, last_name, name, first_name]
  }
}
