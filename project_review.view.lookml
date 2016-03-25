- view: project_review
  sql_table_name: public.project_review
  fields:

  - dimension: project_id
    type: number
    # hidden: true
    sql: ${TABLE}.project_id

  - dimension: reviewer_id
    type: number
    sql: ${TABLE}.reviewer_id

  - measure: total_payment
    type: sum
    sql: ${TABLE}.total_payment

  - measure: count
    type: count
    drill_fields: [project.component_name, project.review_phase_name, project.project_category_name, project.client_project_id]

