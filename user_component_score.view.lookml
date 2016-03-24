- view: user_component_score
  sql_table_name: public.user_component_score
  fields:

  - dimension: user_component_score_id
    primary_key: true
    type: number
    sql: ${TABLE}.user_component_score_id

  - dimension: comp_vers_id
    type: number
    sql: ${TABLE}.comp_vers_id

  - dimension: component_id
    type: number
    sql: ${TABLE}.component_id

  - dimension: component_name
    type: string
    sql: ${TABLE}.component_name

  - dimension_group: create_date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.create_date_time

  - dimension: level_id
    type: number
    sql: ${TABLE}.level_id

  - dimension_group: mod_date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.mod_date_time

  - dimension: money
    type: number
    sql: ${TABLE}.money

  - dimension: phase_id
    type: number
    sql: ${TABLE}.phase_id

  - dimension: place
    type: number
    sql: ${TABLE}.place

  - dimension: processed
    type: number
    sql: ${TABLE}.processed

  - dimension: rating
    type: number
    sql: ${TABLE}.rating

  - dimension: score
    type: number
    sql: ${TABLE}.score

  - dimension_group: submission
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.submission_date

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [user_component_score_id, component_name]

