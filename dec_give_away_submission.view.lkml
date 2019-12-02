view: dec_give_away_submission {
  derived_table: {
    sql: -- use existing billing_account_budgets in looker_pdt.LR$QHFEMDLRL8UKDCMYAXI3C_billing_account_budgets
      SELECT
        member_submission.user_id  AS "user_id",
        member_profile_basic.handle  AS "handle",
        'Challenge' AS "contest_type",
        challenge.project_id  AS "challenge_id",
        member_submission.created_at AS "submission_time",
        challenge.component_name  AS "challenge_name"
      FROM tcs_dw.member_submission  AS member_submission
      LEFT JOIN tcs_dw.member_profile  AS member_profile_basic ON member_submission.user_id = member_profile_basic.user_id
      LEFT JOIN tcs_dw.project  AS challenge ON member_submission.challenge_id = challenge.project_id
      LEFT JOIN tcs_dw.direct_project_dim  AS direct_project_dim ON challenge.tc_direct_project_id = direct_project_dim.direct_project_id

      WHERE (member_submission.created_at  >= TIMESTAMP '2019-12-01' AND member_submission.created_at  <= TIMESTAMP '2020-01-04') AND (NVL(challenge.task_ind, 0)  = 0)
      --To exclude topgear billing account
      AND (direct_project_dim.billing_project_id <> 80000062)

      UNION ALL

      SELECT
        problem_submission.coder_id  AS "user_id",
        member_profile_basic.handle  AS "handle",
        'SRM' AS "contest_type",
        problem_submission.round_id  AS "challenge_id",
        TRUNC(TIMESTAMP 'epoch' + problem_submission.submit_time/1000 *INTERVAL '1 second') AS "submission_time",
        round.name  AS "challenge_name"
      FROM topcoder_dw.problem_submission  AS problem_submission
      LEFT JOIN tcs_dw.member_profile  AS member_profile_basic ON problem_submission.coder_id = member_profile_basic.user_id
      LEFT JOIN topcoder_dw.round ON problem_submission.round_id = round.round_id
      where (TRUNC(TIMESTAMP 'epoch' + problem_submission.submit_time/1000 *INTERVAL '1 second') >= '2019-12-01'
            AND TRUNC(TIMESTAMP 'epoch' + problem_submission.submit_time/1000 *INTERVAL '1 second') <= '2020-01-04' )
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: handle {
    type: string
    sql: ${TABLE}.handle ;;
  }

  dimension: contest_type {
    type: string
    sql: ${TABLE}.contest_type ;;
  }

  dimension: challenge_id {
    type: number
    sql: ${TABLE}.challenge_id ;;
  }

  dimension_group: submission_time {
    type: time
    sql: ${TABLE}.submission_time ;;
  }

  dimension: challenge_name {
    type: string
    sql: ${TABLE}.challenge_name ;;
  }

  dimension: week_number {
    type: string
    sql: CASE
        when ${submission_time_date} > '2019-11-30' AND ${submission_time_date} <= '2019-12-07' THEN 'Week 1'
        when ${submission_time_date} > '2019-12-07' AND ${submission_time_date} <= '2019-12-14' THEN 'Week 2'
        when ${submission_time_date} > '2019-12-14' AND ${submission_time_date} <= '2019-12-21' THEN 'Week 3'
        when ${submission_time_date} > '2019-12-21' AND ${submission_time_date} <= '2019-12-28' THEN 'Week 4'
        when ${submission_time_date} > '2019-12-28' AND ${submission_time_date} <= '2020-01-04' THEN 'Week 5'
        else null
        END;;
  }

  set: detail {
    fields: [
      user_id,
      handle,
      contest_type,
      challenge_id,
      submission_time_time,
      challenge_name
    ]
  }
}
