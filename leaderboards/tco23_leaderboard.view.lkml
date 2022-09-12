view: tco23_leaderboard {
  label: "TCO23 Leaderboard"
  derived_table: {
    sql:
      SELECT
        pr.project_id AS challenge_id,
        pr.challenge_guid AS challenge_guid,
        pr.total_prize as total_prize,
        rw.user_id as user_id,
        rw.max_score as max_score,
        max(rw.final_score) as max_final_score,
        max(rw.submission_id) as max_sub_id,
        RANK () OVER (
          PARTITION BY challenge_id
          ORDER BY max_final_score DESC, max_sub_id ASC
        ) AS placement,
        COUNT (*) OVER (
          PARTITION BY challenge_id
        ) AS passed_review,
        (total_prize * (passed_review - placement + 1)/passed_review) * (max_final_score/max_score) as tco_score
      FROM tcs_dw.submission_review rw
      INNER JOIN tcs_dw.project as pr
        ON pr.project_id = rw.project_id AND pr.is_private = 0
      where (rw.scorecard_type = 'Review' OR rw.scorecard_type = 'Iterative Review') AND rw.final_score > rw.min_score
      group by user_id,challenge_id,challenge_guid,max_score,total_prize
    ;;
    datagroup_trigger: project_cache
    distribution_style: "even"
    indexes: ["challenge_id", "user_id"]
  }

  dimension: challenge_id {
    description: "Challenge id"
    type: string
    hidden: yes
    sql: ${TABLE}.challenge_id ;;
  }

  dimension: user_id {
    description: "User id"
    type: string
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: placement {
    description: "Placement"
    type: number
    sql: ${TABLE}.placement ;;
  }

  dimension: num_submissions_passed_review {
    type: number
    sql: ${TABLE}.passed_review ;;
  }

  measure: tco_points {
    label: "TCO23 Points"
    type: sum
    description: "Computed TCO23 points"
    value_format: "#,##0.00"
    # TODO: add rating booster and/or way to support custom TCO scoring per challenge and/or user
    sql: ROUND(${TABLE}.tco_score, 1) ;;
  }

  measure: challenge_count {
    description: "Challenge Count"
    type: count_distinct
    sql: ${TABLE}.challenge_id ;;
  }

}
