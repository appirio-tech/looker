- view: contest_stage_xref
  sql_table_name: public.contest_stage_xref
  fields:

  - dimension: contest_id
    type: number
    # hidden: true
    sql: ${TABLE}.contest_id

  - dimension: stage_id
    type: number
    # hidden: true
    sql: ${TABLE}.stage_id

  - dimension: top_performers_factor
    type: number
    sql: ${TABLE}.top_performers_factor

  - measure: count
    type: count
    drill_fields: [contest.contest_id, contest.contest_name, contest.project_category_name, stage.stage_id, stage.name]

