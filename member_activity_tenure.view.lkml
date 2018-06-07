view: member_activity_tenure {
  derived_table: {
    sql: SELECT *
    FROM
(SELECT
  --p.project_id,
  max(p.registration_end_date) AS LATEST_REG_DATE,
  pr.user_id AS REG_USER_ID,
  challenge_registrant.handle AS REG_HANDLE
  FROM tcs_dw.project p INNER JOIN tcs_dw.project_result pr ON p.project_id = pr.project_id
  INNER JOIN tcs_dw.coder c ON pr.user_id = c.coder_id
  INNER JOIN tcs_dw.coder challenge_registrant ON pr.user_id = challenge_registrant.coder_id
  --WHERE challenge_registrant.handle = 'asmn'
  group by 2,3) AS A

LEFT JOIN
(SELECT
        --p.reference_id,
        up.user_id AS PAYEE_ID ,
        payee.handle AS PAYEE_HANDLE,
        MIN(paid_date.date) AS FIRST_PAID_DATE,
        sum(up.net_amount) AS AMOUNT
    FROM
    tcs_dw.user_payment up,
    tcs_dw.calendar paid_date,
    tcs_dw.coder payee,
    tcs_dw.payment p
    WHERE p.payment_id = up.payment_id
      AND up.paid_calendar_id = paid_date.calendar_id
      AND up.user_id = payee.coder_id
      --AND payee.handle = 'asmn'
      group by 1,2) AS B

ON A.reg_user_id = B.payee_id
--AND A.project_id = B.reference_id
        ;;
  }

  dimension_group: latest_reg_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.latest_reg_date ;;
    }

  dimension: reg_user_id {
   type: number
    sql: ${TABLE}.reg_user_id ;;
  }

  dimension: payee_id {
    type: number
    sql: ${TABLE}.payee_id ;;
  }

  dimension: reg_handle {
    type: string
    sql: ${TABLE}.reg_handle ;;
  }

  dimension: payee_handle {
    type: string
    sql: ${TABLE}.payee_handle ;;
  }

    dimension_group: first_paid_date {
    type: time
    description: "First paid date can be after latest registration date in case of Royalty payments, coder referral payment etc."
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.first_paid_date ;;
  }

 measure: amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.amount ;;
  }

}
