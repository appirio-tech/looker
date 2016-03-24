- view: rookie
  sql_table_name: public.rookie
  fields:

  - dimension: confirmed_ind
    type: number
    sql: ${TABLE}.confirmed_ind

  - dimension: phase_id
    type: number
    sql: ${TABLE}.phase_id

  - dimension: season_id
    type: number
    # hidden: true
    sql: ${TABLE}.season_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [season.name, season.next_rookie_season_id]

