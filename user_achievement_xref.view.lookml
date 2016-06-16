- view: user_achievement_xref
  sql_table_name: tcs_dw.user_achievement_xref
  fields:

  - dimension: auto_loaded
    type: yesno
    sql: ${TABLE}.auto_loaded

  - dimension_group: create
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.create_date

  - dimension: is_earned_date_populated
    type: yesno
    sql: ${TABLE}.is_earned_date_populated

  - dimension: user_achievement_rule_id
    type: number
    # hidden: true
    sql: ${TABLE}.user_achievement_rule_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [user_achievement_rule.user_achievement_rule_id, user_achievement_rule.user_achievement_name]

