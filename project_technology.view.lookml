- view: project_technology
  sql_table_name: tcs_dw.project_technology
  fields:

  - dimension: project_technology_id
    primary_key: true
    type: number
    sql: ${TABLE}.project_technology_id

  - dimension: name
    type: string
    sql: ${TABLE}.name

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
    - project_technology_id
    - name
    - project.component_name
    - project.review_phase_name
    - project.project_category_name
    - project.client_project_id

