view: sfdc_revenue_recognition {
  sql_table_name: tcs_dw.sfdc_revenue_recognition ;;
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

  dimension: account_sbu {
    type: string
    sql: ${TABLE}.account_sbu__c ;;
  }

  dimension_group: accrual_date {
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
    sql: ${TABLE}.accrual_date__c ;;
  }

  measure: adhoc {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.adhoc__c ;;
  }

  dimension: adhoc_revenue {
    type: string
    sql: ${TABLE}.adhoc_revenue__c ;;
  }

  dimension: adhoc_revenue_description {
    type: string
    sql: ${TABLE}.adhoc_revenue_description__c ;;
  }

  dimension: adhoc_revenue_reason {
    type: string
    sql: ${TABLE}.adhoc_revenue_reason__c ;;
  }

  measure: gross_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.amount__c ;;
  }

  dimension_group: bill_date_of_accrual {
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
    sql: ${TABLE}.bill_date_of_accrual__c ;;
  }

  dimension: billing_account_id {
    type: string
    sql: ${TABLE}.billing_account_id__c ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category__c ;;
  }

  measure: challenge_fee {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.challenge_fee__c ;;
  }

  dimension: daai_ninja {
    type: yesno
    sql: ${TABLE}.daai_ninja__c ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date__c ;;
  }

  measure: expense_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.expense_amount__c ;;
  }

  dimension: for_prebill {
    type: yesno
    sql: ${TABLE}.for_prebill__c ;;
  }

  dimension: for_taas {
    type: yesno
    sql: ${TABLE}.for_taas__c ;;
  }

  dimension: historical_revenue {
    type: string
    sql: ${TABLE}.historical_revenue__c ;;
  }

  dimension: is_accrual {
    type: yesno
    sql: ${TABLE}.is_accrual__c ;;
  }

  dimension: is_extension {
    type: yesno
    sql: ${TABLE}.is_extension__c ;;
  }

  dimension: is_first_month_of_revenue {
    type: yesno
    sql: ${TABLE}.is_first_month_of_revenue__c ;;
  }

  dimension: is_reversal {
    type: yesno
    sql: ${TABLE}.is_reversal__c ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  measure: license_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.license_amount__c ;;
  }

  measure: member_payment {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.member_payment__c ;;
  }

  measure: mftaas {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.mftaas__c ;;
  }

  dimension: milestone_or_revenue_schedule {
    type: string
    sql: ${TABLE}.milestone_or_revenue_schedule__c ;;
  }

  measure: mis {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.mis__c ;;
  }

  measure: net_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.net_amount__c ;;
  }

  dimension: opportunity {
    type: string
    sql: ${TABLE}.opportunity__c ;;
  }

  dimension: opportunity_project {
    type: string
    sql: ${TABLE}.opportunity_project__c ;;
  }

  dimension: opportunity_project_close_amount {
    type: number
    sql: ${TABLE}.opportunity_project_close_amount__c ;;
  }

  dimension_group: opportunity_project_close {
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
    sql: ${TABLE}.opportunity_project_close_date__c ;;
  }

  dimension: opportunity_project_id {
    type: string
    sql: ${TABLE}.opportunity_project_id__c ;;
  }

  dimension: owner_name {
    type: string
    sql: ${TABLE}.owner_name__c ;;
  }

  dimension: prebill {
    type: yesno
    sql: ${TABLE}.prebill__c ;;
  }

  dimension: project {
    type: string
    sql: ${TABLE}.project__c ;;
  }

  dimension: challenge {
    type: string
    sql: ${TABLE}.psa_challenge__c ;;
  }

  dimension: milestone {
    type: string
    sql: ${TABLE}.psa_milestone__c ;;
  }

  dimension: miscellaneous_adjustment {
    type: string
    sql: ${TABLE}.psa_miscellaneous_adjustment__c ;;
  }

  dimension: project_strem {
    type: string
    sql: ${TABLE}.psa_project__c ;;
  }

  dimension: revenue_schedule {
    type: string
    sql: ${TABLE}.psa_revenue_schedule__c ;;
  }

  dimension: time_split {
    type: string
    sql: ${TABLE}.psa_time_split__c ;;
  }

  dimension: timecard {
    type: string
    sql: ${TABLE}.psa_timecard__c ;;
  }

  measure: qaas {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.qaas__c ;;
  }

  dimension: revenue_recognise_master_for_accrual {
    type: yesno
    sql: ${TABLE}.revenue_recognise_master_for_accrual__c ;;
  }

  dimension_group: revenue_recognise_master {
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
    sql: ${TABLE}.revenue_recognise_master_generate_date__c ;;
  }

  dimension: revenue_recognise_master_name {
    type: string
    sql: ${TABLE}.revenue_recognise_master_name ;;
  }

  measure: services_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.services_amount__c ;;
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
      account_sbu,
      adhoc,
      adhoc_revenue,
      adhoc_revenue_description,
      adhoc_revenue_reason,
      challenge,
      category,
      challenge_fee,
      gross_amount,
      billing_account_id,
      prebill,
      project,
      project_strem,
      opportunity,
      opportunity_project,
      opportunity_project_close_amount,
      expense_amount,
      services_amount,
      historical_revenue,
      revenue_schedule,
      mftaas,
      miscellaneous_adjustment,
      milestone,
      revenue_recognise_master_name
      ]
  }

}
