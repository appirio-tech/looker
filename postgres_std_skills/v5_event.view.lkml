view: v5_event {
  sql_table_name: public.event ;;

  dimension: id {
    primary_key: yes
    type: string
    hidden: no
    sql: ${TABLE}.id ;;
  }

  dimension: topic {
    type: string
    description: "Topic Name"
    sql: ${TABLE}.topic ;;
  }

  dimension: payload {
    type: string
    description: "payload json"
    sql: ${TABLE}.payload ;;
  }

  dimension: payload_hash {
    type: string
    description: "Payload hash"
    sql: ${TABLE}.payload_hash ;;
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
