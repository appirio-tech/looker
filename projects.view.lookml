- view: connect_project
  sql_table_name: public.projects
  fields:

  - dimension: directprojectid
    primary_key: true
    type: number
    sql: ${TABLE}.directprojectid

  - dimension: actualprice
    type: number
    sql: ${TABLE}.actualprice

  - dimension: billingaccountid
    type: number
    value_format_name: id
    sql: ${TABLE}.billingaccountid

  - dimension: bookmarks
    type: string
    sql: ${TABLE}.bookmarks

  - dimension: challengeeligibility
    type: string
    sql: ${TABLE}.challengeeligibility

  - dimension: createdat
    type: string
    sql: ${TABLE}.createdat

  - dimension: createdby
    type: number
    sql: ${TABLE}.createdby

  - dimension: deletedat
    type: string
    sql: ${TABLE}.deletedat

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: details
    type: string
    sql: ${TABLE}.details

  - dimension: estimatedprice
    type: number
    sql: ${TABLE}.estimatedprice

  - dimension: external
    type: string
    sql: ${TABLE}.external

  - dimension: id
    type: number
    sql: ${TABLE}.id

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - dimension: updatedat
    type: string
    sql: ${TABLE}.updatedat

  - dimension: updatedby
    type: number
    sql: ${TABLE}.updatedby

  - dimension: utm
    type: string
    sql: ${TABLE}.utm

  - measure: count
    type: count
    drill_fields: [directprojectid, name, project_members.count]

