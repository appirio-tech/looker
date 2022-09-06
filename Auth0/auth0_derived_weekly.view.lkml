view: auth0_derived_weekly {
  derived_table: {
    sql: With t1 as (SELECT
        DISTINCT user_id,
        user_name,
        year,
        month,
        EXTRACT( week FROM (login_date + '1 day'::interval)) as week

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
      EXTRACT( week FROM (login_date + '1 day'::interval))
      desc),


      t3 as (SELECT
      DISTINCT user_id,
      user_name,
      year,
      month,
      EXTRACT( week FROM (login_date + '1 day'::interval)) as week,
      (  EXTRACT( week FROM (login_date + '1 day'::interval)) - 1) as previous
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
       EXTRACT( week FROM (login_date + '1 day'::interval)) desc),


      t2 as (select distinct t1.user_id,
      t1.user_name,
      t1.year,
      t1.month,
      t1.week,
      t3.week as week1,
      t3.previous





      from t1 inner join t3 on t1.week = t3.previous  and t3.month = t1.month and t3.year = t1.year and  t3.user_id = t1.user_id

      order by
      user_name,
      t1.week  desc)

      select
      t1.user_id,
      t1.user_name,
      t1.year,
      t1.month,
      t1.week,
      case when t2.week1 is null then 0 else 1 end as "repeat"



      FROM T1 left join t2 on t1.user_id = t2.user_id and t1.week = t2.week1 and t2.month = t1.month and t2.year = t1.year
      ORDER BY
      t1.user_name,
      t1.week desc
      ;;

    persist_for: "8 hours" #Persist for 8 hours as data gets loaded in every 8 hours
    distribution_style: even #Required for saving the look
    indexes: ["t1.user_id"]

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

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: week {
    type: number
    sql: ${TABLE}.week ;;
  }

  dimension: repeat {
    type: number
    sql: ${TABLE}.repeat ;;
  }

  set: detail {
    fields: [
      user_id,
      user_name,
      year,
      month,
      week,
      repeat
    ]
  }
}
