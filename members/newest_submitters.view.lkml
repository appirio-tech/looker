view: newest_submitters {
  derived_table: {
    sql:
    -- Final summary query
    SELECT
          B.user_id,
          B.project_id,
          MIN(B.registration_date) as registration_date,
          MIN(B.submission_date) as submission_date
    FROM
    (
     -- Get one row for user and project id combination
      SELECT A.user_id,
          min(A.min_project_id) as project_id,
          min(A.min_reg_date) as registration_date,
          null as submission_date
      FROM
      (
        -- Collect Minimum Registration Date and its corresponding project
        -- Cannot use a min function for project, as the user might have registered on a new challenge first
        SELECT user_id,
          FIRST_VALUE(project_id) OVER(PARTITION by user_id ORDER BY inquire_timestamp ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as min_project_id,
          MIN(inquire_timestamp) OVER (partition by user_id) as min_reg_date
        FROM
        (
          --Combine Project Result and Design Project Result
          SELECT user_id, project_id,inquire_timestamp,submit_timestamp
          FROM project_result
          UNION
          SELECT user_id, project_id,inquire_timestamp,submit_timestamp
          FROM design_project_result
        )
      ) AS A
      GROUP BY A.user_id

      UNION ALL
      -- Get one row for user and project id combination
      SELECT A.user_id,
          min(A.min_project_id) as project_id,
          null as registration_date,
          min(A.min_submit_date) as submission_date
      FROM
      (
        -- Collect Minimum Submission Date and its corresponding project
        -- Cannot use a min function for project, as the user might have registered on a new challenge first
        SELECT user_id,
          FIRST_VALUE(project_id) OVER(PARTITION by user_id ORDER BY submit_timestamp ASC NULLS LAST ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as min_project_id,
          MIN(submit_timestamp) OVER (partition by user_id ORDER BY submit_timestamp ASC NULLS LAST ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) as min_submit_date
        FROM
        (
          SELECT user_id, project_id,inquire_timestamp,submit_timestamp
          FROM project_result
          UNION
          SELECT user_id, project_id,inquire_timestamp,submit_timestamp
          FROM design_project_result
        )
      ) AS A
      WHERE A.min_submit_date is not null
      GROUP BY A.user_id
    ) AS B

    Group by B.user_id, B.project_id
;;
   sortkeys: ["user_id", "project_id"]
   distribution: "user_id"
   persist_for: "8 hours"
  }

  dimension: challenge_id {
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  # dimension: submission_id {
  #  type: number
  #  sql: ${TABLE}.submissionid ;;
  #}

  dimension_group: submit_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.submission_date ;;
  }

  dimension_group: registration_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.registration_date ;;
  }
}
