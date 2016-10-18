- view: contest_project_xref
  sql_table_name: tcs_dw.contest_project_xref
  fields:

  - dimension: contest_id
    type: number
    # hidden: true
    sql: ${TABLE}.contest_id

  - dimension: project_id
    type: number
    # hidden: true
    sql: ${TABLE}.project_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - project.component_name
    - project.review_phase_name
    - project.project_category_name
    - project.client_project_id
    - contest.contest_id
    - contest.contest_name
    - contest.project_category_name

