view: challenge_jira_combined {
  derived_table: {
    sql: SELECT
        TO_CHAR(DATE_TRUNC('month', jira_issue.resolution_date ), 'YYYY-MM') AS "Month",
        COUNT(*) AS "Count"
      FROM tcs_dw.jira_issue  AS jira_issue

      WHERE (jira_issue.payment_status ILIKE 'Paid') AND ((((jira_issue.resolution_date ) >= (TIMESTAMP '2016-11-01') AND (jira_issue.resolution_date ) < (TIMESTAMP '2018-03-31'))))
      GROUP BY DATE_TRUNC('month', jira_issue.resolution_date )

      UNION

      SELECT
        TO_CHAR(DATE_TRUNC('month', challenge.posting_date ), 'YYYY-MM') AS "challenge.posting_month",
        COUNT(*) AS "challenge.count"
      FROM tcs_dw.project  AS challenge

      WHERE ((((challenge.posting_date ) >= (TIMESTAMP '2016-11-01') AND (challenge.posting_date ) < (TIMESTAMP '2018-03-31')))) AND (challenge.status_desc NOT ILIKE 'Deleted' AND challenge.status_desc NOT ILIKE 'Draft' AND challenge.status_desc NOT ILIKE 'Inactive' OR challenge.status_desc IS NULL)
      GROUP BY DATE_TRUNC('month', challenge.posting_date )
       ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
  }

  set: detail {
    fields: [month, count]
  }
}
