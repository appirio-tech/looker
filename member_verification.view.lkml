view: member_verification {
  sql_table_name: tcs_dw.member_verification ;;

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: matched_on {
    type: string
    sql: ${TABLE}.matched_on ;;
  }

  dimension_group: sent {
    type: time
    timeframes: [
      raw,
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
    convert_tz: no
    datatype: date
    sql: ${TABLE}.sent_on ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: transaction_record_id {
    type: string
    sql: ${TABLE}.transaction_record_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: verification {
    type: time
    timeframes: [
      raw,
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
    convert_tz: no
    datatype: date
    sql: ${TABLE}.verification_date ;;
  }

  dimension: verification_mode {
    type: string
    sql: ${TABLE}.verification_mode ;;
  }

  dimension: watch_list {
    type: string
    sql: ${TABLE}.watch_list ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
