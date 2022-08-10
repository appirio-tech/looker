view: tco23_qa_s1_with_details {
  derived_table: {
    sql: SELECT pr.project_id AS "challenge.project_id", pr.challenge_guid AS "challenge.challenge_guid_1",
      RANK () OVER (
        PARTITION BY pr.project_id
        ORDER BY rw.final_score DESC, rw.submission_id ASC
      ) AS "tco_leaderboard.placement",
      ROUND(total_prize * ((num_submissions_passed_review - "tco_leaderboard.placement" + 1)/num_submissions_passed_review) * (final_score/max_score), 1) AS "tco_leaderboard.tco_points",
      member_profile_basic.user_id  AS "member_profile_basic.user_id",
      member_profile_basic.handle  AS "member_profile_basic.handle",
      member_profile_basic.photo_url  AS "member_profile_basic.photo_url",
      member_profile_basic.max_rating  AS "member_profile_basic.max_rating"
      FROM project pr
      INNER JOIN submission_review rw ON pr.project_id = rw.project_id
      LEFT JOIN tcs_dw.member_profile  AS member_profile_basic ON rw.user_id = member_profile_basic.user_id
      WHERE tco_track='2023 TCO QA Stage 1' and status_id=7 and rw.scorecard_type='Review'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: challenge_project_id {
    type: number
    sql: ${TABLE}."challenge.project_id" ;;
  }

  dimension: challenge_challenge_guid_1 {
    type: string
    sql: ${TABLE}."challenge.challenge_guid_1" ;;
  }

  dimension: tco_leaderboard_placement {
    type: number
    sql: ${TABLE}."tco_leaderboard.placement" ;;
  }

  dimension: tco_leaderboard_tco_points {
    type: number
    sql: ${TABLE}."tco_leaderboard.tco_points" ;;
  }

  dimension: member_profile_basic_user_id {
    type: number
    sql: ${TABLE}."member_profile_basic.user_id" ;;
  }

  dimension: member_profile_basic_handle {
    type: string
    sql: ${TABLE}."member_profile_basic.handle" ;;
  }

  dimension: member_profile_basic_photo_url {
    type: string
    sql: ${TABLE}."member_profile_basic.photo_url" ;;
  }

  dimension: member_profile_basic_max_rating {
    type: number
    sql: ${TABLE}."member_profile_basic.max_rating" ;;
  }

  set: detail {
    fields: [
      challenge_project_id,
      challenge_challenge_guid_1,
      tco_leaderboard_placement,
      tco_leaderboard_tco_points,
      member_profile_basic_user_id,
      member_profile_basic_handle,
      member_profile_basic_photo_url,
      member_profile_basic_max_rating
    ]
  }
}
