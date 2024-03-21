view: member_updated_skills_after_nag_modal {
  derived_table: {
    sql: select COUNT ( DISTINCT user_id ) from member_skill where updated_at >= '2022-12-06'
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: count_ {
    type: number
    sql: ${TABLE}.count ;;
  }

  set: detail {
    fields: [count_]
  }
}
