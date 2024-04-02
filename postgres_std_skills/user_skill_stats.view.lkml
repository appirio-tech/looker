view: user_skill_stats {
  sql_table_name: public.user_skill ;;

  dimension: user_skill_id {
    primary_key: yes
    type: string
    hidden: no
    sql: ${TABLE}.id ;;
  }

  dimension: user_id {
    type: number
    hidden: no
    sql: ${TABLE}.user_id ;;
  }

  dimension: skill_id {
    type: string
    hidden: no
    sql: ${TABLE}.skill_id ;;
  }

  dimension: user_skill_level_id {
    type: string
    hidden: no
    sql: ${TABLE}.user_skill_level_id ;;
  }

  dimension: user_skill_display_mode_id {
    type: string
    description: "User Skill Display Mode Id"
    sql: ${TABLE}.user_skill_display_mode_id ;;
  }

  dimension_group: created_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_year,
      fiscal_quarter,
      fiscal_month_num,
      fiscal_quarter_of_year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_year,
      fiscal_quarter,
      fiscal_month_num,
      fiscal_quarter_of_year
    ]
    sql: ${TABLE}.updated_at ;;
  }

}
