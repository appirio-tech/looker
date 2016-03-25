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
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.create_date_time

  - dimension: level_id
    type: number
    sql: ${TABLE}.level_id

  - dimension_group: mod_date
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.mod_date_time

  - dimension: phase_id
    type: number
    sql: ${TABLE}.phase_id

  - dimension: place
    type: number
    sql: ${TABLE}.place

  - dimension: processed
    type: number
    sql: ${TABLE}.processed

  - dimension_group: submission
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.submission_date

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [user_component_score_id, component_name]

  - measure: money
    type: sum
    sql: ${TABLE}.money

  - measure: rating
    type: sum
    sql: ${TABLE}.rating

  - measure: score
    type: sum
    sql: ${TABLE}.score

