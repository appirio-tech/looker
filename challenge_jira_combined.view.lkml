view: ZZZ_challenge_jira_combined {
  derived_table: {
    sql: SELECT
        jira_issue.resolution_date,jira_issue_id
      FROM tcs_dw.jira_issue  AS jira_issue

      WHERE (jira_issue.payment_status ILIKE 'Paid')

      UNION

      SELECT
       challenge.posting_date,
       project_id

      FROM tcs_dw.project  AS challenge

      WHERE  (challenge.status_desc NOT ILIKE 'Deleted' AND challenge.status_desc NOT ILIKE 'Draft' AND challenge.status_desc NOT ILIKE 'Inactive' OR challenge.status_desc IS NULL)
       ;;
  }

 dimension_group: jira_issue.resolution_date {
  label: "Challenge Posting Date"
  type: time
  timeframes: [
    time,
    date,
    week,
    month,
    year,
    quarter
  ]
  sql: ${TABLE}.resolution_date ;;
  }

 measure: count {       # Create a measure called "name_count"
  type: count      # Declare that "name_count" has a type of count_distinct
  # Tell Looker that when a user clicks on one of these counts
}                           #   it should list the "name" of the underlying records


}
