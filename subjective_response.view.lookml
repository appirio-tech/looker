- view: subjective_response
  sql_table_name: tcs_dw.subjective_response
  fields:

  - dimension: project_id
    type: number
    # hidden: true
    sql: ${TABLE}.project_id

  - dimension: response_text
    type: string
    sql: ${TABLE}.response_text

  - dimension: response_type_desc
    type: string
    sql: ${TABLE}.response_type_desc

  - dimension: response_type_id
    type: number
    sql: ${TABLE}.response_type_id

  - dimension: reviewer_id
    type: number
    sql: ${TABLE}.reviewer_id

  - dimension: scorecard_id
    type: number
    sql: ${TABLE}.scorecard_id

  - dimension: scorecard_question_id
    type: number
    sql: ${TABLE}.scorecard_question_id

  - dimension: sort
    type: number
    sql: ${TABLE}.sort

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [project.component_name, project.review_phase_name, project.project_category_name, project.client_project_id]

