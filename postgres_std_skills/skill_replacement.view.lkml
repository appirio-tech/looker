view: skill_replacement {
  sql_table_name: public.skill_replacement ;;

  dimension: skill_id {
    primary_key: yes
    type: string
    hidden: no
    sql: ${TABLE}.skill_id ;;
  }


  dimension: replacing_skill_id {
    type: string
    hidden: no
    sql: ${TABLE}.replacing_skill_id ;;
  }


  dimension: category_id {
    type: string
    hidden: no
    sql: ${TABLE}.category_id ;;
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
