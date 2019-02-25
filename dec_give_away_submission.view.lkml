view: dec_give_away_submission {
  derived_table: {
    sql: -- use existing billing_account_budgets in looker_pdt.LR$QHFEMDLRL8UKDCMYAXI3C_billing_account_budgets
      SELECT
        member_submission.user_id  AS "user_id",
        member_profile_basic.handle  AS "handle",
        'Challenge' AS "contest_type",
        challenge.project_id  AS "challenge_id",
        member_submission.created_at AS "submission_time",
        challenge.component_name  AS "name"
      FROM tcs_dw.member_submission  AS member_submission
      LEFT JOIN tcs_dw.member_profile  AS member_profile_basic ON member_submission.user_id = member_profile_basic.user_id
      LEFT JOIN tcs_dw.project  AS challenge ON member_submission.challenge_id = challenge.project_id
      LEFT JOIN tcs_dw.direct_project_dim  AS direct_project_dim ON challenge.tc_direct_project_id = direct_project_dim.direct_project_id

      WHERE (member_submission.created_at  >= TIMESTAMP '2018-11-28') AND (NVL(challenge.task_ind, 0)  = 0) AND (direct_project_dim.billing_project_id <> 80000062)

      UNION ALL

      select user_id, handle, contest_type, round_id, submission_time, name
      FROM dec_give_away18_submission
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  set: detail {
    fields: [
      user_id,
      handle,
      contest_type,
      challenge_id,
      submission_time_time,
      name
    ]
  }
}
