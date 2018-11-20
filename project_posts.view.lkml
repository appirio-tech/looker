view: connect_messages {
  sql_table_name: public.project_posts ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cooked {
    label: "HTML Text"
    type: string
    description: "HTML Text, shows first 1000 characters"
    sql: ${TABLE}.cooked ;;
  }

  dimension_group: createdat {
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
    sql: ${TABLE}.createdat ;;
  }

  dimension: createdby {
    type: number
    sql: ${TABLE}.createdby ;;
  }

  dimension_group: deletedat {
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
    sql: ${TABLE}.deletedat ;;
  }

  dimension: deletedby {
    type: number
    sql: ${TABLE}.deletedby ;;
  }

  dimension: discoursepostid {
    type: number
    value_format_name: id
    sql: ${TABLE}.discoursepostid ;;
  }

  dimension: discoursetopicid {
    type: number
    value_format_name: id
    sql: ${TABLE}.discoursetopicid ;;
  }

  dimension: hidden {
    type: yesno
    sql: ${TABLE}.hidden ;;
  }

  dimension: hiddenreason {
    type: string
    sql: ${TABLE}.hiddenreason ;;
  }

  dimension: highestpostnumber {
    type: number
    sql: ${TABLE}.highestpostnumber ;;
  }

  dimension: postnumber {
    type: number
    sql: ${TABLE}.postnumber ;;
  }

  dimension: project_id {
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension: raw {
    type: string
    description: "Raw Text, shows first 1000 characters"
    sql: ${TABLE}."raw" ;;
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

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: topic_archived {
    type: yesno
    sql: ${TABLE}.topic_archived ;;
  }

  dimension: topic_closed {
    type: yesno
    sql: ${TABLE}.topic_closed ;;
  }

  dimension: topic_hidden {
    type: yesno
    sql: ${TABLE}.topic_hidden ;;
  }

  dimension: topic_hiddenreason {
    type: string
    sql: ${TABLE}.topic_hiddenreason ;;
  }

  dimension: topic_tags {
    type: string
    sql: ${TABLE}.topic_tags ;;
  }

  dimension: topicid {
    type: number
    value_format_name: id
    sql: ${TABLE}.topicid ;;
  }

  dimension_group: updatedat {
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
    sql: ${TABLE}.updatedat ;;
  }

  dimension: updatedby {
    type: number
    sql: ${TABLE}.updatedby ;;
  }

  dimension: viaemail {
    type: yesno
    sql: ${TABLE}.viaemail ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
