view: loader_events {
  derived_table: {
    sql: select x.*, y.log_type_desc,z.date from update_log x
      inner join log_type_lu y ON x.log_type_id = y.log_type_id
      inner join calendar z on x.calendar_id = z.calendar_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: log_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.log_id ;;
  }

  dimension: calendar_id {
    type: number
    hidden: yes
    sql: ${TABLE}.calendar_id ;;
  }

  dimension: is_last_day_of_month {
    type: yesno
    description: "Is the Timestamp on Last Day of the Month"
    sql: EXTRACT( day from DATEADD(day,1,${log_timestamp_raw}) ) = 1 ;;
  }

  dimension: is_15th_day_of_month {
    type: yesno
    description: "Is the Timestamp on 15th Day of the Month"
    sql: EXTRACT( day from ${log_timestamp_raw} ) = 15 ;;
  }

  dimension: diff_days {
    type: number
    description: "Difference in Days between today and load timestamp"
    sql: DATEDIFF( day, ${log_timestamp_raw}, GETDATE()) ;;
  }

  dimension_group: log_timestamp {
    type: time
    sql: ${TABLE}.log_timestamp ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
  }

  dimension: log_type_id {
    type: number
    sql: ${TABLE}.log_type_id ;;
  }

  dimension: log_type_desc {
    type: string
    sql: ${TABLE}.log_type_desc ;;
  }

  dimension_group: date {
    type: time
    sql: ${TABLE}.date ;;
  }

  set: detail {
    fields: [
      log_id,
      calendar_id,
      log_timestamp_time,
      log_type_id,
      log_type_desc,
      date_time
    ]
  }
}
