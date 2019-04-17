view: connect_templates {
  sql_table_name: tcs_dw.connect_templates ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: aliases {
    type: string
    hidden: yes
    sql: ${TABLE}.aliases ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
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

  dimension: disabled {
    type: yesno
    sql: ${TABLE}.disabled ;;
  }

  dimension: hidden {
    type: yesno
    sql: ${TABLE}.hidden ;;
  }

  dimension: icon {
    type: string
    hidden: yes
    sql: ${TABLE}.icon ;;
  }

  dimension: info {
    type: string
    sql: ${TABLE}.info ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: phases {
    type: string
    hidden: yes
    sql: ${TABLE}.phases ;;
  }

  dimension: question {
    type: string
    sql: ${TABLE}.question ;;
  }

  dimension: scope {
    type: string
    hidden: yes
    sql: ${TABLE}.scope ;;
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

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
