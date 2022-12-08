view: first_time_valid_submitters {

  derived_table: {
    sql: with t1 as (
      select
      member_submission.user_id as user_id,
      max(member_submission.created_at) as submission_date
      from tcs_dw.member_submission as member_submission
      left join tcs_dw.project_result as project_result
      on  member_submission.user_id = project_result.user_id
      and member_submission.challenge_id = project_result.project_id
      where project_result.valid_submission_ind = 1
      group by member_submission.user_id),

      t2 as (
      select t1.user_id as user_id, member_submission.submission_id as submission_id from t1
      left join tcs_dw.member_submission as member_submission
      on t1.user_id = member_submission.user_id and
      t1.submission_date = member_submission.created_at)


      select member_submission.user_id,
      min(member_submission.created_at),
      max(member_submission.created_at),
      case when min(member_submission.created_at) = max(member_submission.created_at) then 'First Timer' else 'Returnee' end as "Status",
      t2.submission_id
      from tcs_dw.member_submission as member_submission
      left join tcs_dw.project_result as project_result
      on  member_submission.user_id = project_result.user_id
      and member_submission.challenge_id = project_result.project_id
      left join t2 on
      t2.user_id = member_submission.user_id
      where project_result.valid_submission_ind = 1
      group by member_submission.user_id,t2.submission_id
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

  dimension_group: min {
    type: time
    sql: ${TABLE}.min ;;
  }

  dimension_group: max {
    type: time
    sql: ${TABLE}.max ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: submission_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.submission_id ;;
  }

  set: detail {
    fields: [user_id, min_time, max_time, status, submission_id]
  }
}
