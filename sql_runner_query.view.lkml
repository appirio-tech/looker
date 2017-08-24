view: sql_runner_query {
  derived_table: {
    sql: select count(distinct event_registration.user_id) from event_registration where event_id = 3449
      ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
  }

  set: detail {
    fields: [count]
  }
}
