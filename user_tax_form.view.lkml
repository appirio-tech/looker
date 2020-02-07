view: user_tax_form {
  sql_table_name: tcs_dw.user_tax_form ;;


  dimension_group: date_filed {
    type: time
    description: "Date on which the tax form has been filed"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date_filed ;;
  }

  dimension: tax_form_desc {
    type: string
    description: "Description of the tax form"
    sql: ${TABLE}.tax_form_desc ;;
  }

  dimension: tax_form_id {
    type: number
    hidden: yes
    sql: ${TABLE}.tax_form_id ;;
  }

  dimension: tax_form_name {
    type: string
    description: "Name of the tax form eg. W-8,W-9"
    sql: ${TABLE}.tax_form_name ;;
  }

  dimension: tax_form_status {
    type: string
    description: "Status of the tax form eg. Active, Inactive"
    sql: ${TABLE}.tax_form_status ;;
  }

  dimension: use_percentage {
    type: number

    sql: ${TABLE}.use_percentage ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: withholding_amount {
    type: number
    sql: ${TABLE}.withholding_amount ;;
  }

  dimension: withholding_percentage {
    type: number
    sql: ${TABLE}.withholding_percentage ;;
  }

  measure: count {
    type: count
    drill_fields: [tax_form_name]
  }
}
