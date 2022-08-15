view: home_page_skill_visitors {
  derived_table: {
    sql: with t1 as (SELECT distinct
      (TO_CHAR(DATE_TRUNC('month', "pageviews"."time"), 'YYYY-MM')) AS pageview_month,
      "heap_users"."user_id" AS "heap_users.user_id",
      member.user_id as user_id,
      member.email as email,
      member.status as status,
      member.handle as handle,
      member_skill.skill_id as skill_id,
      skill.name as name

      FROM
      "heapdata"."pageviews" AS "pageviews"
      LEFT JOIN "heapdata"."users" AS "heap_users" ON "pageviews"."user_id" = "heap_users"."user_id"
      left join tcs_dw.member_profile as member on member.user_id = "heap_users"."id"
      left join tcs_dw.coder as coder on member.user_id = coder.coder_id
      LEFT JOIN tcs_dw.member_skill AS member_skill ON  member.user_id = member_skill.user_id
      LEFT JOIN tcs_dw.skill  AS skill ON member_skill.skill_id = skill.skill_id
      where skill.name is not null
      and member.status = 'ACTIVE'
      and member.email  NOT LIKE '%wipro.com%' AND member.email NOT LIKE '%topcoder.com%' AND member.email NOT LIKE '%appirio.com%' and member.email <> ' '
      and  "pageviews"."domain" IN ('discussions.topcoder.com', 'www.topcoder.com') AND "pageviews"."path" = '/home' AND ((( "pageviews"."time" ) >= ((DATEADD(month,-9, DATE_TRUNC('month', DATE_TRUNC('day',GETDATE())) ))) AND ( "pageviews"."time" ) < ((DATEADD(month,10, DATEADD(month,-9, DATE_TRUNC('month', DATE_TRUNC('day',GETDATE())) ) )))))

      )
      select
      t1.pageview_month as pageview_month,
      t1.handle as handle,
      count(t1.skill_id) as skill_count

      from t1
      group by handle,pageview_month
      order by t1.pageview_month,count(t1.skill_id) desc
      ;;
  }

  measure: count {
    type: count
    drill_fields: [handle,skill_count]
  }

  dimension: pageview_month {
    type: string
    sql: ${TABLE}.pageview_month ;;
  }

  dimension: handle {
    type: string
    sql: ${TABLE}.handle ;;
  }

  dimension: skill_count {
    type: number
    sql: ${TABLE}.skill_count ;;
  }

  set: detail {
    fields: [pageview_month, handle, skill_count]
  }
}
