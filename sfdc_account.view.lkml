view: sfdc_account {
  sql_table_name: tcs_dw.sfdc_account ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

 measure: count {
    type: count
    drill_fields: [id, name]
  }
}
