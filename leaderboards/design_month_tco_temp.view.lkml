view: design_month_tco_temp {
  derived_table: {
    sql: select max(submit_timestamp) as maxt, min(submit_timestamp) as mint,user_id from design_project_result group by user_id
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: maxt {
    type: time
    sql: ${TABLE}.maxt ;;
  }

  dimension_group: mint {
    type: time
    sql: ${TABLE}.mint ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  set: detail {
    fields: [maxt_time, mint_time, user_id]
  }
}
