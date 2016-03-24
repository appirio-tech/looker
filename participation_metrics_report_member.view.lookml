- view: participation_metrics_report_member
  sql_table_name: public.participation_metrics_report_member
  fields:

  - dimension: contest_id
    type: number
    # hidden: true
    sql: ${TABLE}.contest_id

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: country_code
    type: string
    sql: ${TABLE}.country_code

  - dimension: is_final_winner
    type: yesno
    sql: ${TABLE}.is_final_winner

  - dimension: is_milestone_winner
    type: yesno
    sql: ${TABLE}.is_milestone_winner

  - dimension: is_submitter
    type: yesno
    sql: ${TABLE}.is_submitter

  - dimension: num_of_final_subs
    type: number
    sql: ${TABLE}.num_of_final_subs

  - dimension: num_of_final_wins
    type: number
    sql: ${TABLE}.num_of_final_wins

  - dimension: num_of_milestone_subs
    type: number
    sql: ${TABLE}.num_of_milestone_subs

  - dimension: num_of_milestone_wins
    type: number
    sql: ${TABLE}.num_of_milestone_wins

  - dimension: registrant_id
    type: number
    sql: ${TABLE}.registrant_id

  - measure: count
    type: count
    drill_fields: [contest.contest_id, contest.contest_name, contest.project_category_name]

