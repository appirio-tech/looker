view: project_stream {
  sql_table_name: tcs_dw.project_stream ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_director {
    type: string
    sql: ${TABLE}.account_director__r_name ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name__c ;;
  }

  dimension: actuals_to_update {
    type: yesno
    sql: ${TABLE}.actuals_to_update__c ;;
  }

  measure: assignment_count {
    type: sum
    sql: ${TABLE}.assignment_count__c ;;
  }

  dimension: audit_notes {
    type: string
    sql: ${TABLE}.audit_notes__c ;;
  }

  dimension: billing_account_allow {
    type: string
    sql: ${TABLE}.billing_account_allow__c ;;
  }

  measure: billings_from_challenge {
    type: sum
    sql: ${TABLE}.billings_from_challenge__c ;;
  }

  measure: billings_from_milestones {
    type :sum
    sql: ${TABLE}.billings_from_milestones__c ;;
  }

  measure: billings_from_timecard {
    type: sum
    sql: ${TABLE}.billings_from_timecard__c ;;
  }

  measure: bookings {
    type: sum
    sql: ${TABLE}.bookings__c ;;
  }

  measure: challenge_budget_burn_down_ {
    type: sum
    sql: ${TABLE}.challenge_budget_burn_down__c ;;
  }

  measure: consumed {
    type: sum
    label: "Consumed %"
    sql: ${TABLE}.consumed__c ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}.createdbyid ;;
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
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.createddate ;;
  }

  dimension: edit_revenue_split {
    type: string
    sql: ${TABLE}.edit_revenue_split__c ;;
  }

  measure: effective_assigned_work_amount_timecard {
    type: sum
    sql: ${TABLE}.effective_assigned_work_amount_timecard__c ;;
  }

  dimension_group: end {
    type: time
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
    sql: ${TABLE}.end_date__c ;;
  }

  dimension_group: first_revenue {
    type: time
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
    sql: ${TABLE}.first_revenue_date__c ;;
  }

  measure: gross_revenue_recognised {
    type: sum
    sql: ${TABLE}.gross_revenue_recognised__c ;;
  }

  dimension: is_credit_card_payment {
    type: yesno
    sql: ${TABLE}.is_credit_card_payment__c ;;
  }

  dimension: is_goodwill {
    type: yesno
    sql: ${TABLE}.is_goodwill__c ;;
  }

  dimension: is_inter_company {
    type: yesno
    sql: ${TABLE}.is_inter_company__c ;;
  }

  dimension: is_parent_project {
    type: yesno
    sql: ${TABLE}.is_parent_project__c ;;
  }

  dimension_group: last_revenue {
    type: time
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
    sql: ${TABLE}.last_revenue_date__c ;;
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}.lastmodifiedbyid ;;
  }

  dimension_group: lastmodified {
    type: time
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
    sql: ${TABLE}.lastmodifieddate ;;
  }

  dimension: legacy_project_number {
    type: string
    sql: ${TABLE}.legacy_project_number__c ;;
  }

  dimension: milestone_count {
    type: number
    sql: ${TABLE}.milestone_count__c ;;
  }

  dimension_group: minimum_prebill_effective {
    type: time
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
    sql: ${TABLE}.minimum_prebill_effective_date__c ;;
  }

  measure: net_revenue_recognised {
    type: sum
    sql: ${TABLE}.net_revenue_recognised__c ;;
  }

  dimension: opportunity {
    type: string
    sql: ${TABLE}.opportunity__c ;;
  }

  dimension: opportunity__r_accountid {
    type: string
    hidden: yes
    sql: ${TABLE}.opportunity__r_accountid ;;
  }

  dimension: opportunity__r_subcontracting_end_customer__c {
    type: string
    hidden: yes
    sql: ${TABLE}.opportunity__r_subcontracting_end_customer__c ;;
  }

  dimension: tc_connect_project_id {
    type: string
    sql: ${TABLE}.opportunity__r_tc_connect_project_id__c ;;
  }

  dimension: opportunity_project {
    type: string
    sql: ${TABLE}.opportunity_project__c ;;
  }

  dimension: opportunity_project_name {
    type: string
    sql: ${TABLE}.opportunity_project_name__c ;;
  }

  dimension: owner_name {
    type: string
    sql: ${TABLE}.owner_name ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id__c ;;
  }

  dimension: parent_type {
    type: string
    sql: ${TABLE}.parent_type__c ;;
  }

  measure: prebill_adjustment {
    type: sum
    sql: ${TABLE}.prebill_adjustment__c ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id__c ;;
  }

  dimension: project_manager {
    type: string
    sql: ${TABLE}.project_manager__r_name ;;
  }

  dimension: project_status_notes {
    type: string
    sql: ${TABLE}.project_status_notes__c ;;
  }

  dimension: psa_project_number {
    type: string
    sql: ${TABLE}.psa_project_number__c ;;
  }

  measure: remaining_billed_amount {
    type: sum
    sql: ${TABLE}.remaining_billed_amount__c ;;
  }

  measure: remaining_prebilled {
    type: sum
    sql: ${TABLE}.remaining_prebilled__c ;;
  }

  measure: remaining_recognition {
    type: sum
    sql: ${TABLE}.remaining_recognition__c ;;
  }

  dimension: reporting_account {
    type: string
    sql: ${TABLE}.reporting_account__c ;;
  }

  dimension: revenue_recognise_on_close {
    type: yesno
    sql: ${TABLE}.revenue_recognise_on_close__c ;;
  }

  dimension: revenue_recognised_by {
    type: string
    sql: ${TABLE}.revenue_recognised_by__c ;;
  }

  measure: services_budget_in_hybrid {
    type: sum
    sql: ${TABLE}.services_budget_in_hybrid__c ;;
  }

  dimension: stage {
    type: string
    sql: ${TABLE}.stage__c ;;
  }

  dimension_group: start {
    type: time
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
    sql: ${TABLE}.start_date__c ;;
  }

  dimension: subscription {
    type: string
    sql: ${TABLE}.subscription__c ;;
  }

  dimension: subscription_id {
    type: string
    sql: ${TABLE}.subscription_id__c ;;
  }

  dimension: subscription_name {
    type: string
    sql: ${TABLE}.subscription_name__c ;;
  }

  dimension: subscription_project {
    type: string
    sql: ${TABLE}.subscription_project__c ;;
  }

  dimension: subscription_project__r_subscription__r_account__c {
    type: string
    hidden: yes
    sql: ${TABLE}.subscription_project__r_subscription__r_account__c ;;
  }

  dimension: subscription_project__r_subscription__r_subcontracting_end_customer__c {
    type: string
    hidden: yes
    sql: ${TABLE}.subscription_project__r_subscription__r_subcontracting_end_customer__c ;;
  }

  measure: total_approved_budget {
    type: sum
    sql: ${TABLE}.total_approved_budget__c ;;
  }

  measure: total_approved_milestone {
    type: sum
    sql: ${TABLE}.total_approved_milestone__c ;;
  }

  measure: total_approved_miscellaneous_adjustment {
    type: sum
    sql: ${TABLE}.total_approved_miscellaneous_adjustment__c ;;
  }

  measure: total_approved_work_amount {
    type: sum
    sql: ${TABLE}.total_approved_work_amount__c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, owner_name, project_manager, account_director]
  }
}
