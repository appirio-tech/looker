view: sfdc_opportunity {
  sql_table_name: tcs_dw.sfdc_opportunity ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: amount {
    type: sum
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

  dimension_group: closedate {
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
    sql: ${TABLE}.closedate ;;
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
    type: string
    sql: ${TABLE}.probability ;;
  }

  measure: expected_revenue {
    type: sum
    sql: ${TABLE}.expectedrevenue ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}.geo__c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
