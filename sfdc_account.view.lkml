view: sfdc_account {
  sql_table_name: tcs_dw.sfdc_account ;;

  dimension: account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    link: {
      label: "sfdc_account_url"
      url: "https://topcoder.my.salesforce.com/{{ value }}"
      icon_url: "https://www.topcoder.com/wp-content/media/2017/03/Topcoder-Connect-Logo.png"
    }
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: customer_segment{
    type: string
    sql: ${TABLE}.customer_segment__c ;;
  }

  dimension: topcoder_client_id {
    type: string
    sql: ${TABLE}.topcoder_client_id__c ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  measure: annualrevenue {
    type: sum
    sql: ${TABLE}.annualrevenue ;;
  }

  measure: employees {
    type: sum
    sql: ${TABLE}.numberofemployees ;;
  }

  dimension: publicly_referenceable {
    type: yesno
    sql: ${TABLE}.publicly_referenceable__c ;;
  }

  dimension: subscription_level {
    type: string
    sql: ${TABLE}.subscription_level__c ;;
  }

  dimension_group: subscription_level_expiration {
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
    sql: ${TABLE}.subscription_level_expiration__c ;;
  }

  dimension: billingaddress {
    type: string
    sql: ${TABLE}.billingaddress ;;
    group_label: "Address"
  }

  dimension: billinggeocodeaccuracy {
    type: string
    sql: ${TABLE}.billinggeocodeaccuracy ;;
    group_label: "Address"
  }

  dimension: billinglongitude {
    type: number
    sql: ${TABLE}.billinglongitude ;;
    group_label: "Address"
  }

  dimension: billinglatitude {
    type: number
    sql: ${TABLE}.billinglatitude ;;
    group_label: "Address"
  }

  dimension: billingcountry {
    type: string
    sql: ${TABLE}.billingcountry ;;
    group_label: "Address"
  }

  dimension: billingpostalcode {
    type: string
    sql: ${TABLE}.billingpostalcode ;;
    group_label: "Address"
  }

  dimension: billingstate {
    type: string
    sql: ${TABLE}.billingstate ;;
    group_label: "Address"
  }

  dimension: billingcity {
    type: string
    sql: ${TABLE}.billingcity ;;
    group_label: "Address"
  }

  dimension: billingstreet {
    type: string
    sql: ${TABLE}.billingstreet ;;
    group_label: "Address"
  }

  dimension: wipro_sbu {
    type: string
    sql: ${TABLE}.wipro_sbu__c ;;
  }

  dimension: wipro_account_vertical {
    type: string
    sql: ${TABLE}.wipro_account_vertical__c ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: sub_industry {
    type: string
    sql: ${TABLE}.sub_industry__c ;;
  }

  dimension: wipro_top_300 {
    type: yesno
    sql: ${TABLE}.wipro_top_300__c ;;
  }

  dimension: wipro_classification {
    type: string
    sql: ${TABLE}.wipro_classification__c ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region__c ;;
  }

  dimension: new_vs_existing {
    type: string
    sql: ${TABLE}.new_vs_existing__c ;;
  }

  dimension: purchased_products {
    type: string
    sql: ${TABLE}.purchased_products__c ;;
  }

  measure: number_of_won_opportunities {
    type: sum
    sql: ${TABLE}.number_of_won_opportunities__c ;;
  }

  dimension: opportunity_prefix {
    type: string
    sql: ${TABLE}.opportunity_prefix__c ;;
  }

  measure: number_of_open_opportunities {
    type: sum
    sql: ${TABLE}.number_of_open_opportunities__c ;;
  }

  measure: number_active_projects {
    type: sum
    sql: ${TABLE}.num_active_projects__c ;;
  }

  dimension_group: date_of_last_won_opportunity {
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
    sql: ${TABLE}.date_of_last_won_opportunity__c ;;
  }

  dimension_group: date_of_first_win {
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
    sql: ${TABLE}.date_of_first_win__c ;;
  }

  measure: total_bookings_usd {
    type: sum
    sql: ${TABLE}.total_bookings_usd__c ;;
  }

 measure: count {
    type: count
    drill_fields: [account_id, name]
  }
}
