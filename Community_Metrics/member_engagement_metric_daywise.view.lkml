view: member_engagement_metric_daywise {

  derived_table: {
    sql:
    SELECT date,
           (SELECT count(*) FROM heapdata.pageviews p left join heapdata.users  u on  p.user_id = u.user_id  where DATEADD(day, -1, date_trunc('day', time)) = c.date and  (u._email like '%wipro.com%' OR u._email like '%appirio.com%') ) as topgear_pageviews,
           (SELECT count(*) FROM heapdata.pageviews p left join heapdata.users  u on  p.user_id = u.user_id  where DATEADD(day, -1, date_trunc('day', time)) = c.date and  (u._email not like '%wipro.com%' AND u._email not like '%appirio.com%') ) as non_topgear_pageviews,
           (SELECT count(*)  FROM coder WHERE status = 'A' and (email like '%wipro.com%' OR email like '%appirio.com%') and CAST(member_since AS DATE) = c.date) as topgear_sign_ups,
           (SELECT count(*)  FROM coder WHERE status = 'A' and (email not like '%wipro.com%' AND email not like '%appirio.com%') and CAST(member_since AS DATE) = c.date) as non_topgear_sign_ups,
        -- (SELECT count(*) FROM project WHERE date_trunc('day', posting_date) = c.date and status_desc not in ('Draft', 'Deleted', 'New', 'Inactive') and client_project_id != 80000062  ) as non_topgear_challenges,
           (SELECT count(*) FROM project WHERE date_trunc('day', posting_date) = c.date and status_desc not in ('Draft', 'Deleted', 'New', 'Inactive') and client_project_id = 80000062) as topgear_challenges,
           (SELECT count(*) FROM project p left join client_project_dim pd on p.client_project_id = pd.client_project_id WHERE date_trunc('day', p.posting_date) = c.date and p.status_desc not in ('Draft', 'Deleted', 'New', 'Inactive') and p.client_project_id != 80000062 and p.task_ind = 0 ) as non_topgear_challenges,
           (SELECT count(*) FROM project p left join client_project_dim pd on p.client_project_id = pd.client_project_id WHERE date_trunc('day', p.posting_date) = c.date and p.status_desc not in ('Draft', 'Deleted', 'New', 'Inactive') and p.client_project_id != 80000062 and p.task_ind = 1 and pd.is_taas_billing_account != true ) as non_topgear_tasks,
           (SELECT count(*) FROM project p left join client_project_dim pd on p.client_project_id = pd.client_project_id WHERE date_trunc('day', p.posting_date) = c.date and p.status_desc not in ('Draft', 'Deleted', 'New', 'Inactive') and p.client_project_id != 80000062 and p.task_ind = 1 and pd.is_taas_billing_account = true ) as non_topgear_TaaS,
           (select count(*) from (select dpr.project_id , dpr.user_id , dpr.inquire_timestamp, p.client_project_id from tcs_dw.design_project_result dpr left join tcs_dw.project p on dpr.project_id = p.project_id where p.client_project_id = 80000062 union select pr.project_id , pr.user_id , pr.inquire_timestamp, p.client_project_id from tcs_dw.project_result pr left join tcs_dw.project p on pr.project_id = p.project_id where p.client_project_id = 80000062 ) as challenge_registration_union where DATEADD(day,-1,date_trunc('day', inquire_timestamp)) = c.date) as topgear_challenge_registrations,
           (select count(*) from (select dpr.project_id , dpr.user_id , dpr.inquire_timestamp, p.client_project_id from tcs_dw.design_project_result dpr left join tcs_dw.project p on dpr.project_id = p.project_id where p.client_project_id != 80000062 union select pr.project_id , pr.user_id , pr.inquire_timestamp, p.client_project_id from tcs_dw.project_result pr left join tcs_dw.project p on pr.project_id = p.project_id where p.client_project_id != 80000062 ) as challenge_registration_union where DATEADD(day,-1,date_trunc('day', inquire_timestamp)) = c.date) as non_topgear_challenge_registrations,
           (select count(distinct user_id) from (select dpr.project_id , dpr.user_id , dpr.inquire_timestamp, p.client_project_id from tcs_dw.design_project_result dpr left join tcs_dw.project p on dpr.project_id = p.project_id where p.client_project_id = 80000062 union select pr.project_id , pr.user_id , pr.inquire_timestamp, p.client_project_id from tcs_dw.project_result pr left join tcs_dw.project p on pr.project_id = p.project_id where p.client_project_id = 80000062 ) as challenge_registration_union where DATEADD(day,-1,date_trunc('day', inquire_timestamp)) = c.date) as topgear_distinct_challenge_registrants,
           (select count(distinct user_id) from (select dpr.project_id , dpr.user_id , dpr.inquire_timestamp, p.client_project_id from tcs_dw.design_project_result dpr left join tcs_dw.project p on dpr.project_id = p.project_id where p.client_project_id != 80000062 union select pr.project_id , pr.user_id , pr.inquire_timestamp, p.client_project_id from tcs_dw.project_result pr left join tcs_dw.project p on pr.project_id = p.project_id where p.client_project_id != 80000062 ) as challenge_registration_union where DATEADD(day,-1,date_trunc('day', inquire_timestamp)) = c.date) as non_topgear_distinct_challenge_registrants,
           (select count(*) from (select dpr.project_id , dpr.user_id , dpr.inquire_timestamp, p.client_project_id, dpr.submit_ind from tcs_dw.design_project_result dpr left join tcs_dw.project p on dpr.project_id = p.project_id where p.client_project_id = 80000062 union select pr.project_id , pr.user_id , pr.inquire_timestamp, p.client_project_id , pr.submit_ind from tcs_dw.project_result pr left join tcs_dw.project p on pr.project_id = p.project_id where p.client_project_id = 80000062 ) as challenge_submission_union where DATEADD(day,-1,date_trunc('day', inquire_timestamp)) = c.date and submit_ind = 1 ) as topgear_challenge_submissions,
           (select count(*) from (select dpr.project_id , dpr.user_id , dpr.inquire_timestamp, p.client_project_id, dpr.submit_ind from tcs_dw.design_project_result dpr left join tcs_dw.project p on dpr.project_id = p.project_id where p.client_project_id != 80000062 union select pr.project_id , pr.user_id , pr.inquire_timestamp, p.client_project_id , pr.submit_ind from tcs_dw.project_result pr left join tcs_dw.project p on pr.project_id = p.project_id where p.client_project_id != 80000062 ) as challenge_submission_union where DATEADD(day,-1,date_trunc('day', inquire_timestamp)) = c.date and submit_ind = 1 ) as non_topgear_challenge_submissions,
           (select count(distinct user_id ) from (select dpr.project_id , dpr.user_id , dpr.inquire_timestamp, p.client_project_id, dpr.submit_ind from tcs_dw.design_project_result dpr left join tcs_dw.project p on dpr.project_id = p.project_id where p.client_project_id = 80000062 union select pr.project_id , pr.user_id , pr.inquire_timestamp, p.client_project_id , pr.submit_ind from tcs_dw.project_result pr left join tcs_dw.project p on pr.project_id = p.project_id where p.client_project_id = 80000062 ) as challenge_submission_union where DATEADD(day,-1,date_trunc('day', inquire_timestamp)) = c.date and submit_ind = 1 ) as topgear_distinct_challenge_submitters,
           (select count(distinct user_id ) from (select dpr.project_id , dpr.user_id , dpr.inquire_timestamp, p.client_project_id, dpr.submit_ind from tcs_dw.design_project_result dpr left join tcs_dw.project p on dpr.project_id = p.project_id where p.client_project_id != 80000062 union select pr.project_id , pr.user_id , pr.inquire_timestamp, p.client_project_id , pr.submit_ind from tcs_dw.project_result pr left join tcs_dw.project p on pr.project_id = p.project_id where p.client_project_id != 80000062 ) as challenge_submission_union where DATEADD(day,-1,date_trunc('day', inquire_timestamp)) = c.date and submit_ind = 1 ) as non_topgear_distinct_challenge_submitters,
           (SELECT count(*) FROM recruit_crm_candidate WHERE CAST(created_on AS DATE) = c.date and (email like '%wipro.com%' OR email like '%appirio.com%') ) as topgear_gig_applicants,
           (SELECT count(*) FROM recruit_crm_candidate WHERE CAST(created_on AS DATE) = c.date and (email not like '%wipro.com%' AND email not like '%appirio.com%')) as non_topgear_gig_applicants,
           (SELECT count(*) FROM bookings_resource_bookings WHERE CAST(created_at AS DATE) = c.date) as gig_placements,
           (SELECT count(distinct u.user_id) FROM user_payment u left join coder co on u.user_id = co.coder_id WHERE CAST(u.create_date AS DATE) = c.date  and (co.email like '%wipro.com%' OR co.email like '%appirio.com%')   ) as topgear_members_paid,
           (SELECT count(distinct u.user_id) FROM user_payment u left join coder co on u.user_id = co.coder_id WHERE CAST(u.create_date AS DATE) = c.date and (co.email not like '%wipro.com%' AND co.email not like '%appirio.com%')  ) as non_topgear_members_paid,
           (SELECT count(*) FROM heapdata.profile_events_success_login WHERE DATEADD(day,-1,date_trunc('day', time)) = c.date  and (email like '%wipro.com%' OR email like '%appirio.com%') ) as topgear_logins,
           (SELECT count(*) FROM heapdata.profile_events_success_login WHERE DATEADD(day,-1,date_trunc('day', time)) = c.date  and (email not like '%wipro.com%' AND email not like '%appirio.com%') ) as non_topgear_logins,
           (SELECT count(distinct nickname) FROM heapdata.profile_events_success_login WHERE DATEADD(day,-1,date_trunc('day', time)) = c.date and (email like '%wipro.com%' OR email like '%appirio.com%')  ) as topgear_distinct_logins,
           (SELECT count(distinct nickname) FROM heapdata.profile_events_success_login WHERE DATEADD(day,-1,date_trunc('day', time)) = c.date and (email not like '%wipro.com%' AND email not like '%appirio.com%')  ) as non_topgear_distinct_logins
    FROM calendar c
    WHERE c.date < getdate()
    GROUP BY 1
           ;;
  }

  # Define your dimensions and measures here, like this:
  dimension_group: event_date {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter
    ]
    sql: ${TABLE}.date ;;
  }

  measure: topgear_challenges {
    description: "Topgear Challenges Count"
    type: sum
    sql: ${TABLE}.topgear_challenges ;;
    link: {
      label: "Drill Topgear Challenge Count"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge?fields=challenge.engagement_metric_set*&f[challenge.client_project_id]=80000062&f[challenge.status_desc]=-Draft%2C-Deleted%2C-New%2C-Inactive&f[challenge.posting_week]={{_filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    group_label: "Topgear"
  }

  measure: non_topgear_challenges {
    description: "Non Topgear Challenges Count"
    type: sum
    sql: ${TABLE}.non_topgear_challenges ;;
    link: {
      label: "Drill Non Topgear Challenge Count"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge?fields=challenge.engagement_metric_set*&f[challenge.client_project_id]=not+80000062&f[challenge.status_desc]=-Draft%2C-Deleted%2C-New%2C-Inactive&f[challenge.task_ind]=0&f[challenge.posting_week]={{_filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    group_label: "Non Topgear"
  }

  measure: non_topgear_tasks {
    description: "Non Topgear tasks Count"
    type: sum
    sql: ${TABLE}.non_topgear_tasks ;;
    link: {
      label: "Drill Non Topgear tasks Count"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge?fields=challenge.engagement_metric_set*&f[challenge.client_project_id]=not+80000062&f[challenge.status_desc]=-Draft%2C-Deleted%2C-New%2C-Inactive&f[challenge.task_ind]=1&f[client_project_dim.is_taas_billing_account]=No&f[challenge.posting_week]={{_filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    group_label: "Non Topgear"
  }

  measure: non_topgear_TaaS {
    description: "Non Topgear TaaS Count"
    type: sum
    sql: ${TABLE}.non_topgear_TaaS ;;
    link: {
      label: "Drill Non Topgear TaaS Count"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge?fields=challenge.engagement_metric_set*&f[challenge.client_project_id]=not+80000062&f[challenge.status_desc]=-Draft%2C-Deleted%2C-New%2C-Inactivef[challenge.task_ind]=1&f[client_project_dim.is_taas_billing_account]=Yes&f[challenge.posting_week]={{_filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    group_label: "Non Topgear"
  }


  measure: topgear_pageviews {
    description: "The total number of topgear pageviews"
    type: sum
    sql: ${TABLE}.topgear_pageviews ;;
    link: {
      label: "Drill topgear page views"
      url: "https://topcoder.looker.com/explore/heap/pageviews?fields=pageviews.engagement_drill_fields*&f[heap_users._email]=%25wipro.com%25%2C%25appirio.com%25&f[pageviews.time_week]={{ _filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
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

  measure: topgear_sign_ups {
    description: "Topgear total number of sign ups"
    type: sum
    link: {
      label: "Drill Topgear Signups Week "
      url: "https://topcoder.looker.com/explore/topcoder_model_main/user?fields=user.engagement_drill_fields*&f[user.email]=%25wipro.com%25%2C%25appirio.com%25&f[user.status_desc]=Active&f[user.create_week]={{ _filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    sql: ${TABLE}.topgear_sign_ups ;;
    group_label: "Topgear"
  }

  measure: non_topgear_sign_ups {
    description: "Non Topgear total number of sign ups"
    type: sum
    link: {
      label: "Drill Non Topgear Signups Week "
      url: "https://topcoder.looker.com/explore/topcoder_model_main/user?fields=user.engagement_drill_fields*&f[user.email]=-%25wipro.com%25%2C-%25appirio.com%25&f[user.status_desc]=Active&f[user.create_week]={{ _filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    sql: ${TABLE}.non_topgear_sign_ups ;;
    group_label: "Non Topgear"
  }


  measure: topgear_challenge_registrations {
    description: "The total number of Topgear challengeregistrations"
    type: sum
    link: {
      label: "Drill Topgear Registrations"
      #url: "https://topcoder.looker.com/explore/topcoder_model_main/user?"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge_stats?fields=challenge_stats.engagement_drill_fields_registrants*&f[client_project_dim.billing_account_id]=80000062&f[challenge_stats.inquire_timestamp_week]={{ _filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    sql: ${TABLE}.topgear_challenge_registrations ;;
    group_label: "Topgear"

  }

  measure: non_topgear_challenge_registrations {
    description: "The total number of Non Topgear challenge registrations"
    type: sum
    link: {
      label: "Drill Non Topgear Registrations"
      #url: "https://topcoder.looker.com/explore/topcoder_model_main/user?"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge_stats?fields=challenge_stats.engagement_drill_fields_registrants*&f[client_project_dim.billing_account_id]=not+80000062&f[challenge_stats.inquire_timestamp_week]={{ _filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    sql: ${TABLE}.non_topgear_challenge_registrations ;;
    group_label: "Non Topgear"
  }

  measure: topgear_distinct_challenge_registrants {
    description: "The total number of distinct topgear challenge registrants"
    type: sum
    link: {
      label: "Drill Topgear Distinct Regisration"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge_stats?fields=challenge_stats.engagement_drill_fields_registrants_distinct*&f[client_project_dim.billing_account_id]=80000062&f[challenge_stats.inquire_timestamp_week]={{ _filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    sql: ${TABLE}.topgear_distinct_challenge_registrants ;;
    group_label: "Topgear"
  }

  measure: non_topgear_distinct_challenge_registrants {
    description: "The total number of distinct non topgear challenge registrants"
    type: sum
    link: {
      label: "Drill Non Topgear Distinct Regisration"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge_stats?fields=challenge_stats.engagement_drill_fields_registrants_distinct*&f[client_project_dim.billing_account_id]=not+80000062&f[challenge_stats.inquire_timestamp_week]={{ _filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    sql: ${TABLE}.non_topgear_distinct_challenge_registrants ;;
    group_label: "Non Topgear"
  }

  measure: topgear_challenge_submissions {
    description: "The total number of topgear challenge submissions"
    type: sum
    link: {
      label: "Drill Submissions"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge_stats?fields=challenge_stats.engagement_drill_fields_submitters*&f[client_project_dim.billing_account_id]=80000062&f[challenge_stats.submit_ind]=1&f[challenge_stats.inquire_timestamp_week]={{ _filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    sql: ${TABLE}.topgear_challenge_submissions ;;
    group_label: "Topgear"
  }

  measure: non_topgear_challenge_submissions {
    description: "The total number of non topgear challenge submissions"
    type: sum
    link: {
      label: "Drill Submissions"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge_stats?fields=challenge_stats.engagement_drill_fields_submitters*&f[client_project_dim.billing_account_id]=not+80000062&f[challenge_stats.submit_ind]=1&f[challenge_stats.inquire_timestamp_week]={{ _filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    sql: ${TABLE}.non_topgear_challenge_submissions ;;
    group_label: "Non Topgear"
  }

  measure: topgear_distinct_challenge_submitters {
    description: "The total number of topgear distinct challenge submitters"
    type: sum
    link: {
      label: "Drill distinct topgear submitters"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge_stats?fields=challenge_stats.engagement_drill_fields_submitters_distinct*&f[client_project_dim.billing_account_id]=80000062&f[challenge_stats.submit_ind]=1&f[challenge_stats.inquire_timestamp_week]={{ _filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    sql: ${TABLE}.topgear_distinct_challenge_submitters ;;
    group_label: "Topgear"
  }

  measure: non_topgear_distinct_challenge_submitters {
    description: "The total number of non topgear distinct challenge submitters"
    type: sum
    link: {
      label: "Drill distinct non topgear submitters"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/challenge_stats?fields=challenge_stats.engagement_drill_fields_submitters_distinct*&f[client_project_dim.billing_account_id]=not+80000062&f[challenge_stats.submit_ind]=1&f[challenge_stats.inquire_timestamp_week]={{ _filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    sql: ${TABLE}.non_topgear_distinct_challenge_submitters ;;
    group_label: "Non Topgear"
  }

  measure: topgear_gig_applicants {
    description: "The total number of gig_applicants"
    type: sum
    sql: ${TABLE}.topgear_gig_applicants ;;
    link: {
      label:" Drill Weekly Topgear Gig applicant "
      url: "https://topcoder.looker.com/explore/member_profile/candidate?fields=candidate.engagement_drill_fields*&f[candidate.email]=%25wipro.com%25%2C%25appirio.com%25&f[candidate.created_week]={{_filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    group_label: "Topgear"
  }

  measure: non_topgear_gig_applicants {
    description: "The total number of gig_applicants"
    type: sum
    sql: ${TABLE}.non_topgear_gig_applicants ;;
    link: {
      label:" Drill Weekly Non Topgear Gig applicant "
      url: "https://topcoder.looker.com/explore/member_profile/candidate?fields=candidate.engagement_drill_fields*&f[candidate.email]=-%25wipro.com%25%2C-%25appirio.com%25&f[candidate.created_week]={{_filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    group_label: "Non Topgear"
  }

  measure: gig_placements {
    description: "The total number of gig_placements"
    type: sum
    sql: ${TABLE}.gig_placements ;;
    link: {
      label: "Drill Weekly Gig Placements"
      url: "https://topcoder.looker.com/explore/member_profile/gig?fields=resource_bookings.engagement_drill_fields*&f[resource_bookings.created_week]={{_filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
  }

  measure: topgear_members_paid {
    description: "The total number of Topgear members paid"
    type: sum
    sql: ${TABLE}.topgear_members_paid ;;
    link: {
      label: "Drill Payment Paid Week Topgear "
      url: "https://topcoder.looker.com/explore/topcoder_model_main/payment?fields=payment_create_date.date_week,user_payment.distinct_user_count&f[payee.email]=%25wipro.com%25%2C%25appirio.com%25t&fill_fields=payment_create_date.date_week&f[payment_create_date.date_week]={{_filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    group_label: "Topgear"

  }

  measure: non_topgear_members_paid {
    description: "The total number of Non Topgear members paid"
    type: sum
    sql: ${TABLE}.non_topgear_members_paid ;;
    link: {
      label: "Drill Payment Paid Week Non Topgear"
      url: "https://topcoder.looker.com/explore/topcoder_model_main/payment?fields=payment_create_date.date_week,user_payment.distinct_user_count&f[payee.email]=-%25wipro.com%25%2C-%25appirio.com%25&fill_fields=payment_create_date.date_week&f[payment_create_date.date_week]={{_filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    group_label: "Non Topgear"

  }


  measure: topgear_logins {
    description: "The total number of logins"
    type: sum
    sql: ${TABLE}.topgear_logins ;;
    link: {
      label:"Drill Weekly Topgear Logins "
      url: "https://topcoder.looker.com/explore/heap/heap_profile_events_success_login?fields=heap_profile_events_success_login.engagement_drill_fields*&f[heap_profile_events_success_login.email]=%25wipro.com%25%2C%25appirio.com%25&f[heap_profile_events_success_login.time_week]={{_filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    group_label: "Topgear"
  }

  measure: non_topgear_logins {
    description: "The total number of logins"
    type: sum
    sql: ${TABLE}.non_topgear_logins ;;
    link: {
      label:"Drill Weekly Non Topgear Logins "
      url: "https://topcoder.looker.com/explore/heap/heap_profile_events_success_login?fields=heap_profile_events_success_login.engagement_drill_fields*&f[heap_profile_events_success_login.email]=-%25wipro.com%25%2C-%25appirio.com%25&f[heap_profile_events_success_login.time_week]={{_filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
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
      url: "https://topcoder.looker.com/explore/heap/heap_profile_events_success_login?fields=heap_profile_events_success_login.engagement_drill_fields_distinct*&f[heap_profile_events_success_login.email]=%25wipro.com%25%2C%25appirio.com%25&f[heap_profile_events_success_login.time_week]={{_filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
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
      url: "https://topcoder.looker.com/explore/heap/heap_profile_events_success_login?fields=heap_profile_events_success_login.engagement_drill_fields_distinct*&f[heap_profile_events_success_login.email]=-%25wipro.com%25%2C-%25appirio.com%25&f[heap_profile_events_success_login.time_week]={{_filters['member_engagement_metric_daywise.event_date_week'] | urlencode}}"
    }
    group_label: "Non Topgear"
  }


  measure: count {
    hidden: yes
    type: count
  }
}
