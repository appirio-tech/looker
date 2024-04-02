view: work_skill {
  sql_table_name: public.work_skill ;;

  dimension: work_skill_id {
    primary_key: yes
    type: string
    hidden: no
    sql: ${TABLE}.id ;;
  }

  dimension: work_id {
    type: string
    hidden: no
    sql: ${TABLE}.work_id ;;
  }

  dimension: work_type_id {
    type: string
    hidden: no
    sql: ${TABLE}.work_type_id ;;
  }

  dimension: skill_id {
    type: string
    hidden: no
    sql: ${TABLE}.skill_id ;;
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
