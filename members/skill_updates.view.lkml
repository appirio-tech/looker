view: skill_updates {
  derived_table: {
    sql: SELECT
        s.name,
        member_skill.skill_id,
        COUNT(member_skill.skill_id) AS "count"
      FROM
          "tcs_dw"."member_skill" AS "member_skill"
      left join "tcs_dw"."skill" s ON member_skill.skill_id = s.skill_id
      WHERE (member_skill.updated_at) >= (TIMESTAMP '2022-12-06')
      GROUP BY member_skill.skill_id,s.name
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: skill_id {
    type: number
    sql: ${TABLE}.skill_id ;;
  }

  dimension: count_ {
    type: number
    sql: ${TABLE}.count ;;
  }

  set: detail {
    fields: [name, skill_id, count_]
  }
}
