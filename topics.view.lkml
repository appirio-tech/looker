view: connect_messages_1 {
  sql_table_name: public.topics ;;

  dimension: discoursetopicid {
    primary_key: yes
    type: number
    sql: ${TABLE}.discoursetopicid ;;
  }

  dimension_group: createdate {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.createdat ;;
  }

  dimension: createdby {
    type: string
    sql: ${TABLE}.createdby ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: referenceid {
    type: string
    sql: ${TABLE}.referenceid ;;
  }

  dimension: tag {
    type: string
    sql: ${TABLE}.tag ;;
  }

  dimension_group: updatedate {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.updatedat ;;
  }

  dimension: updatedby {
    type: string
    sql: ${TABLE}.updatedby ;;
  }

  measure: count {
    type: count
    drill_fields: [discoursetopicid, referenceid]
  }
}
