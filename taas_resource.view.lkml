view: taas_resource {

  sql_table_name: tcs_dw.taas_resource ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: billing_account {
    hidden: yes
    type: string
    sql: ${TABLE}.billing_account__c ;;
  }

  dimension_group: billing_account_end {
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
    sql: ${TABLE}.billing_account_end_date__c ;;
  }

  dimension: billing_account_name {
    type: string
    sql: ${TABLE}.billing_account_name__c ;;
  }

  dimension_group: billing_account_start {
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
    sql: ${TABLE}.billing_account_start_date__c ;;
  }

  dimension: billing_status {
    hidden: yes
    type: string
    sql: ${TABLE}.billing_status__c ;;
  }

  dimension: challenge_description {
    hidden: yes
    type: string
    sql: ${TABLE}.challenge_description__c ;;
  }

  dimension: challenge_prefix {
    hidden: yes
    type: string
    sql: ${TABLE}.challenge_prefix__c ;;
  }

  dimension: client {
    type: string
    sql: ${TABLE}.client__c ;;
  }

  dimension: client_blling_account {
    type: string
    sql: ${TABLE}.client_billing_account__c ;;
  }

  dimension: client_bill_rate {
    type: number
    sql: ${TABLE}.client_bill_rate__c ;;
  }

  dimension: client_poc {
    type: string
    sql: ${TABLE}.client_poc__c ;;
  }

  dimension: client_poc_email {
    type: string
    sql: ${TABLE}.client_poc_email__c ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments__c ;;
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
    sql: ${TABLE}.createddate ;;
  }

  dimension: direct_link {
    hidden: yes
    type: string
    sql: ${TABLE}.direct_link__c ;;
  }

  dimension: direct_project_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.direct_project_id__c ;;
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
      year
    ]
    sql: ${TABLE}.end_date__c ;;
  }

  dimension: group_id {
    type: string
    sql: ${TABLE}.group_id__c ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name__c ;;
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

  dimension: milestone_id {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.milestone_id__c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: opportunity {
    type: string
    sql: ${TABLE}.opportunity__c ;;
  }

  dimension: ratio {
    type: number
    sql: ${TABLE}.ratio__c ;;
    value_format: "0.00\%"
  }

  dimension: resource_email {
    type: string
    sql: ${TABLE}.resource_email__c ;;
  }

  dimension: resource_handle {
    type: string
    sql: ${TABLE}.resource_handle__c ;;
  }

  dimension: send_weekly_survey {
    type: yesno
    sql: ${TABLE}.send_weekly_survey__c ;;
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
      year
    ]
    sql: ${TABLE}.start_date__c ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status__c ;;
  }

  dimension: survey_monkey_contact_id {
    hidden: yes
    type: string
    sql: ${TABLE}.survey_monkey_contact_id__c ;;
  }

  measure: total_payments {
    type: sum
    sql: ${TABLE}.total_payments__c ;;
    value_format: "$#.00;($#.00)"
  }

  dimension: user_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.user_id__c ;;
  }

  measure: weekly_payment {
    type: sum
    sql: ${TABLE}.weekly_payment__c ;;
    value_format: "$#.00;($#.00)"
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }

}
