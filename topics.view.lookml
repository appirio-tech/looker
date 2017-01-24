- view: connect_messages
  sql_table_name: public.topics
  fields:

  - dimension: discoursetopicid
    primary_key: true
    type: number
    sql: ${TABLE}.discoursetopicid

  - dimension: createdate
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.createdat

  - dimension: createdby
    type: string
    sql: ${TABLE}.createdby

  - dimension: id
    type: number
    sql: ${TABLE}.id

  - dimension: reference
    type: string
    sql: ${TABLE}.reference

  - dimension: referenceid
    type: string
    sql: ${TABLE}.referenceid

  - dimension: tag
    type: string
    sql: ${TABLE}.tag

  - dimension: updatedate
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.updatedat

  - dimension: updatedby
    type: string
    sql: ${TABLE}.updatedby

  - measure: count
    type: count
    drill_fields: [discoursetopicid, referenceId]

