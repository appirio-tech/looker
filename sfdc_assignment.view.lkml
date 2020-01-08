view: sfdc_assignment {
  sql_table_name: tcs_dw.sfdc_assignment ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role__c ;;
  }

  dimension: project_stream_id {
    type: string
    sql: ${TABLE}.psa_project__c ;;

  }

  dimension: resource_name {
    type: string
    sql: ${TABLE}.resource_name__c ;;
  }
  measure: count {
    type: count
    drill_fields: [id, role,project_stream_id,resource_name]
  }

}
