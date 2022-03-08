view: sfdc_forecast {
  sql_table_name: tcs_dw.sfdc_forecast ;;
  drill_fields: [detail*]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account {
    type: string
    sql: ${TABLE}.account__c ;;
  }

  measure: actual_adhoc {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.actual_adhoc__c ;;
  }

  measure: actual_challenge_budget {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.actual_challenge_budget__c ;;
  }

  measure: actual_expert_services {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.actual_expert_services__c ;;
  }

  measure: actual_license_fee {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.actual_license_fee__c ;;
  }

  measure: actual_mftaas {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.actual_mftaas__c ;;
  }

  measure: actual_mis {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.actual_mis__c ;;
  }

  measure: actual_qaas {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.actual_qaas__c ;;
  }

  dimension: adhoc_revenue {
    type: string
    sql: ${TABLE}.adhoc_revenue__c ;;
  }

  dimension: billable {
    type: yesno
    sql: ${TABLE}.billable__c ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category__c ;;
  }

  dimension: daai_ninja {
    type: yesno
    sql: ${TABLE}.daai_ninja__c ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date__c ;;
  }

  dimension: for_taas {
    type: yesno
    sql: ${TABLE}.for_taas__c ;;
  }

  dimension: is_first_month_of_forecast_non_ba {
    type: yesno
    sql: ${TABLE}.is_first_month_of_forecast_non_ba__c ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: non_t_m_services_spend_actual {
    type: number
    sql: ${TABLE}.non_t_m_services_spend_actual__c ;;
  }

  dimension: non_t_m_services_spend_planned {
    type: number
    sql: ${TABLE}.non_t_m_services_spend_planned__c ;;
  }

  dimension: opportunity {
    type: string
    sql: ${TABLE}.opportunity__c ;;
  }

  dimension: opportunity_project_id {
    type: string
    sql: ${TABLE}.opportunity_project_id__c ;;
  }

  dimension: opportunity_project_name {
    type: string
    sql: ${TABLE}.opportunity_project_name__c ;;
  }

  dimension: opportunity_project_taas {
    type: string
    sql: ${TABLE}.opportunity_project_taas__c ;;
  }

  dimension: owner_name {
    type: string
    sql: ${TABLE}.owner_name__c ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id__c ;;
  }

  measure: planned_adhoc {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.planned_adhoc__c ;;
  }

  measure: planned_challenge_budget {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.planned_challenge_budget__c ;;
  }

  measure: planned_challenge_fee {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.planned_challenge_fee__c ;;
  }

  measure: planned_expert_services {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.planned_expert_services__c ;;
  }

  measure: planned_license_fee {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.planned_license_fee__c ;;
  }

  measure: planned_member_payment {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.planned_member_payment__c ;;
  }

  measure: planned_mftaas {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.planned_mftaas__c ;;
  }

  measure: planned_mis {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.planned_mis__c ;;
  }

  measure: planned_qaas {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.planned_qaas__c ;;
  }

  dimension: project {
    type: string
    sql: ${TABLE}.project__c ;;
  }

  dimension_group: project_end {
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
    sql: ${TABLE}.project_end_date__c ;;
  }

  dimension: milestone {
    type: string
    sql: ${TABLE}.psa_milestone__c ;;
  }

  dimension: project_stream {
    type: string
    sql: ${TABLE}.psa_project__c ;;
  }

  dimension: services_schedule {
    type: string
    sql: ${TABLE}.psa_project_plan__c ;;
  }

  dimension: revenue_schedule {
    type: string
    sql: ${TABLE}.psa_revenue_schedule__c ;;
  }

  dimension: remove_from_forecast__c {
    type: yesno
    sql: ${TABLE}.remove_from_forecast__c ;;
  }

  dimension: reporting_account {
    type: string
    sql: ${TABLE}.reporting_account__c ;;
  }

  dimension: reporting_account_owner {
    type: string
    sql: ${TABLE}.reporting_account_owner__c ;;
  }

  dimension: reporting_industry {
    type: string
    sql: ${TABLE}.reporting_industry__c ;;
  }

  dimension: reporting_sbu {
    type: string
    sql: ${TABLE}.reporting_sbu__c ;;
  }

  measure: scheduled_expert_services {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.scheduled_expert_services__c ;;
  }

  dimension: subscription {
    type: string
    sql: ${TABLE}.subscription__c ;;
  }

  dimension: subscription_schedule {
    type: string
    sql: ${TABLE}.subscription_schedule__c ;;
  }

  measure: t_m_actual_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.t_m_actual_amount__c ;;
  }

  measure: t_m_planned_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.t_m_planned_amount__c ;;
  }

  dimension: topcoder_billing_account {
    type: string
    sql: ${TABLE}.topcoder_billing_account__c ;;
  }

  dimension: topcoder_billing_account_id {
    type: string
    sql: ${TABLE}.topcoder_billing_account_id__c ;;
  }

  dimension: topcoder_billing_account_line_item {
    type: string
    sql: ${TABLE}.topcoder_billing_account_line_item__c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type__c ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      isdeleted,
      account,
      actual_adhoc,
      actual_challenge_budget,
      actual_expert_services,
      actual_expert_services,
      actual_license_fee,
      adhoc_revenue,
      billable,
      category,
      opportunity,
      opportunity_project_id,
      opportunity_project_name,
      opportunity_project_taas,
      planned_adhoc,
      planned_challenge_budget,
      planned_challenge_fee,
      planned_expert_services,
      planned_license_fee,
      planned_member_payment,
      t_m_planned_amount,
      scheduled_expert_services,
      services_schedule,
      subscription,
      subscription_schedule,
      topcoder_billing_account,
      topcoder_billing_account_id,
      topcoder_billing_account_line_item
      ]
  }
}
