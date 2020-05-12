view: jive_forum {
  derived_table: {
    sql: select
      category.category_id  as category_id,
      category.creationdate / 1000 as category_created_date,
      category.description  as category_decription,
      category.name as category_name,
      category.modificationdate / 1000 as category_modify_date,
      category.is_deleted as category_is_deleted,
      category.deleted_at as category_deleted_at,

      forum.forum_id as forum_id,
      forum.creationdate / 1000 as forum_created_date,
      forum.description as forum_description,
      forum.name as forum_name,
      forum.modificationdate/ 1000 as forum_modify_date,

      message.message_id as message_id,
      message.creationdate / 1000 as message_created_date,
      message.modificationdate / 1000 as message_modify_date,
      message.subject as subject,
      message.thread_id as thread_id,
      message.user_id as user_id

      from jive_category as category

      inner join jive_forum as forum ON category.category_id = forum.category_id
      left join jive_message message ON forum.forum_id = message.forum_id
       ;;
    persist_for: "24 hours"
    distribution_style: "even"
    indexes: ["category_id", "forum_id", "message_id"]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: message_count {
    type: count_distinct
    description: "Count of Distinct Messages"
    sql: ${message_id} ;;
  }

  measure: category_count {
    type: count_distinct
    description: "Count of Distinct Categories"
    sql: ${category_id} ;;
  }

  measure: forum_count {
    type: count_distinct
    description: "Count of Distinct Forums"
    sql: ${forum_id};;
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }

  dimension: category_is_deleted {
    type: yesno
    sql: ${TABLE}.category_is_deleted ;;
  }



  dimension_group: category_created {
    type: time
    datatype: epoch
    sql: ${TABLE}.category_created_date ;;
  }

  dimension: category_decription {
    type: string
    sql: ${TABLE}.category_decription ;;
  }

  dimension: category_name {
    type: string
    sql: ${TABLE}.category_name ;;
  }

  dimension_group: category_modify {
    type: time
    datatype: epoch
    sql: ${TABLE}.category_modify_date ;;
  }

  dimension_group: category_deleted_at {
    type: time
    datatype: date
    sql: ${TABLE}.category_deleted_at ;;
  }

  dimension: forum_id {
    type: number
    sql: ${TABLE}.forum_id ;;
  }

  dimension_group: forum_created {
    type: time
    datatype: epoch
    sql: ${TABLE}.forum_created_date ;;
  }

  dimension: forum_description {
    type: string
    sql: ${TABLE}.forum_description ;;
  }

  dimension: forum_name {
    type: string
    sql: ${TABLE}.forum_name ;;
  }

  dimension_group: forum_modify {
    type: time
    datatype: epoch
    sql: ${TABLE}.forum_modify_date ;;
  }

  dimension: message_id {
    type: number
    sql: ${TABLE}.message_id ;;
  }

  dimension_group: message_created {
    type: time
    datatype: epoch
    sql: ${TABLE}.message_created_date ;;
  }

  dimension_group: message_modify {
    type: time
    datatype: epoch
    sql: ${TABLE}.message_modify_date ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: thread_id {
    type: number
    sql: ${TABLE}.thread_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  set: detail {
    fields: [
      category_id,
      category_created_date,
      category_decription,
      category_name,
      category_modify_date,
      forum_id,
      forum_created_date,
      forum_description,
      forum_name,
      forum_modify_date,
      message_id,
      message_created_date,
      message_modify_date,
      subject,
      thread_id,
      user_id
    ]
  }
}
