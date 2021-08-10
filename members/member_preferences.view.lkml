view: member_newsletters {
  #its stored in the preferences table in dynamo db
  sql_table_name: tcs_dw.member_preferences ;;

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by {
    type: number
    hidden: yes
    sql: ${TABLE}.created_by ;;
  }

  dimension: datascience_newsletter {
    type: yesno
    description: "Subscribed - Data Science NewsLetter"
    sql: ${TABLE}.datascience_newsletter ;;
  }

  dimension: design_newsletter {
    type: yesno
    description: "Subscribed -Design NewsLetter"
    sql: ${TABLE}.design_newsletter ;;
  }

  dimension: dev_newsletter {
    type: yesno
    description: "Subscribed - Development NewsLetter"
    sql: ${TABLE}.dev_newsletter ;;
  }

  dimension: general_newsletter {
    type: yesno
    description: "Subscribed - General NewsLetter"
    sql: ${TABLE}.general_newsletter ;;
  }

  dimension: ibm_cognitive_newsletter {
    type: yesno
    description: "Subscribed - IBM Cognitive Community NewsLetter"
    sql: ${TABLE}.ibm_cognitive_newsletter ;;
  }

  dimension: ios_newsletter {
    type: yesno
    description: "Subscribed - IOS Community NewsLetter"
    sql: ${TABLE}.ios_newsletter ;;
  }

  dimension: predix_newsletter {
    type: yesno
    description: "Subscribed - Predix Community NewsLetter"
    sql: ${TABLE}.predix_newsletter ;;
  }

  dimension: tco_newsletter {
    type: yesno
    description: "Subscribed - TCO  NewsLetter"
    sql: ${TABLE}.tco_newsletter ;;
  }

  dimension: subscribed {
    type: string
    description: "Subscribed to any NewsLetter, yes indicates user has subscribed to atleast one newsletter"
    case: {
      when: {
        sql: ${TABLE}.datascience_newsletter or ${TABLE}.design_newsletter or ${TABLE}.dev_newsletter or ${TABLE}.general_newsletter or ${TABLE}.ibm_cognitive_newsletter or ${TABLE}.ios_newsletter or ${TABLE}.predix_newsletter or ${TABLE}.tco_newsletter = 'Yes' ;;
        label: "Yes"
      }
      else: "No"
    }
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
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: updated_by {
    type: number
    hidden: yes
    sql: ${TABLE}.updated_by ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
