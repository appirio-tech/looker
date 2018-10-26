view: member_customer_info {
  sql_table_name: tcs_dw.member_customer_info ;;

  dimension: business_email {
    type: string
    sql: ${TABLE}.business_email ;;
  }

  dimension: business_phone {
    type: string
    sql: ${TABLE}.business_phone ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: company_size {
    type: string
    description: "size of the company a particular member owns like 1-50 or 500+ etc."
    sql: ${TABLE}.company_size ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}.created_by ;;
  }

  dimension: first_last_name {
    type: string
    sql: ${TABLE}.first_last_name ;;
  }

  dimension: title {
    type: string
    description: "primary role of a member like Android Developer, Researcher"
    sql: ${TABLE}.title ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: updated_by {
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  dimension: user_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [company_name, first_last_name]
  }
}
