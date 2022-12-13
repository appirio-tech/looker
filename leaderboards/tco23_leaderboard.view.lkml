view: tco23_leaderboard {
  label: "TCO23 Leaderboard"
  derived_table: {
    sql:
      WITH subs AS (
        SELECT
          pr.project_id AS challenge_id,
          pr.challenge_guid AS challenge_guid,
          pr.tco_track as tco_track,
          pr.total_prize as total_prize,
          rw.user_id as user_id,
          rw.min_score as min_score,
          rw.max_score as max_score,
          CASE
            WHEN pr.tco_track LIKE '%Design%' THEN max(rw.final_score)
            WHEN pr.project_category_name = 'First2Finish' THEN max(rw.final_score)
            ELSE avg(rw.final_score)
          END as max_final_score,
          RANK () OVER (
            PARTITION BY challenge_id
            ORDER BY max_final_score DESC, max(rw.create_date) ASC
          ) AS placement
        FROM tcs_dw.submission_review rw
        INNER JOIN tcs_dw.project as pr
          ON pr.project_id = rw.project_id AND pr.is_private = 0 AND pr.status_id = 7
        where (rw.scorecard_type = 'Review' OR rw.scorecard_type = 'Iterative Review')
        group by user_id,challenge_id,challenge_guid,min_score,max_score,total_prize,tco_track,project_category_name
      )
      SELECT
        *,
        COUNT (*) OVER (
          PARTITION BY challenge_id
        ) as passed_review,
        CASE
          WHEN tco_track LIKE '%Data Science%' THEN (2500 * LOG(cast((1 + (total_prize/2500)) as double precision)) * (passed_review - placement + 1)/passed_review) * (max_final_score/max_score)
          ELSE (total_prize * (passed_review - placement + 1)/passed_review) * (max_final_score/max_score)
        END as tco_score
      FROM subs
      WHERE subs.max_final_score >= subs.min_score
      UNION
      SELECT * FROM tcs_dw.tco_ds_member_scores
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
