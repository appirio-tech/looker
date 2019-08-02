view: member_verification {
  sql_table_name: tcs_dw.member_verification ;;

  dimension: country {
    type: string
    map_layer_name: countries
    description: "User Provided Country for verification"
    sql: ${TABLE}.country ;;
  }

  dimension: matched_on {
    type: string
    description: "Documents that were matched for verification"
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
    description: "Verification form sent on date"
    sql: ${TABLE}.sent_on ;;
  }

  dimension: status {
    type: string
    description: "If the user is verified"
    sql: ${TABLE}.status ;;
  }

  dimension: transaction_record_id {
    type: string
    description: "Trulio provided Transaction Id for verification"
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
    description: "Verification completed on"
    sql: ${TABLE}.verification_date ;;
  }

  dimension: verification_mode {
    type: string
    description: "Verification done via Digital or Document mode"
    sql: ${TABLE}.verification_mode ;;
  }

  dimension: watch_list {
    type: string
    description: "If the user is on watch list report by Truilio"
    sql: ${TABLE}.watch_list ;;
  }

  measure: member_verification_count {
    type: count

    drill_fields: [
      country, sent_date, status, matched_on,watch_list, transaction_record_id, verification_date
    ]
  }
}
