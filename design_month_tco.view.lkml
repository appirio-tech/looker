view: design_month_tco {
  sql_table_name: tcs_dw.design_month_tco ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: challenge_id {
    type: number
    description : "Unique identifier for the challenge"
    sql: ${TABLE}.challenge_id ;;
  }

  dimension: challenge_name {
    type: string
    description :"Name of the challenge"
    sql: ${TABLE}.challenge_name ;;
  }

  dimension: handle {
    type: string
    description :"User Handle"
    sql: ${TABLE}.handle ;;
  }

  measure: points {
    type: sum
    sql: ${TABLE}.points ;;
  }

  dimension: user_id {
    type: number
    description :"Unique identifier for the user"
    sql: ${TABLE}.user_id ;;
  }

  dimension: year {
    type: number
    description :"year of the campaign"
    sql: ${TABLE}.year;;
  }

  dimension: member_type {
    type: string
    sql: ${TABLE}.member_type;;
  }

  measure: count {
    type: count
    drill_fields: [id, challenge_name]
  }
}
