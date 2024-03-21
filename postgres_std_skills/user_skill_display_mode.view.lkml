view: user_skill_display_mode {
  sql_table_name: public.user_skill_display_mode ;;

  dimension: id {
    primary_key: yes
    type: string
    hidden: no
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    description: "User skill display mode Name"
    sql: ${TABLE}.name ;;
  }

  dimension: description {
    type: string
    description: "User skill display mode description"
    sql: ${TABLE}.description ;;
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
