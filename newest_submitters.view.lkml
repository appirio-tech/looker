view: newest_submitters {
  derived_table: {
    sql: select submission.project_id,
                result.userid,
                result.submitdate,
                result.submissionid
    from submission INNER JOIN
((select project_result.user_id as "userid",
min(date(project_result.submit_timestamp)) as "submitdate",
min(submission.submission_id) as "submissionid"
from project_result
LEFT JOIN submission on project_result.user_id = submission.submitter_id
where submission.submission_id is not null
group by userid)) AS "result"

ON submission.submission_id = result.submissionid

where result.submitdate > '2016-12-31'
;;
}

  dimension: challenge_id {
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.userid ;;
  }

  dimension: submission_id {
    type: number
    sql: ${TABLE}.submissionid ;;
  }

  dimension_group: submit_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.submitdate ;;
  }

}
