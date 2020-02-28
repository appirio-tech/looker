view: temp_sfdc_billing_account {
  sql_table_name: tcs_dw.temp_sfdc_billing_account ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account__c {
    type: string
    sql: ${TABLE}.account__c ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: topcoder_billing_account_id__c {
    type: number
    value_format_name: id
    sql: ${TABLE}.topcoder_billing_account_id__c ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
