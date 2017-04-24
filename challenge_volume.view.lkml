view: challenge_volume {
  derived_table: {
    sql: select NVL(contest_id::varchar(18), reference_id) as challenge_id
         , client_id as client_id
         , billing_project_id as billing_account_id
         , direct_project_id
         , NVL(category, 'jira') as challenge_category_name
         , min(payment_date) as payment_date
         , count(*)
      from cost_transaction
      where not ( line_item_category = 'Contest Fee' and contest_id is null)
        and line_item_category != 'Contest Fee'
      group by 1, 2, 3, 4, 5
       ;;
    sortkeys: ["challenge_category_name"]
    distribution: "challenge_category_name"
    persist_for: "8 hours"

  }

  dimension: challenge_id {
    description: "Unique ID for each challenge. This will be the challenge ID or the Jira ticket ID"
    type: number
    sql: ${TABLE}.challenge_id ;;
  }

  dimension: client_id {
    description: "Unique ID for each client record."
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: billing_account_id {
    type: number
    sql: ${TABLE}.billing_account_id ;;
  }

  dimension: direct_project_id {
    type: number
    sql: ${TABLE}.direct_project_id ;;
  }

  dimension: challenge_category_name {
    type: string
    sql: ${TABLE}.challenge_category_name ;;
  }

  dimension_group: payment_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.payment_date ;;
  }

  measure: count {
    type: count
  }
}
