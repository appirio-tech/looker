view: member_activity_tenure {
  derived_table: {
    sql: (SELECT
  "user".handle  AS "user.handle",
  MAX(DATE(challenge_stats.registration_end_date )) AS "Max Registration Date"
FROM looker_pdt.LR$QHASPUTBIADG08H05IT0G_challenge_stats AS challenge_stats
INNER JOIN tcs_dw.coder  AS "user" ON challenge_stats.registrant_id = ("user".coder_id)
--WHERE (("user".handle) ILIKE 'asmn')
GROUP BY 1) as a
LEFT JOIN (SELECT
payee.handle  AS "payee.handle",
  MIN(DATE(payment_paid_date.date )) AS "First Payment date",
  COALESCE(COALESCE(CAST( ( SUM(DISTINCT (CAST(FLOOR(COALESCE(user_payment.total_amount ,0)*(1000000*1.0)) AS DECIMAL(38,0))) + CAST(STRTOL(LEFT(MD5(CONVERT(VARCHAR,CONCAT(user_payment.payment_id, user_payment.user_id) )),15),16) AS DECIMAL(38,0))* 1.0e8 + CAST(STRTOL(RIGHT(MD5(CONVERT(VARCHAR,CONCAT(user_payment.payment_id, user_payment.user_id) )),15),16) AS DECIMAL(38,0)) ) - SUM(DISTINCT CAST(STRTOL(LEFT(MD5(CONVERT(VARCHAR,CONCAT(user_payment.payment_id, user_payment.user_id) )),15),16) AS DECIMAL(38,0))* 1.0e8 + CAST(STRTOL(RIGHT(MD5(CONVERT(VARCHAR,CONCAT(user_payment.payment_id, user_payment.user_id) )),15),16) AS DECIMAL(38,0))) )  AS DOUBLE PRECISION) / CAST((1000000*1.0) AS DOUBLE PRECISION), 0), 0) AS "total payment"
  FROM tcs_dw.payment  AS payment
INNER JOIN tcs_dw.user_payment  AS user_payment ON payment.payment_id = user_payment.payment_id
INNER JOIN tcs_dw.coder  AS payee ON user_payment.user_id = payee.coder_id
INNER JOIN topcoder_dw.calendar  AS payment_paid_date ON user_payment.paid_calendar_id = payment_paid_date.calendar_id

--WHERE (payee.handle ILIKE 'asmn')
  GROUP BY 1) as b
on a."user.handle"=b."payee.handle" ;;
  }

  dimension_group: Max_Registration_Date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.max_registration_date ;;
  }

  dimension_group: first_payment_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.first_payment_date ;;
  }

  dimension: user_handle {
    type: string
    sql: ${TABLE}.user_handle ;;
  }

  dimension: payee_handle {
    type: string
    sql: ${TABLE}.payee_handle ;;
  }

  dimension:  Total_payment {
    type: number
    sql:  ${TABLE}.total_payment ;;
  }


}
