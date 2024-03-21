view: distinct_members_updated_skills_after_encouragement_modal_added_on_12_6_add {
  derived_table: {
    sql: SELECT
          COUNT(DISTINCT "user_id") AS "distinct_members",
          CAST("updated_at" AS DATE) as update_date
      FROM
          "tcs_dw"."member_skill" AS "member_skill"
      GROUP BY update_date
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: distinct_members {
    type: number
    sql: ${TABLE}.distinct_members ;;
  }

  dimension: update_date {
    type: date
    sql: ${TABLE}.update_date ;;
  }

  set: detail {
    fields: [distinct_members, update_date]
  }
}
