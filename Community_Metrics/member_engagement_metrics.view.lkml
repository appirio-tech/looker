view: member_engagement_metrics {

  derived_table: {
    sql:
    SELECT date,
           (SELECT count(*) FROM heapdata.pageviews WHERE DATEADD(day, -1, date_trunc('week', time)) = c.date ) as pageviews,
           (SELECT count(*)  FROM coder WHERE status = 'A' and (email like '%wipro.com%' OR email like '%appirio.com%') and DATE(DATEADD(day,(0 - EXTRACT(DOW FROM "member_since")::integer), "member_since" )) = c.date) as topgear_sign_ups,
           (SELECT count(*)  FROM coder WHERE status = 'A' and (email not like '%wipro.com%' AND email not like '%appirio.com%') and DATE(DATEADD(day,(0 - EXTRACT(DOW FROM "member_since")::integer), "member_since" )) = c.date) as non_topgear_sign_ups,
           --(SELECT count(*) FROM project_result WHERE date_trunc('week', inquire_timestamp) = c.date ) as challenge_registrations,
           --(SELECT count(distinct user_id) FROM project_result WHERE date_trunc('week', inquire_timestamp) = c.date ) as distinct_challenge_registrants,
           --(SELECT count(*) FROM project_result WHERE date_trunc('week', submit_timestamp) = c.date AND submit_ind = 1 ) as challenge_submissions,
           --(SELECT count(distinct user_id) FROM project_result WHERE date_trunc('week', submit_timestamp) = c.date AND submit_ind = 1 ) as distinct_challenge_submitters,
           (SELECT count(*) FROM project WHERE date_trunc('week', posting_date) = c.date and status_desc not in ('Draft', 'Deleted', 'New', 'Inactive') and client_project_id != 80000062  ) as non_topgear_challenges,
           (SELECT count(*) FROM project WHERE date_trunc('week', posting_date) = c.date and status_desc not in ('Draft', 'Deleted', 'New', 'Inactive') and client_project_id = 80000062) as topgear_challenges,
           (select count(*) from (select project_id , user_id , inquire_timestamp from design_project_result union select project_id , user_id , inquire_timestamp from project_result ) as challenge_registration_union where DATEADD(day,-1,date_trunc('week', inquire_timestamp)) = c.date) as challenge_registrations,
           (select count(distinct user_id) from (select project_id , user_id , inquire_timestamp from design_project_result union select project_id , user_id , inquire_timestamp from project_result ) as challenge_registration_union where DATEADD(day,-1,date_trunc('week', inquire_timestamp)) = c.date) as distinct_challenge_registrants,
           (select count(*) from (select project_id , user_id , inquire_timestamp , submit_ind from design_project_result union select project_id , user_id , inquire_timestamp , submit_ind from project_result ) as challenge_registration_union where DATEADD(day,-1,date_trunc('week', inquire_timestamp)) = c.date and submit_ind = 1 ) as challenge_submissions,
           (select count(distinct user_id ) from (select project_id , user_id , inquire_timestamp , submit_ind from design_project_result union select project_id , user_id , inquire_timestamp , submit_ind from project_result ) as challenge_registration_union where DATEADD(day,-1,date_trunc('week', inquire_timestamp)) = c.date and submit_ind = 1 ) as distinct_challenge_submitters,
           (SELECT count(*) FROM recruit_crm_candidate WHERE DATE(DATEADD(day,(0 - EXTRACT(DOW FROM "created_on")::integer), "created_on" )) = c.date ) as gig_applicants,
           (SELECT count(*) FROM bookings_resource_bookings WHERE DATE(DATEADD(day,(0 - EXTRACT(DOW FROM "created_at")::integer), "created_at" )) = c.date) as gig_placements,
           (SELECT count(distinct user_id) FROM user_payment WHERE DATE(DATEADD(day,(0 - EXTRACT(DOW FROM "create_date")::integer), "create_date" )) = c.date ) as members_paid,
           (SELECT count(*) FROM heapdata.profile_events_success_login WHERE DATEADD(day,-1,date_trunc('week', time)) = c.date  and (email like '%wipro.com%' OR email like '%appirio.com%') ) as topgear_logins,
           (SELECT count(*) FROM heapdata.profile_events_success_login WHERE DATEADD(day,-1,date_trunc('week', time)) = c.date  and (email not like '%wipro.com%' OR email not like '%appirio.com%') ) as non_topgear_logins,
           (SELECT count(distinct nickname) FROM heapdata.profile_events_success_login WHERE DATEADD(day,-1,date_trunc('week', time)) = c.date and (email like '%wipro.com%' OR email like '%appirio.com%')  ) as topgear_distinct_logins,
           (SELECT count(distinct nickname) FROM heapdata.profile_events_success_login WHERE DATEADD(day,-1,date_trunc('week', time)) = c.date and (email not like '%wipro.com%' OR email not like '%appirio.com%')  ) as non_topgear_distinct_logins
    FROM calendar c
    WHERE c.date < getdate()
    GROUP BY 1
           ;;
  }

  # Define your dimensions and measures here, like this:
  dimension_group: event_date {
    type: time
    timeframes: [
      week
    ]
    sql: ${TABLE}.date ;;
  }

  measure: topgear_challenges {
    description: "Topgear Challenges Count"
    type: sum
    sql: ${TABLE}.topgear_challenges ;;
    link: {
      label: "Drill Topgear Challenge Count"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge?fields=challenge.engagement_metric_set*&f[challenge.client_project_id]=80000062&f[challenge.status_desc]=-Draft%2C-Deleted%2C-New%2C-Inactive&f[challenge.posting_week]={{_filters['member_engagement_metrics.event_date_week'] | urlencode}}"
    }
    group_label: "Topgear"
  }

  measure: non_topgear_challenges {
    description: "Non Topgear Challenges Count"
    type: sum
    sql: ${TABLE}.non_topgear_challenges ;;
    link: {
      label: "Drill Non Topgear Challenge Count"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge?fields=challenge.engagement_metric_set*&f[challenge.client_project_id]=not+80000062&f[challenge.status_desc]=-Draft%2C-Deleted%2C-New%2C-Inactive&f[challenge.posting_week]={{_filters['member_engagement_metrics.event_date_week'] | urlencode}}"
    }
    group_label: "Non Topgear"
  }

  measure: pageviews {
    description: "The total number of pageviews"
    type: sum
    sql: ${TABLE}.pageviews ;;
    link: {
      label: "Drill page views"
      url: "https://topcoder.looker.com/explore/heap/pageviews?fields=pageviews.engagement_drill_fields*&f[pageviews.time_week]={{ _filters['member_engagement_metrics.event_date_week'] | urlencode}}"
    }
  }

  measure: topgear_sign_ups {
    description: "Topgear total number of sign ups"
    type: sum
    link: {
      label: "Drill Topgear Signups Week "
      url: "https://topcoder.looker.com/explore/topcoder_model_main/user?fields=user.engagement_drill_fields*&f[user.email]=%25wipro.com%25%2C%25appirio.com%25&f[user.status_desc]=Active&f[user.create_week]={{ _filters['member_engagement_metrics.event_date_week'] | urlencode}}"
    }
    sql: ${TABLE}.topgear_sign_ups ;;
    group_label: "Topgear"
  }

  measure: non_topgear_sign_ups {
    description: "Non Topgear total number of sign ups"
    type: sum
    link: {
      label: "Drill Non Topgear Signups Week "
      url: "https://topcoder.looker.com/explore/topcoder_model_main/user?fields=user.engagement_drill_fields*&f[user.email]=-%25wipro.com%25%2C-%25appirio.com%25&f[user.status_desc]=Active&f[user.create_week]={{ _filters['member_engagement_metrics.event_date_week'] | urlencode}}"
    }
    sql: ${TABLE}.non_topgear_sign_ups ;;
    group_label: "Non Topgear"
  }


  measure: challenges {
    description: "The total number of challenges"
    type: sum
    sql: ${TABLE}.challenge_registrations ;;
  }

  measure: challenge_registrations {
    description: "The total number of challenge_registrations"
    type: sum
    link: {
      label: "Drill Registrations"
      #url: "https://topcoder.looker.com/explore/topcoder_model_main/user?"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge_stats?fields=challenge_stats.engagement_drill_fields_registrants*&f[challenge_stats.inquire_timestamp_week]={{ _filters['member_engagement_metrics.event_date_week'] | urlencode}}"
    }
    sql: ${TABLE}.challenge_registrations ;;
  }

  measure: distinct_challenge_registrants {
    description: "The total number of distinct_challenge_registrants"
    type: sum
    link: {
      label: "Drill Distinct Regisration"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge_stats?fields=challenge_stats.engagement_drill_fields_registrants_distinct*&f[challenge_stats.inquire_timestamp_week]={{ _filters['member_engagement_metrics.event_date_week'] | urlencode}}"
    }
    sql: ${TABLE}.distinct_challenge_registrants ;;
  }

  measure: challenge_submissions {
    description: "The total number of challenge_submissions"
    type: sum
    link: {
      label: "Drill Submissions"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge_stats?fields=challenge_stats.engagement_drill_fields_submitters*&f[challenge_stats.submit_ind]=1&f[challenge_stats.inquire_timestamp_week]={{ _filters['member_engagement_metrics.event_date_week'] | urlencode}}"
    }
    sql: ${TABLE}.challenge_submissions ;;
  }

  measure: distinct_challenge_submitters {
    description: "The total number of distinct_challenge_submitters"
    type: sum
    link: {
      label: "Drill distinct submitters"
     url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge_stats?fields=challenge_stats.engagement_drill_fields_submitters_distinct*&f[challenge_stats.submit_ind]=1&f[challenge_stats.inquire_timestamp_week]={{ _filters['member_engagement_metrics.event_date_week'] | urlencode}}"
    }
    sql: ${TABLE}.distinct_challenge_submitters ;;
  }

  measure: gig_applicants {
    description: "The total number of gig_applicants"
    type: sum
    sql: ${TABLE}.gig_applicants ;;
    link: {
      label:" Drill Weekly Gig applicant "
      url: "https://topcoder.looker.com/explore/member_profile/candidate?fields=candidate.engagement_drill_fields*&f[candidate.created_week]={{_filters['member_engagement_metrics.event_date_week'] | urlencode}}"
    }
  }

  measure: gig_placements {
    description: "The total number of gig_placements"
    type: sum
    sql: ${TABLE}.gig_placements ;;
    link: {
      label: "Drill Weekly Gig Placements"
      url: "https://topcoder.looker.com/explore/member_profile/gig?fields=resource_bookings.engagement_drill_fields*&f[resource_bookings.created_week]={{_filters['member_engagement_metrics.event_date_week'] | urlencode}}"
    }
  }

  measure: members_paid {
    description: "The total number of members_paid"
    type: sum
    sql: ${TABLE}.members_paid ;;
    link: {
      label: "Drill Payment Paid Week"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/payment?fields=payment_create_date.date_week,user_payment.distinct_user_count&fill_fields=payment_create_date.date_week&f[payment_create_date.date_week]={{_filters['member_engagement_metrics.event_date_week'] | urlencode}}"
    }

  }

  measure: topgear_logins {
    description: "The total number of logins"
    type: sum
    sql: ${TABLE}.topgear_logins ;;
    link: {
      label:"Drill Weekly Topgear Logins "
      url: "https://topcoder.looker.com/explore/heap/heap_profile_events_success_login?fields=heap_profile_events_success_login.engagement_drill_fields*&f[heap_profile_events_success_login.email]=%25wipro.com%25%2C%25appirio.com%25&f[heap_profile_events_success_login.time_week]={{_filters['member_engagement_metrics.event_date_week'] | urlencode}}"
    }
    group_label: "Topgear"
  }

  measure: non_topgear_logins {
    description: "The total number of logins"
    type: sum
    sql: ${TABLE}.non_topgear_logins ;;
    link: {
      label:"Drill Weekly Non Topgear Logins "
      url: "https://topcoder.looker.com/explore/heap/heap_profile_events_success_login?fields=heap_profile_events_success_login.engagement_drill_fields*&f[heap_profile_events_success_login.email]=-%25wipro.com%25%2C-%25appirio.com%25&f[heap_profile_events_success_login.time_week]={{_filters['member_engagement_metrics.event_date_week'] | urlencode}}"
    }
    group_label: "Non Topgear"
  }

  measure: topgear_distinct_logins {
    description: "The total number of distinct_logins"
    type: sum
    drill_fields: []
    sql: ${TABLE}.topgear_distinct_logins ;;
    link: {
      label: "Drill Weekly Topgear Distinct Logins"
      url: "https://topcoder.looker.com/explore/heap/heap_profile_events_success_login?fields=heap_profile_events_success_login.engagement_drill_fields_distinct*&f[heap_profile_events_success_login.email]=%25wipro.com%25%2C%25appirio.com%25&f[heap_profile_events_success_login.time_week]={{_filters['member_engagement_metrics.event_date_week'] | urlencode}}"
    }
    group_label: "Topgear"
  }

  measure: non_topgear_distinct_logins {
    description: "The total number of distinct_logins"
    type: sum
    drill_fields: []
    sql: ${TABLE}.non_topgear_distinct_logins ;;
    link: {
      label: "Drill Weekly Non Topgear Distinct Logins"
      url: "https://topcoder.looker.com/explore/heap/heap_profile_events_success_login?fields=heap_profile_events_success_login.engagement_drill_fields_distinct*&f[heap_profile_events_success_login.email]=-%25wipro.com%25%2C-%25appirio.com%25&f[heap_profile_events_success_login.time_week]={{_filters['member_engagement_metrics.event_date_week'] | urlencode}}"
    }
    group_label: "Non Topgear"
  }


  measure: count {
    type: count
  }
}
