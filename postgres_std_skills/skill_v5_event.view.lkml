view: skill_v5_event {
  sql_table_name: public.skill_event ;;

  dimension: skill_event_id {
    primary_key: yes
    type: string
    hidden: no
    sql: ${TABLE}.id ;;
  }

  dimension: event_id {
    type: string
    hidden: no
    sql: ${TABLE}.event_id ;;
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

  dimension: skill_event_type_id {
    type: string
    hidden: no
    sql: ${TABLE}.skill_event_type_id ;;
  }

  dimension: source_id {
    type: string
    hidden: no
    sql: ${TABLE}.source_id ;;
  }

  dimension: source_type_id {
    type: string
    hidden: no
    sql: ${TABLE}.source_type_id ;;
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

}
