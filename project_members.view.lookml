- view: connect_project_members
  sql_table_name: public.project_members
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: createdat
    type: string
    sql: ${TABLE}.createdat

  - dimension: createdby
    type: number
    sql: ${TABLE}.createdby

  - dimension: deletedat
    type: string
    sql: ${TABLE}.deletedat

  - dimension: isprimary
    type: string
    sql: ${TABLE}.isprimary

  - dimension: projectid
    type: number
    value_format_name: id
    # hidden: true
    sql: ${TABLE}.projectid

  - dimension: role
    type: string
    sql: ${TABLE}.role

  - dimension: updatedat
    type: string
    sql: ${TABLE}.updatedat

  - dimension: updatedby
    type: number
    sql: ${TABLE}.updatedby

  - dimension: userid
    type: number
    value_format_name: id
    sql: ${TABLE}.userid

  - measure: count
    type: count
    drill_fields: [id, projects.directprojectid, projects.name]

  - measure: count_distinct_members
    type: count_distinct
    sql: ${id}
    drill_fields: [id]
