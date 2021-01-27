view: salesforce_segment_accounts {
  sql_table_name: segment_tc_salesforce.accounts ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_nick_name_c {
    type: string
    sql: ${TABLE}.account_nick_name_c ;;
  }

  dimension: account_number {
    type: string
    sql: ${TABLE}.account_number ;;
  }

  dimension: account_s_competitors_c {
    type: string
    sql: ${TABLE}.account_s_competitors_c ;;
  }

  dimension: account_source {
    type: string
    sql: ${TABLE}.account_source ;;
  }

  dimension: annual_revenue {
    type: string
    sql: ${TABLE}.annual_revenue ;;
  }

  dimension: billing_city {
    type: string
    sql: ${TABLE}.billing_city ;;
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}.billing_country ;;
  }

  dimension: billing_postal_code {
    type: string
    sql: ${TABLE}.billing_postal_code ;;
  }

  dimension: billing_state {
    type: string
    sql: ${TABLE}.billing_state ;;
  }

  dimension: billing_street {
    type: string
    sql: ${TABLE}.billing_street ;;
  }

  dimension: business_associate_agreement_c {
    type: string
    sql: ${TABLE}.business_associate_agreement_c ;;
  }

  dimension: cloudsourcing_priority_c {
    type: string
    sql: ${TABLE}.cloudsourcing_priority_c ;;
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

  dimension: customer_number_c {
    type: string
    sql: ${TABLE}.customer_number_c ;;
  }

  dimension: customer_segment_c {
    type: string
    sql: ${TABLE}.customer_segment_c ;;
  }

  dimension: customer_story_c {
    type: string
    sql: ${TABLE}.customer_story_c ;;
  }

  dimension_group: date_of_first_win_c {
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
    sql: ${TABLE}.date_of_first_win_c ;;
  }

  dimension_group: date_of_last_won_opportunity_c {
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
    sql: ${TABLE}.date_of_last_won_opportunity_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: enterprise_customer_c {
    type: string
    sql: ${TABLE}.enterprise_customer_c ;;
  }

  dimension: est_annual_consulting_budget_c {
    type: string
    sql: ${TABLE}.est_annual_consulting_budget_c ;;
  }

  dimension: executive_sponsor_c {
    type: string
    sql: ${TABLE}.executive_sponsor_c ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: fiscal_year_begins_month_c {
    type: string
    sql: ${TABLE}.fiscal_year_begins_month_c ;;
  }

  dimension: gcp_c {
    type: string
    sql: ${TABLE}.gcp_c ;;
  }

  dimension: geo_c {
    type: string
    sql: ${TABLE}.geo_c ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: inside_sales_notes_c {
    type: string
    sql: ${TABLE}.inside_sales_notes_c ;;
  }

  dimension: is_deleted {
    type: string
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: jigsaw {
    type: string
    sql: ${TABLE}.jigsaw ;;
  }

  dimension: jigsaw_company_id {
    type: string
    sql: ${TABLE}.jigsaw_company_id ;;
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

  dimension: latitude_c {
    type: number
    sql: ${TABLE}.latitude_c ;;
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

  dimension: log_api_c {
    type: string
    sql: ${TABLE}.log_api_c ;;
  }

  dimension: logo_c {
    type: string
    sql: ${TABLE}.logo_c ;;
  }

  dimension: logo_image_id_c {
    type: string
    sql: ${TABLE}.logo_image_id_c ;;
  }

  dimension: logo_referenceable_c {
    type: string
    sql: ${TABLE}.logo_referenceable_c ;;
  }

  dimension: longitude_c {
    type: number
    sql: ${TABLE}.longitude_c ;;
  }

  dimension: marketing_status_c {
    type: string
    sql: ${TABLE}.marketing_status_c ;;
  }

  dimension: months_since_first_win_c {
    type: number
    sql: ${TABLE}.months_since_first_win_c ;;
  }

  dimension: months_since_last_win_c {
    type: number
    sql: ${TABLE}.months_since_last_win_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: name_in_appirio_c {
    type: string
    sql: ${TABLE}.name_in_appirio_c ;;
  }

  dimension: new_vs_existing_c {
    type: string
    sql: ${TABLE}.new_vs_existing_c ;;
  }

  dimension: no_of_employees_picklist_c {
    type: string
    sql: ${TABLE}.no_of_employees_picklist_c ;;
  }

  dimension: num_active_projects_c {
    type: number
    sql: ${TABLE}.num_active_projects_c ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: number_of_open_opportunities_c {
    type: number
    sql: ${TABLE}.number_of_open_opportunities_c ;;
  }

  dimension: number_of_won_opportunities_c {
    type: number
    sql: ${TABLE}.number_of_won_opportunities_c ;;
  }

  dimension: number_of_won_smb_opportunities_c {
    type: number
    sql: ${TABLE}.number_of_won_smb_opportunities_c ;;
  }

  dimension: opportunity_prefix_c {
    type: string
    sql: ${TABLE}.opportunity_prefix_c ;;
  }

  dimension: owner_active_c {
    type: string
    sql: ${TABLE}.owner_active_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: owner_name_c {
    type: string
    sql: ${TABLE}.owner_name_c ;;
  }

  dimension: ownership {
    type: string
    sql: ${TABLE}.ownership ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id ;;
  }

  dimension: partner_market_segment_c {
    type: string
    sql: ${TABLE}.partner_market_segment_c ;;
  }

  dimension: partner_status_c {
    type: string
    sql: ${TABLE}.partner_status_c ;;
  }

  dimension: partner_type_c {
    type: string
    sql: ${TABLE}.partner_type_c ;;
  }

  dimension: payment_terms_c {
    type: string
    sql: ${TABLE}.payment_terms_c ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: powered_by_account_c {
    type: string
    sql: ${TABLE}.powered_by_account_c ;;
  }

  dimension: publicly_referenceable_c {
    type: string
    sql: ${TABLE}.publicly_referenceable_c ;;
  }

  dimension: purchase_order_required_c {
    type: string
    sql: ${TABLE}.purchase_order_required_c ;;
  }

  dimension: purchased_products_c {
    type: string
    sql: ${TABLE}.purchased_products_c ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}.rating ;;
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

  dimension: referenceable_c {
    type: string
    sql: ${TABLE}.referenceable_c ;;
  }

  dimension: region_c {
    type: string
    sql: ${TABLE}.region_c ;;
  }

  dimension: shipping_city {
    type: string
    sql: ${TABLE}.shipping_city ;;
  }

  dimension: shipping_country {
    type: string
    sql: ${TABLE}.shipping_country ;;
  }

  dimension: shipping_postal_code {
    type: string
    sql: ${TABLE}.shipping_postal_code ;;
  }

  dimension: shipping_state {
    type: string
    sql: ${TABLE}.shipping_state ;;
  }

  dimension: shipping_street {
    type: string
    sql: ${TABLE}.shipping_street ;;
  }

  dimension: sic {
    type: string
    sql: ${TABLE}.sic ;;
  }

  dimension: sic_desc {
    type: string
    sql: ${TABLE}.sic_desc ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  dimension: special_contract_clauses_c {
    type: string
    sql: ${TABLE}.special_contract_clauses_c ;;
  }

  dimension: spoc_c {
    type: string
    sql: ${TABLE}.spoc_c ;;
  }

  dimension: sub_industry_c {
    type: string
    sql: ${TABLE}.sub_industry_c ;;
  }

  dimension: subscription_count_c {
    type: number
    sql: ${TABLE}.subscription_count_c ;;
  }

  dimension: subscription_level_c {
    type: string
    sql: ${TABLE}.subscription_level_c ;;
  }

  dimension_group: subscription_level_expiration_c {
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
    sql: ${TABLE}.subscription_level_expiration_c ;;
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

  dimension: text_sbu_c {
    type: string
    sql: ${TABLE}.text_sbu_c ;;
  }

  dimension: ticker_symbol {
    type: string
    sql: ${TABLE}.ticker_symbol ;;
  }

  dimension: topcoder_client_id_c {
    type: string
    sql: ${TABLE}.topcoder_client_id_c ;;
  }

  dimension: topcoder_client_id_formula_c {
    type: string
    sql: ${TABLE}.topcoder_client_id_formula_c ;;
  }

  dimension: topcoder_customer_tier_c {
    type: string
    sql: ${TABLE}.topcoder_customer_tier_c ;;
  }

  dimension: topcoder_partner_c {
    type: string
    sql: ${TABLE}.topcoder_partner_c ;;
  }

  dimension: total_bookings_usd_c {
    type: number
    sql: ${TABLE}.total_bookings_usd_c ;;
  }

  dimension: trace_account_category_c {
    type: string
    sql: ${TABLE}.trace_account_category_c ;;
  }

  dimension: trace_account_name_c {
    type: string
    sql: ${TABLE}.trace_account_name_c ;;
  }

  dimension: trace_account_number_c {
    type: string
    sql: ${TABLE}.trace_account_number_c ;;
  }

  dimension: trace_account_type_c {
    type: string
    sql: ${TABLE}.trace_account_type_c ;;
  }

  dimension: trace_classification_c {
    type: string
    sql: ${TABLE}.trace_classification_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: ultimate_parent_account_c {
    type: string
    sql: ${TABLE}.ultimate_parent_account_c ;;
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

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: website_customer_c {
    type: string
    sql: ${TABLE}.website_customer_c ;;
  }

  dimension: wipro_account_vertical_c {
    type: string
    sql: ${TABLE}.wipro_account_vertical_c ;;
  }

  dimension: wipro_classification_c {
    type: string
    sql: ${TABLE}.wipro_classification_c ;;
  }

  dimension: wipro_sbu_c {
    type: string
    sql: ${TABLE}.wipro_sbu_c ;;
  }

  dimension: wipro_top_300_c {
    type: string
    sql: ${TABLE}.wipro_top_300_c ;;
  }

  dimension: zendesk_create_in_zendesk_c {
    type: string
    sql: ${TABLE}.zendesk_create_in_zendesk_c ;;
  }

  dimension: zendesk_created_updated_flag_c {
    type: string
    sql: ${TABLE}.zendesk_created_updated_flag_c ;;
  }

  dimension: zendesk_zendesk_organization_id_c {
    type: string
    sql: ${TABLE}.zendesk_zendesk_organization_id_c ;;
  }

  dimension: zendesk_zendesk_outof_sync_c {
    type: string
    sql: ${TABLE}.zendesk_zendesk_outof_sync_c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, opportunities.count]
  }
}
