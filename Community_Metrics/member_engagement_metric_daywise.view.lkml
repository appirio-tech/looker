view: member_engagement_metric_daywise {

  derived_table: {

    sql:
    SELECT date,
    (SELECT count(*) FROM heapdata.pageviews p left join heapdata.users  u on  p.user_id = u.user_id  where DATEADD(day, -1, date_trunc('day', time)) = c.date and  (u._email like '%wipro.com%' OR u._email like '%appirio.com%') ) as topgear_pageviews,
    (SELECT count(*) FROM heapdata.pageviews p left join heapdata.users  u on  p.user_id = u.user_id  where DATEADD(day, -1, date_trunc('day', time)) = c.date and  (u._email not like '%wipro.com%' AND u._email not like '%appirio.com%') ) as non_topgear_pageviews
    FROM calendar c
    WHERE c.date < getdate()
    GROUP BY 1
    ;;
  }

  dimension_group: event_date {
    type: time
    hidden: yes
    timeframes: [
      date,
      week,
      month,
      quarter
    ]
    sql: ${TABLE}.date ;;
  }

  measure: topgear_pageviews {
    description: "The total number of topgear pageviews"
    type: sum
    sql: ${TABLE}.topgear_pageviews ;;
    link: {
      label: "Drill topgear page views"
      #url: "https://topcoder.looker.com/explore/heap/pageviews?fields=pageviews.engagement_drill_fields*&f[heap_users._email]=%25wipro.com%25%2C%25appirio.com%25&f[pageviews.time_week]={{ _filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
      #url: "https://topcoder.looker.com/explore/heap/pageviews?fields=pageviews.engagement_drill_fields*&f[heap_users._email]=%25wipro.com%25%2C%25appirio.com%25&f[{% if member_engagement_metric_daywise.event_date_quarter._in_query %} pageviews.time_quarter {% else if member_engagement_metric_daywise.event_date_date._in_query %} pageviews.time_date {% else %} pageviews.time_month {% endif %}]="
        url: "https://topcoder.looker.com/explore/heap/pageviews?fields={%if date_granularity._parameter_value == 'day' %}pageviews.time_date{% elsif date_granularity._parameter_value == 'months' %}pageviews.time_month{% elsif date_granularity._parameter_value == 'week' %}pageviews.time_week{% elsif date_granularity._parameter_value == 'quarters' %}pageviews.time_quarter{% else %}{% endif %},pageviews.count&f[heap_users._email]=%25wipro.com%25%2C%25appirio.com%25&f[{% if date_granularity._parameter_value == 'day' %}pageviews.time_date{% elsif date_granularity._parameter_value == 'months' %}pageviews.time_month{% elsif date_granularity._parameter_value == 'week' %}pageviews.time_week{% elsif date_granularity._parameter_value == 'quarters' %}pageviews.time_quarter{% else %}{% endif %}]={{ _filters['member_engagement_metric_daywise.date'] | urlencode}}"
    }
    group_label: "Topgear"
  }

  measure: non_topgear_pageviews {
    description: "The total number of non topgear pageviews"
    type: sum
    sql: ${TABLE}.non_topgear_pageviews ;;
    link: {
      label: "Drill non topgear page views"
      url: "https://topcoder.looker.com/explore/heap/pageviews?fields=pageviews.engagement_drill_fields*&f[heap_users._email]=-NULL%2C-%25wipro.com%25%2C-%25appirio.com%25&f[pageviews.time_week]={{ _filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    group_label: "Non Topgear"
  }

  parameter: date_granularity {
    type: unquoted
    allowed_value: {
      label: "Break down by Day"
      value: "day"
    }
    allowed_value: {
      label: "Break down by Month"
      value: "months"
    }
    allowed_value: {
      label: "Break down by Week"
      value: "week"
    }
    allowed_value: {
      label: "Break down by quarter"
      value: "quarters"
    }
  }

  dimension: date {
    type: date
    sql:
    {% if date_granularity._parameter_value == 'day' %}
      ${event_date_date}
    {% elsif date_granularity._parameter_value == 'months' %}
      ${event_date_month}
    {% elsif date_granularity._parameter_value == 'week' %}
      ${event_date_week}
    {% elsif date_granularity._parameter_value == 'quarters' %}
      ${event_date_quarter}
    {% else %}
    {% endif %};;
  }


}
