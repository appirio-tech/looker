- view: jira_issue
  sql_table_name: public.jira_issue
  fields:

  - dimension: jira_issue_id
    primary_key: true
    type: number
    sql: ${TABLE}.jira_issue_id

  - dimension: admin_fee
    type: number
    sql: ${TABLE}.admin_fee

  - dimension: assignee
    type: string
    sql: ${TABLE}.assignee

  - dimension: contest_id
    type: number
    # hidden: true
    sql: ${TABLE}.contest_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension_group: due
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.due_date

  - dimension: issue_type
    type: string
    sql: ${TABLE}.issue_type

  - dimension: payment_amount
    type: number
    sql: ${TABLE}.payment_amount

  - dimension: payment_status
    type: string
    sql: ${TABLE}.payment_status

  - dimension: project_id
    type: number
    # hidden: true
    sql: ${TABLE}.project_id

  - dimension: reporter
    type: string
    sql: ${TABLE}.reporter

  - dimension_group: resolution
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.resolution_date

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: summary
    type: string
    sql: ${TABLE}.summary

  - dimension: tco_points
    type: number
    sql: ${TABLE}.tco_points

  - dimension: ticket_id
    type: string
    sql: ${TABLE}.ticket_id

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated

  - dimension: votes
    type: number
    sql: ${TABLE}.votes

  - dimension: winner
    type: string
    sql: ${TABLE}.winner

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - jira_issue_id
    - contest.contest_id
    - contest.contest_name
    - contest.project_category_name
    - project.component_name
    - project.review_phase_name
    - project.project_category_name
    - project.client_project_id

