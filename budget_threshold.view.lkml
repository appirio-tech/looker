view: budget_threshold {
  derived_table: {
    sql: SELECT
        direct_project_dim.direct_project_id  AS "direct_project_id",
        direct_project_dim.direct_project_budget AS "direct_project_budget",
        user_payment.gross_amount AS "gross_amount",
        challenge.project_id AS "challenge_id",
        challenge_group.group_id AS "group_id",
        group_name.name AS "group_name"
      FROM tcs_dw.payment  AS payment
      INNER JOIN tcs_dw.user_payment AS user_payment ON payment.payment_id = user_payment.payment_id
      LEFT JOIN tcs_dw.project  AS challenge ON payment.reference_id = challenge.project_id
      LEFT JOIN tcs_dw.direct_project_dim  AS direct_project_dim ON challenge.tc_direct_project_id = direct_project_dim.direct_project_id
      LEFT JOIN tcs_dw.challenge_groups AS challenge_group ON challenge.project_id = challenge_group.challenge_id
      LEFT JOIN "authorization"."group" AS group_name ON challenge_group.group_id = group_name.id
       ;;
      persist_for: "2 hours"
      distribution: "challenge_id"
      sortkeys: ["challenge)id","direct_project_id"]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: direct_project_id {
    type: number
    sql: ${TABLE}.direct_project_id ;;
  }

  dimension: direct_project_budget {
    type: number
    label: "direct project budget"
    sql: ${TABLE}."direct project budget" ;;
  }

  dimension: gross_amount {
    type: number
    label: "gross amount"
    sql: ${TABLE}."gross amount" ;;
  }

  dimension: challenge_id {
    type: number
    label: "challenge id"
    sql: ${TABLE}."challenge id" ;;
  }

  dimension: group_id {
    type: number
    label: "group id"
    sql: ${TABLE}."group id" ;;
  }

  dimension: group_name {
    type: string
    label: "group name"
    sql: ${TABLE}."group name" ;;
  }
  measure: gross_amount_total {
    type: sum
    sql:  ${TABLE}.gross_amount ;;
  }

  set: detail {
    fields: [
      direct_project_id,
      direct_project_budget,
      gross_amount,
      challenge_id,
      group_id,
      group_name
    ]
  }
}
