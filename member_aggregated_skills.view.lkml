view: member_aggregated_skills {
  sql_table_name: tcs_dw.member_aggregated_skills ;;


  dimension: userid {
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.userid ;;
  }

  dimension: skills {
    type: string
    sql: ${TABLE}.skills ;;
  }

  dimension: foo {
    sql: json_extract_path_text((regexp_replace(${TABLE}.skills,'\\\\.','')), '') ;;

  }


  measure: count {
    type: count
    drill_fields: []
  }
}
