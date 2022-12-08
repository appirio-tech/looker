view: auth0_derived_table {
  derived_table: {
    sql:
With t1 as (SELECT
  DISTINCT user_id,
  user_name,
  login_date,
  max(login_number) over (
    partition by login_date, user_name
  ) num_logins,
  session_connection,
  year,
  month,
  day
FROM
  (
    SELECT
      user_id,
      user_name,
      type,
      DATE_TRUNC('day', date) as login_date,
      ROW_NUMBER() OVER(PARTITION BY login_date, user_id) as login_number,
      session_connection,
      year,
      month,
      day
    FROM
      spectrum.auth0
    WHERE
      type = 's'
      and client_name <> ''
       and client_name = 'Account-App-New-Flow'
       and user_name not like '%topcoder.com%' and user_name not like '%wipro.com%'
    ORDER BY
      login_date,
      user_name,
      login_number
  )
      ORDER BY
       user_name,
      login_date desc),


      t3 as (SELECT
  DISTINCT user_id,
  user_name,
  login_date,
  max(login_number) over (
    partition by login_date, user_name
  ) num_logins,
  session_connection,
  year,
  month,
  day,
  (day-1) as previous
FROM
  (
    SELECT
      user_id,
      user_name,
      type,
      DATE_TRUNC('day', date) as login_date,
      ROW_NUMBER() OVER(PARTITION BY login_date, user_id) as login_number,
      session_connection,
      year,
      month,
      day
    FROM
      spectrum.auth0
    WHERE
      type = 's'
      and client_name <> ''
       and client_name = 'Account-App-New-Flow'
        and user_name not like '%topcoder.com%' and user_name not like '%wipro.com%'
    ORDER BY
      login_date,
      user_name,
      login_number
  )
      ORDER BY
       user_name,
      login_date desc),


     t2 as (select distinct t1.user_id,
  t1.user_name,
  t1.login_date,
  t1.num_logins,  t1.session_connection,
  t1.year,
  t1.month,
  t1.day,
  t3.day as day1,
  t3.previous





  from t1 inner join t3 on t1.day = t3.previous  and t3.month = t1.month and t3.year = t1.year and  t3.user_id = t1.user_id

  order by
    user_name,
      login_date desc)



       select
  t1.user_id,
  t1.user_name,
  t1.login_date,
t1.session_connection,
  t1.year,
  t1.month,
  t1.day,
  case when t2.day1 is null then 0 else 1 end as "repeat"


FROM T1 left join t2 on t1.user_id = t2.user_id and t1.day = t2.day1 and t2.month = t1.month and t2.year = t1.year
 ORDER BY
       t1.user_name,
      t1.login_date desc

       ;;

    persist_for: "8 hours" #Persist for 8 hours as data gets loaded in every 8 hours
    distribution_style: even #Required for saving the look
    indexes: ["user_id"]


  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: repeat_user_count{
    type: sum
    sql: ${repeat} ;;
    drill_fields: [detail*]
  }

  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension_group: login_date {
    type: time
    sql: ${TABLE}.login_date ;;
  }

  dimension: repeat {
    type: number
    sql: ${TABLE}.repeat ;;
  }

  dimension: session_connection {
    type: string
    sql: ${TABLE}.session_connection ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: day {
    type: number
    sql: ${TABLE}.day ;;
  }




  set: detail {
    fields: [
      user_id,
      user_name,
      login_date_time,
      session_connection,
      year,
      month,
      day
    ]
  }

}
