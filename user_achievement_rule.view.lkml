view: user_achievement_rule {
  sql_table_name: tcs_dw.user_achievement_rule ;;

  dimension: user_achievement_rule_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_achievement_rule_id ;;
  }

  dimension: db_schema {
    type: string
    sql: ${TABLE}.db_schema ;;
  }

  dimension: is_automated {
    type: yesno
    sql: ${TABLE}.is_automated ;;
  }

  dimension: user_achievement_count_query {
    type: string
    sql: ${TABLE}.user_achievement_count_query ;;
  }

  dimension: user_achievement_count_sql_file {
    type: string
    sql: ${TABLE}.user_achievement_count_sql_file ;;
  }

  dimension: user_achievement_earned_sql_file {
    type: string
    sql: ${TABLE}.user_achievement_earned_sql_file ;;
  }

  dimension: user_achievement_name {
    type: string
    sql: ${TABLE}.user_achievement_name ;;
  }

  dimension: user_achievement_rule_desc {
    type: string
    sql: ${TABLE}.user_achievement_rule_desc ;;
  }

  dimension: user_achievement_rule_sql_file {
    type: string
    sql: ${TABLE}.user_achievement_rule_sql_file ;;
  }

  dimension: user_achievement_type_id {
    type: number
    sql: ${TABLE}.user_achievement_type_id ;;
  }

  measure: count {
    type: count
    drill_fields: [user_achievement_rule_id, user_achievement_name, user_achievement_xref.count]
  }
}
