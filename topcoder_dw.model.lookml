- connection: tcdw_qa

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: challenge_stats

- explore: coder

- explore: country
  joins:
    - join: coder
      type: left_outer
      sql_on: ${coder.comp_country_code} = ${country.country_code}
      relationship: one_to_many

- explore: calendar

- explore: project

- explore: project_result
  joins:
    - join: project
      type: left_outer 
      sql_on: ${project_result.project_id} = ${project.project_id}
      relationship: many_to_one

- explore: design_project_result
  joins:
    - join: project
      type: left_outer 
      sql_on: ${design_project_result.project_id} = ${project.project_id}
      relationship: many_to_one
      
- explore: payment
  joins:
    - join: created_date
      from: calendar
      type: inner
      sql_on: ${payment.created_calendar_id} = ${created_date.calendar_id}
      relationship: many_to_one

- explore: user_payment
  joins:
    - join: payment
      type: left_outer
      sql_on: ${user_payment.payment_id} = ${payment.payment_id}
      relationship: many_to_one

    - join: coder
      type: inner
      sql_on: ${user_payment.user_id} = ${coder.coder_id}
      relationship: many_to_one      
      
    - join: paid_date
      from: calendar
      type: inner
      sql_on: ${user_payment.paid_calendar_id} = ${paid_date.calendar_id}
      relationship: one_to_many



- explore: client_project_dim 
- explore: client_user_stats 
- explore: contest 
- explore: contest_prize 
- explore: contest_project_xref 
- explore: contest_result 
- explore: contest_season_xref 
- explore: contest_stage_xref 
- explore: copilot_statistics 
- explore: country_user_rank 
- explore: data_type_lu 
- explore: direct_project_dim 
- explore: dr_points 
- explore: event 
- explore: jira_issue 
- explore: monthly_contest_stats 
- explore: participation 
- explore: participation_metrics_report_copilot 
- explore: participation_metrics_report_member 
- explore: project_platform 
- explore: project_review 
- explore: project_spec_review_xref 
- explore: project_technology 
- explore: review_resp 
- explore: rookie 
- explore: royalty 
- explore: school_user_rank 
- explore: season 
- explore: stage 
- explore: streak 
- explore: streak_type_lu 
- explore: submission 
- explore: tcd_project_stat 
- explore: track 
- explore: track_contest 
- explore: track_contest_results 
- explore: user_achievement_rule 
- explore: user_achievement_type_lu 
- explore: user_achievement_xref 
- explore: user_component_score 
- explore: user_contest_prize 
- explore: user_event_xref 
- explore: user_rank 
- explore: user_rank_type_lu 
- explore: user_rating 
- explore: user_reliability 
- explore: weekly_contest_stats 


      



