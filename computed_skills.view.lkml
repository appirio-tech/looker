view: computed_skills {
  derived_table: {
    sql:
    SELECT
      A.user_id,
      user_entered_skill,
      challenge_derived_skill FROM (
              SELECT  user_id,
                       LISTAGG(skill.name,', ') WITHIN GROUP(ORDER BY skill.name ASC )  AS user_entered_skill
              FROM member_skill
              INNER JOIN  tcs_dw.skill  AS skill ON member_skill.skill_id = skill.skill_id
              WHERE source = 'USER_ENTERED'
              GROUP BY 1
            ) AS A
    LEFT JOIN  (
              SELECT  user_id,
                       LISTAGG(skill.name,', ') WITHIN GROUP(ORDER BY skill.name ASC )  AS challenge_derived_skill
              FROM member_skill
              INNER JOIN  tcs_dw.skill  AS skill ON member_skill.skill_id = skill.skill_id
              WHERE source = 'CHALLENGE'
              GROUP BY 1
      ) AS B ON A.user_id = B.user_id
       ;;
  sortkeys: ["user_id"]
  distribution: "user_id"
  persist_for: "6 hours"
  }

  measure: computed_skill_count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    hidden: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_entered_skill {
    type: string
    description: "Comma separated skill list for a user entered by the user himself"

    sql: ${TABLE}.user_entered_skill ;;
  }

  dimension: challenge_derived_skill {
    type: string
    description: "Comma separated skill list for a user derived from his challenge participation"

    sql: ${TABLE}.challenge_derived_skill ;;
  }

  set: detail {
    fields: [user_id, user_entered_skill, challenge_derived_skill]
  }
}
