view: derived_skills_list {
  derived_table: {
    sql: SELECT
        "user".coder_id  AS "user.coder_id",
         LISTAGG(skill.name,', ')  AS "skill.name"
      FROM tcs_dw.member_skill  AS member_skill
      LEFT JOIN tcs_dw.skill  AS skill ON member_skill.skill_id = skill.skill_id
      LEFT JOIN tcs_dw.coder  AS "user" ON member_skill.user_id = ("user".coder_id)

      GROUP BY 1
      ORDER BY 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_coder_id {
    type: number
    sql: ${TABLE}."user.coder_id" ;;
  }

  dimension: skill_name {
    type: string
    sql: ${TABLE}."skill.name" ;;
  }

  set: detail {
    fields: [user_coder_id, skill_name]
  }
}
