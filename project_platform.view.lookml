- view: project_platform
  sql_table_name: public.project_platform
  fields:

  - dimension: project_platform_id
    primary_key: true
    type: number
    sql: ${TABLE}.project_platform_id

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
    - project_platform_id
    - name
    - project.component_name
    - project.review_phase_name
    - project.project_category_name
    - project.client_project_id

