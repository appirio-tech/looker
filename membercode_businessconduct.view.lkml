view: membercode_businessconduct {
  sql_table_name: tcs_dw.membercode_businessconduct ;;

  dimension: answer {
    type: yesno
    sql: ${TABLE}.answer ;;
  }

  dimension: durationinseconds {
    type: number
    sql: ${TABLE}.durationinseconds ;;
  }

  dimension_group: enddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.enddate ;;
  }

  dimension: ipaddress {
    type: string
    sql: ${TABLE}.ipaddress ;;
  }

  dimension: questioncode {
    type: string
    sql: ${TABLE}.questioncode ;;
  }

  dimension: questiontext {
    type: string
    sql: ${TABLE}.questiontext ;;
  }

  dimension: responseid {
    type: string
    sql: ${TABLE}.responseid ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension_group: startdate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.startdate ;;
  }

  dimension: userid {
    type: number
    value_format_name: id
    sql: ${TABLE}.userid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
