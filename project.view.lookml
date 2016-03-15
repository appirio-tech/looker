- view: project
  sql_table_name: public.project
  fields:

  - dimension: tc_direct_project_id
    primary_key: true
    type: number
    sql: ${TABLE}.tc_direct_project_id

  - dimension_group: create
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.create_date

  - dimension: create_user
    type: string
    sql: ${TABLE}.create_user

  - dimension_group: modify
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.modify_date

  - dimension: modify_user
    type: string
    sql: ${TABLE}.modify_user

  - dimension: project_category_id
    type: number
    sql: ${TABLE}.project_category_id

  - dimension: project_id
    type: number
    # hidden: true
    sql: ${TABLE}.project_id

  - dimension: project_mm_spec_id
    type: number
    sql: ${TABLE}.project_mm_spec_id

  - dimension: project_status_id
    type: number
    sql: ${TABLE}.project_status_id

  - dimension: project_studio_spec_id
    type: number
    sql: ${TABLE}.project_studio_spec_id

  - dimension: project_sub_category_id
    type: number
    sql: ${TABLE}.project_sub_category_id

  - measure: count
    type: count
    drill_fields: [tc_direct_project_id, project.tc_direct_project_id, project.count]

