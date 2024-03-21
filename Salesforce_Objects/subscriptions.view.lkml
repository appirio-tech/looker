# The name of this view in Looker is "Subscriptions"
view: subscriptions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: segment_tc_salesforce.subscriptions ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account C" in Explore.

  dimension: account_c {
    type: string
    sql: ${TABLE}.account_c ;;
  }

  dimension: all_services_in_one_project_c {
    type: string
    sql: ${TABLE}.all_services_in_one_project_c ;;
  }

  dimension: amount_c {
    type: string
    sql: ${TABLE}.amount_c ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: auto_close_date_c {
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
    sql: ${TABLE}.auto_close_date_c ;;
  }

  dimension: backlog_challenge_spend_c {
    type: string
    sql: ${TABLE}.backlog_challenge_spend_c ;;
  }

  dimension: backlog_expert_services_c {
    type: string
    sql: ${TABLE}.backlog_expert_services_c ;;
  }

  dimension: challenge_budget_rate_c {
    type: string
    sql: ${TABLE}.challenge_budget_rate_c ;;
  }

  dimension: challenge_spend_c {
    type: string
    sql: ${TABLE}.challenge_spend_c ;;
  }

  dimension: challenge_spend_in_project_closed_c {
    type: string
    sql: ${TABLE}.challenge_spend_in_project_closed_c ;;
  }

  dimension: challenge_spend_in_projects_closed_open_c {
    type: string
    sql: ${TABLE}.challenge_spend_in_projects_closed_open_c ;;
  }

  dimension: challenge_spend_in_projects_opened_c {
    type: string
    sql: ${TABLE}.challenge_spend_in_projects_opened_c ;;
  }

  dimension: consider_unbooked_capacity_c {
    type: string
    sql: ${TABLE}.consider_unbooked_capacity_c ;;
  }

  dimension: consulting_ops_comments_c {
    type: string
    sql: ${TABLE}.consulting_ops_comments_c ;;
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

  dimension: customer_success_segment_c {
    type: string
    sql: ${TABLE}.customer_success_segment_c ;;
  }

  dimension: default_subscription_c {
    type: string
    sql: ${TABLE}.default_subscription_c ;;
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

  dimension: engagement_offering_type_c {
    type: string
    sql: ${TABLE}.engagement_offering_type_c ;;
  }

  dimension: expense_amount_c {
    type: string
    sql: ${TABLE}.expense_amount_c ;;
  }

  dimension: expenses_in_project_closed_c {
    type: string
    sql: ${TABLE}.expenses_in_project_closed_c ;;
  }

  dimension: expert_services_c {
    type: string
    sql: ${TABLE}.expert_services_c ;;
  }

  dimension: is_closed_c {
    type: string
    sql: ${TABLE}.is_closed_c ;;
  }

  dimension: is_credit_card_payment_c {
    type: string
    sql: ${TABLE}.is_credit_card_payment_c ;;
  }

  dimension: is_deleted {
    type: string
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_inter_company_c {
    type: string
    sql: ${TABLE}.is_inter_company_c ;;
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

  dimension_group: last_project_closed_date_c {
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
    sql: ${TABLE}.last_project_closed_date_c ;;
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

  dimension: license_fee_c {
    type: string
    sql: ${TABLE}.license_fee_c ;;
  }

  dimension: markup_c {
    type: string
    sql: ${TABLE}.markup_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: new_customer_c {
    type: string
    sql: ${TABLE}.new_customer_c ;;
  }

  dimension: newest_attached_opportunity_c {
    type: string
    sql: ${TABLE}.newest_attached_opportunity_c ;;
  }

  dimension: opportunity_c {
    type: string
    sql: ${TABLE}.opportunity_c ;;
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

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: reporting_account_c {
    type: string
    sql: ${TABLE}.reporting_account_c ;;
  }

  dimension: reporting_account_owner_c {
    type: string
    sql: ${TABLE}.reporting_account_owner_c ;;
  }

  dimension: reporting_industry_c {
    type: string
    sql: ${TABLE}.reporting_industry_c ;;
  }

  dimension: reporting_smu_c {
    type: string
    sql: ${TABLE}.reporting_smu_c ;;
  }

  dimension: reporting_sub_c {
    type: string
    sql: ${TABLE}.reporting_sub_c ;;
  }

  dimension: revenue_count_as_c {
    type: string
    sql: ${TABLE}.revenue_count_as_c ;;
  }

  dimension: services_in_project_closed_c {
    type: string
    sql: ${TABLE}.services_in_project_closed_c ;;
  }

  dimension: services_in_projects_closed_open_c {
    type: string
    sql: ${TABLE}.services_in_projects_closed_open_c ;;
  }

  dimension: services_in_projects_opened_c {
    type: string
    sql: ${TABLE}.services_in_projects_opened_c ;;
  }

  dimension: spoc_c {
    type: string
    sql: ${TABLE}.spoc_c ;;
  }

  dimension: spoc_name_c {
    type: string
    sql: ${TABLE}.spoc_name_c ;;
  }

  dimension: spoc_name_formula_c {
    type: string
    sql: ${TABLE}.spoc_name_formula_c ;;
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

  dimension: subcontracting_end_customer_c {
    type: string
    sql: ${TABLE}.subcontracting_end_customer_c ;;
  }

  dimension: subscription_18_id_c {
    type: string
    sql: ${TABLE}.subscription_18_id_c ;;
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

  dimension: topcoder_customer_tier_c {
    type: string
    sql: ${TABLE}.topcoder_customer_tier_c ;;
  }

  dimension: total_budget_in_projects_closed_open_c {
    type: string
    sql: ${TABLE}.total_budget_in_projects_closed_open_c ;;
  }

  dimension: total_budget_in_projects_open_c {
    type: string
    sql: ${TABLE}.total_budget_in_projects_open_c ;;
  }

  dimension: total_sponsorship_c {
    type: string
    sql: ${TABLE}.total_sponsorship_c ;;
  }

  dimension: unbooked_capacity_c {
    type: string
    sql: ${TABLE}.unbooked_capacity_c ;;
  }

  dimension: unplanned_challenge_spend_c {
    type: string
    sql: ${TABLE}.unplanned_challenge_spend_c ;;
  }

  dimension: unplanned_challenge_spend_closed_open_c {
    type: string
    sql: ${TABLE}.unplanned_challenge_spend_closed_open_c ;;
  }

  dimension: unplanned_expert_services_c {
    type: string
    sql: ${TABLE}.unplanned_expert_services_c ;;
  }

  dimension: unplanned_expert_services_closed_open_c {
    type: string
    sql: ${TABLE}.unplanned_expert_services_closed_open_c ;;
  }

  dimension: unplanned_total_c {
    type: string
    sql: ${TABLE}.unplanned_total_c ;;
  }

  dimension: unplanned_total_in_projects_closed_open_c {
    type: string
    sql: ${TABLE}.unplanned_total_in_projects_closed_open_c ;;
  }

  dimension: unplanned_wipro_services_c {
    type: string
    sql: ${TABLE}.unplanned_wipro_services_c ;;
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

  dimension: wipro_services_c {
    type: string
    sql: ${TABLE}.wipro_services_c ;;
  }

  dimension: wipro_services_in_projects_closed_c {
    type: string
    sql: ${TABLE}.wipro_services_in_projects_closed_c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
