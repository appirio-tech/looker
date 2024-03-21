view: v5_source_type {
  sql_table_name: public.source_type ;;

  dimension: id {
    primary_key: yes
    type: string
    hidden: no
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    description: "Source type Name"
    sql: ${TABLE}.name ;;
  }

  dimension: description {
    type: string
    description: "Source type description"
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
