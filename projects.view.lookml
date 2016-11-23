- view: connect_project
  sql_table_name: public.projects
  fields:

  - dimension: directprojectid
    primary_key: true
    type: number
    sql: ${TABLE}.directprojectid

  - measure: actualprice
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
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
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.createdat

  - dimension: createdby
    type: number
    sql: ${TABLE}.createdby

  - dimension: deletedat
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.deletedat

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: details
    type: string
    sql: ${TABLE}.details

  - measure: estimatedprice
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
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
    type: time
    timeframes: [time, date, week, month, quarter, year]
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

