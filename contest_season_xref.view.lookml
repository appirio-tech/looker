- view: contest_season_xref
  sql_table_name: public.contest_season_xref
  fields:

  - dimension: contest_id
    type: number
    # hidden: true
    sql: ${TABLE}.contest_id

  - dimension: season_id
    type: number
    # hidden: true
    sql: ${TABLE}.season_id

  - measure: count
    type: count
    drill_fields: [contest.contest_id, contest.contest_name, contest.project_category_name, season.name, season.next_rookie_season_id]

