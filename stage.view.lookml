- view: stage
  sql_table_name: topcoder_dw.stage
  fields:

  - dimension: stage_id
    primary_key: true
    type: number
    sql: ${TABLE}.stage_id

  - dimension: end_calendar_id
    type: number
    sql: ${TABLE}.end_calendar_id

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: season_id
    type: number
    # hidden: true
    sql: ${TABLE}.season_id

  - dimension: start_calendar_id
    type: number
    sql: ${TABLE}.start_calendar_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - stage_id
    - name
    - season.name
    - season.next_rookie_season_id
    - contest_stage_xref.count
    - project.count

