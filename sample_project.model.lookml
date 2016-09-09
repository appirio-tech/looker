- connection: prod_-_topcoder_redshift

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

# Derived Views
- explore: challenge_cost
- explore: challenge_volume
- explore: challenge_stats
- explore: member_payments

# Table Views
- explore: cost_transaction

- explore: user
  joins:
    - join: country
      type: left_outer
      sql_on: ${user.comp_country_code} = ${country.country_code}
      relationship: many_to_one

- explore: country

- explore: calendar

- explore: challenge
  joins:
    - join: client_project_dim
      type: left_outer 
      sql_on: ${client_project_dim.client_project_id} = ${challenge.client_project_id}
      relationship: many_to_one
    - join: copilot
      from: user
      type: left_outer 
      sql_on: ${challenge.copilot_id} = ${copilot.coder_id}
      relationship: many_to_one
    - join: creator
      from: user
      type: left_outer 
      sql_on: ${challenge.challenge_creator_id} = ${creator.coder_id}
      relationship: many_to_one
    - join: manager
      from: user
      type: left_outer 
      sql_on: ${challenge.challenge_manager_id} = ${manager.coder_id}
      relationship: many_to_one
    - join: launcher
      from: user
      type: left_outer 
      sql_on: ${challenge.challenge_launcher_id} = ${launcher.coder_id}
      relationship: many_to_one

- explore: project_result
  joins:
    - join: challenge
      type: left_outer 
      sql_on: ${project_result.project_id} = ${challenge.project_id}
      relationship: many_to_one
    - join: user
      type: inner 
      sql_on: ${project_result.user_id} = ${user.coder_id}
      relationship: many_to_one

- explore: design_project_result
  joins:
    - join: challenge
      type: left_outer 
      sql_on: ${design_project_result.project_id} = ${challenge.project_id}
      relationship: many_to_one
      
- explore: payment
  joins:
    - join: created_date
      from: calendar
      type: inner
      sql_on: ${payment.created_calendar_id} = ${created_date.calendar_id}
      relationship: many_to_one
      
    - join: user_payment
      type: inner
      sql_on: ${payment.payment_id} = ${user_payment.payment_id}
      relationship: one_to_many
      
    - join: user
      type: inner
      sql_on: ${user_payment.user_id} = ${user.coder_id}
      relationship: many_to_many 

- explore: user_payment 

- explore: client_project_dim 
#- explore: client_user_stats 
#- explore: contest 
#- explore: contest_prize 
#- explore: contest_project_xref 
#- explore: contest_result 
#- explore: contest_season_xref 
#- explore: contest_stage_xref 

- explore: copilot_statistics 
  joins:
    - join: user
      type: inner 
      sql_on: ${copilot_statistics.user_id} = ${user.coder_id}
      relationship: one_to_one


- explore: country_user_rank 
#- explore: data_type_lu 
- explore: direct_project_dim 
#- explore: dr_points 
- explore: event 
- explore: jira_issue 
- explore: monthly_contest_stats 
- explore: participation 
- explore: participation_metrics_report_copilot 
- explore: participation_metrics_report_member 

- explore: project_platform
  joins:
    - join: challenge
      type: left_outer 
      sql_on: ${challenge.project_id} = ${project_platform.project_id}
      relationship: many_to_one
    - join: client_project_dim
      type: left_outer 
      sql_on: ${client_project_dim.client_project_id} = ${challenge.client_project_id}
      relationship: many_to_one

#- explore: project_review 
#- explore: project_spec_review_xref 

- explore: project_technology 
  joins:
    - join: challenge
      type: left_outer 
      sql_on: ${challenge.project_id} = ${project_technology.project_id}
      relationship: many_to_one
    - join: client_project_dim
      type: left_outer 
      sql_on: ${client_project_dim.client_project_id} = ${challenge.client_project_id}
      relationship: many_to_one

#- explore: review_resp 
- explore: rookie 
#- explore: royalty 
- explore: school_user_rank 
- explore: season 
- explore: stage 
- explore: streak 
- explore: streak_type_lu 
- explore: submission 

- explore: submission_review 
  joins:
    - join: user
      type: inner
      sql_on: ${submission_review.reviewer_id} = ${user.coder_id}
      relationship: many_to_one 
    - join: challenge
      type: inner 
      sql_on: ${submission_review.project_id} = ${challenge.project_id}
      relationship: many_to_one

- explore: subjective_response 
- explore: tcd_project_stat 
- explore: track 
- explore: track_contest 
- explore: track_contest_results 
- explore: user_achievement_rule 
- explore: user_achievement_type_lu 
- explore: user_achievement_xref 
#- explore: user_component_score 
#- explore: user_contest_prize 
- explore: user_event_xref 
- explore: user_rank 
- explore: user_rank_type_lu 
- explore: user_rating 
- explore: user_reliability 
- explore: weekly_contest_stats 


      



