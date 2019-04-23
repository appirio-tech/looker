view: connect_messages {
  sql_table_name: public.project_posts ;;

  dimension: id {
    primary_key: yes
    hidden: no
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cooked {
    label: "HTML Text"
    type: string
    description: "HTML Formatted Message , shows the first 1000 characters only"
    sql: ${TABLE}.cooked ;;
  }

  dimension_group: created_at {
    type: time
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
    sql: ${TABLE}.createdat ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}.createdby ;;
  }

  dimension_group: deleted_at {
    type: time
    hidden: yes
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
    sql: ${TABLE}.deletedat ;;
  }

  dimension: deleted_by {
    type: number
    hidden: yes
    sql: ${TABLE}.deletedby ;;
  }

  dimension: discoursepostid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.discoursepostid ;;
  }

  dimension: discoursetopicid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.discoursetopicid ;;
  }

  dimension: hidden {
    description: "If the post is hidden and not shown to the user on UI"
    type: yesno
    sql: ${TABLE}.hidden ;;
  }

  dimension: hidden_reason {
    description: "Reason for hiding the post"
    type: string
    sql: ${TABLE}.hiddenreason ;;
  }

  dimension: highest_post_number {
    description: "Highest post  for the group of posts under a topic"
    type: number
    sql: ${TABLE}.highestpostnumber ;;
  }

  dimension: post_number {
    type: number
    sql: ${TABLE}.postnumber ;;
  }

  dimension: project_id {
    type: number
    hidden: yes
    sql: ${TABLE}.project_id ;;
  }

  dimension: raw {
    type: string
    description: "Raw Text, shows first 1000 characters only"
    sql: ${TABLE}."raw" ;;
  }

  dimension: reference {
    type: string
    hidden: no
    sql: ${TABLE}.reference ;;
  }

  dimension: referenceid {
    type: string
    hidden: no
    sql: ${TABLE}.referenceid ;;
  }

  dimension: tag {
    type: string
    sql: ${TABLE}."tag" ;;
  }

  dimension: title {
    type: string
    description: "Title for the posts"
    sql: ${TABLE}.title ;;
  }

  dimension: topic_archived {
    type: yesno
    description: "Is the topic marked Archived ?"
    sql: ${TABLE}.topic_archived ;;
  }

  dimension: topic_closed {
    type: yesno
    description: "Is the topic marked closed ?"
    sql: ${TABLE}.topic_closed ;;
  }

  dimension: topic_hidden {
    type: yesno
    description: "Is the topic hidden  ?"
    sql: ${TABLE}.topic_hidden ;;
  }

  dimension: topic_hidden_reason {
    type: string
    sql: ${TABLE}.topic_hiddenreason ;;
  }

  dimension: topic_tags {
    type: string
    sql: ${TABLE}.topic_tags ;;
  }

  dimension: topicid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.topicid ;;
  }

  dimension_group: updated_at {
    type: time
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
    sql: ${TABLE}.updatedat ;;
  }

  dimension: updated_by {
    type: number
    sql: ${TABLE}.updatedby ;;
  }

  dimension: via_email {
    type: yesno
    description: "Is the message created via an email message ?"
    sql: ${TABLE}.viaemail ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
