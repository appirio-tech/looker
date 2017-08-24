view: cognitive_registrants_2017 {
  derived_table: {
    sql: SELECT
        TO_CHAR(tcs_dw.event_registration.create_date , 'YYYY-MM') AS "SignUp Date",
        COUNT(distinct tcs_dw.event_registration.user_id ) AS "Registrant count"
      FROM tcs_dw.event_registration  where tcs_dw.event_registration.event_id = 3449 group by TO_CHAR(tcs_dw.event_registration.create_date , 'YYYY-MM')
      order by TO_CHAR( tcs_dw.event_registration.create_date , 'YYYY-MM')
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: signup_date {
    type: string
    label: "signup date"
    sql: ${TABLE}."signup date" ;;
  }

  dimension: registrant_count {
    type: number
    label: "registrant count"
    sql: ${TABLE}."registrant count" ;;
  }

  set: detail {
    fields: [signup_date, registrant_count]
  }
}
