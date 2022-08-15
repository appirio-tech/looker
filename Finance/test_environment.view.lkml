view: test_environment {
  derived_table: {
    sql: with t1 as (select
      (TO_CHAR(DATE_TRUNC('week', "time"), 'YYYY-MM-DD')) AS Week1,
      count(*) as Count1

      from "heapdata"."pageviews"
      where "domain" = 'www.topcoder.com'
      GROUP BY
      (DATE_TRUNC('week', "time"))
      Order by 1 desc
      limit 50),

      t2 as (select *,
      avg(count1) OVER(ORDER BY Week1
      ROWS BETWEEN 11 PRECEDING AND CURRENT ROW )
      as MovingAvg
      from t1
      order by week1 desc),

      t3 as (select * from t2
      order by Week1 desc
      limit 8)

      select * from t3
      order by week1 asc
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: week1 {
    type: string
    sql: ${TABLE}.week1 ;;
  }

  dimension: count1 {
    type: number
    sql: ${TABLE}.count1 ;;
  }

  dimension: movingavg {
    type: number
    sql: ${TABLE}.movingavg ;;
  }

  set: detail {
    fields: [week1, count1, movingavg]
  }
}
