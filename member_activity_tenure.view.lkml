view: member_activity_tenure {
  derived_table: {
    sql: SELECT *,
    ABS(DATEDIFF(DAY,A.LATEST_REGISTRATION,B.FIRST_PAID)) AS Compete_tenure_Days
    FROM
(SELECT
  --p.project_id,
  max(p.registration_end_date) AS LATEST_REGISTRATION,
  pr.user_id AS REGISTRATION_USER_ID,
  challenge_registrant.handle AS HANDLE
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
        MIN(paid_date.date) AS FIRST_PAID,
        sum(up.net_amount) AS PRIZE_MONEY
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

ON A.registration_user_id = B.payee_id
--AND A.project_id = B.reference_id
    ;;
  }

  dimension_group: latest_registration {
    type: time
    description: "Last registration by member"
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.latest_registration ;;
    }

  dimension: registration_user_id {
   type: number
    sql: ${TABLE}.registration_user_id ;;
  }

  dimension: handle {
    type: string
    sql: ${TABLE}.handle ;;
  }

  dimension_group: first_paid {
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
    sql: ${TABLE}.first_paid ;;
  }

 measure: prize_money {
    type: sum
    description:"Sum of prize money won"
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.prize_money ;;
  }

  measure: count {
    type: count
  }

  dimension: Compete_tenure_Days{
  type: number
  description: "Compete tenure in days"
   sql: ${TABLE}.Compete_tenure_days  ;;

 }
  dimension: Compete_tenure_Months {
    type: number
    description: "Approximate calculation by dividing Compete tenure in days by 30"
    sql:  (${TABLE}.Compete_tenure_days / 30);;
  }

  dimension: Compete_tenure_year {
   type: number
   description: "Approximate calculation by dividing Compete tenure in days by 365"
   sql:  (${TABLE}.Compete_tenure_days / 365);;
  }


}
