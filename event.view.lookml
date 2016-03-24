- view: event
  sql_table_name: public.event
  fields:

  - dimension: event_id
    primary_key: true
    type: number
    sql: ${TABLE}.event_id

  - dimension: event_name
    type: string
    sql: ${TABLE}.event_name

  - measure: count
    type: count
    drill_fields: [event_id, event_name, contest.count, user_event_xref.count]

