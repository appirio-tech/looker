view: client_project_dim {
  sql_table_name: tcs_dw.client_project_dim ;;

  dimension: billing_account_code {
    type: string
    sql: ${TABLE}.billing_account_code ;;
  }

  dimension: has_subscription {
    type: number
    description: "Is the Billing Account a part of the subscription ? (1 is yes)"
    sql:  ${TABLE}.has_subscription ;;
  }

  dimension: billing_account_id {
    type: number
    sql: ${TABLE}.billing_project_id ;;
  }

  dimension_group: client_create {
    type: time
    timeframes: [
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
    sql: ${TABLE}.client_create_date ;;
  }

  dimension: client_id {
    type: number
    drill_fields: [client_name, billing_account_name]
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: client_modification {
    type: time
    timeframes: [
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
    sql: ${TABLE}.client_modification_date ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  #dimension: billable {
  #  type: yesno
  #  sql: ${TABLE}.billable ;;
  #  description: "A customer Billing Account is marked billable. An internal or Goodwill BA is marked non billable"
  #}


  dimension: client_category {
    description: "Categorize Client as Internal or Customer. Internal includes Topcoder and [topcoder] copilots Name"
    type: string
    sql: CASE
      WHEN ${TABLE}.client_name = 'Topcoder' THEN 'Internal'
      WHEN ${TABLE}.client_name = '[topcoder] copilots' THEN 'Internal'
      ELSE 'Customer'
    END ;;

    }

  dimension: client_project_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.client_project_id ;;
  }

  dimension: cmc_account_id {
    type: string
    sql: ${TABLE}.cmc_account_id ;;
  }

  dimension: customer_number {
    type: string
    sql: ${TABLE}.customer_number ;;
  }

  #added on 14th June 2019
  dimension:billing_sfdc_account  {
    type: string
    hidden: yes
    description: "Sponsor Account for Challenges. e.g. Wipro SubContracting or Topcoder for Goodwill projects"
    sql: ${TABLE}.sfdc_account ;;
  }

  #added on 26th June 2020
  dimension: is_taas_billing_account {
    type: yesno
    description: "indicates whether the billing account is for Taas or not "
    sql: ${TABLE}.is_taas_billing_account ;;
  }

  #added on 14th June 2019
  dimension:reporting_sfdc_account  {
    description: "End Client, receiving the benefits"
    type: string
    hidden: yes
    sql: CASE

         when ${TABLE}.subscription_opportunity_subcontracting_end_customer__c is not null
               then ${TABLE}.subscription_opportunity_subcontracting_end_customer__c
         when ${TABLE}.subscription_subcontracting_end_customer__c is not null
               then ${TABLE}.subscription_subcontracting_end_customer__c

        when ${TABLE}.subscription_account__c is not null
               then ${TABLE}.subscription_account__c
        when ${TABLE}.sfdc_account is not null
               then ${TABLE}.sfdc_account


    else NULL
    END ;;
  }

  dimension:subscription_opportunity_subcontracting_end_customer  {
    type: string
    hidden: yes
    sql: ${TABLE}.subscription_opportunity_subcontracting_end_customer__c ;;
  }
  dimension:subscription_subcontracting_end_customer  {
    type: string
    hidden: yes
    sql: ${TABLE}.subscription_subcontracting_end_customer__c ;;
  }
  dimension:subscription_account  {
    type: string
    hidden: yes
    sql: ${TABLE}.subscription_account__c ;;
  }

  dimension_group: project_create {
    type: time
    timeframes: [
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
    sql: ${TABLE}.project_create_date ;;
  }

  dimension_group: project_modification {
    type: time
    timeframes: [
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
    sql: ${TABLE}.project_modification_date ;;
  }

  dimension: billing_account_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }

  dimension: is_topgear {
    type: string
    description: "Identifier for Topgear Trial account"
    case: {
      when: {
        sql: ${TABLE}.project_name = 'TopGear Trial' ;;
        label: "Yes"
      }
      else: "No"
    }
  }

  dimension: subscription_number {
    type: string
    sql: ${TABLE}.subscription_number ;;
  }

  dimension: billing_account_status {
    type: string
    sql: ${TABLE}.billing_account_status ;;
  }

  dimension: customer_segment {
    case: {
      when: {
        sql: ${TABLE}.client_name = 'XPrize' OR
          ${TABLE}.client_name = 'Amazon Web Services' OR
          ${TABLE}.client_name = 'BestDoctors' OR
          ${TABLE}.client_name = 'Harley-Davidson' OR
          ${TABLE}.client_name = 'HeroX' OR
          ${TABLE}.client_name = 'IBM' OR
          ${TABLE}.client_name = 'Land O''Lakes, Inc.' OR
          ${TABLE}.client_name = 'Hubs' OR
          ${TABLE}.client_name = 'SOLEPRO' OR
          ${TABLE}.client_name = 'Mesh01' OR
          ${TABLE}.client_name = 'Toosent' OR
          ${TABLE}.client_name = 'Nyrasta' OR
          ${TABLE}.client_name = 'Records and Data Management, Inc.' OR
          ${TABLE}.client_name = 'Visionware Solutions' OR
          ${TABLE}.client_name = 'Q2i' OR
          ${TABLE}.client_name = 'CrowdReason' OR
          ${TABLE}.client_name = 'Modultrade' OR
          ${TABLE}.client_name = 'Eager Properties' OR
          ${TABLE}.client_name = 'Emnovate' OR
          ${TABLE}.client_name = 'Harvard Business School';;
        label: "Self service"
      }
      when: {
        sql: ${TABLE}.client_name = 'Tallan, Inc.';;
        label: "Self service partner"
      }
      when: {
        sql: ${TABLE}.client_name = 'Wipro Limited' OR
              ${TABLE}.client_name = 'Booz Allen Hamilton Holding Corporation' OR
              ${TABLE}.client_name = 'General Electric' OR
              ${TABLE}.client_name = 'Hewlett Packard Enterprise Company (HPE)' OR
              ${TABLE}.client_name = 'John Hancock Financial Services' OR
              ${TABLE}.client_name = 'Topcoder' ;;
        label: "Powered By"
      }
      else: "Unclassified"
    }
  }

  dimension_group: billing_account_start_date {
    type: time
    timeframes: [
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
    sql: ${TABLE}.billing_account_start_date ;;
  }

  dimension_group: billing_account_end_date {
    type: time
    timeframes: [
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
    sql: ${TABLE}.billing_account_end_date ;;
  }

  measure: billing_account_budget {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.billing_account_budget ;;
  }


  measure: count {
    type: count
    drill_fields: [client_name]
  }

  measure: count_client {
    type: count_distinct
    sql: ${TABLE}.client_id ;;
  }

  measure: count_billing_account {
    type: count_distinct
    sql: ${TABLE}.billing_account_id ;;
  }



##  measure: self_service {
##    type: string
##    description: "Self-service customers."
##    filters: {
##      field: client_name
##      value: "XPrize, BestDoctors, Harley-Davidson, HeroX, Tallan"
 ##   }
##  }
}
