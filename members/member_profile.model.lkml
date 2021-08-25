connection: "prod_-_topcoder_redshift"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
include : "/bookings/*.view.lkml"            # include all views from booking folder
include : "/heap/*.view.lkml"                # include all views from heap folder
#include : "/gig/*.view.lkml"                 # include all views from gig folder
include : "/Community_Metrics/*.view.lkml"   # include all views from communtiy metrics folder
include: "/salesforce/*.view.lkml"           # include all views from /salesforce folder
include: "../*.view.lkml"                    #include all views from parent directory
include: "../informix_challenge/*.view.lkml"             # include all views from /informix_challenge folder
include: "../bookings/*.view.lkml"            #include all views from /bookings folder
include: "../user/*.view.lkml"
include: "../connect/*.view.lkml"

fiscal_month_offset: -9

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#

# sets the week start day to Sunday
week_start_day: sunday

explore: member_skill {
  join: skill {
      relationship: many_to_many
       sql_on: ${member_skill.skill_id} = ${skill.skill_id} ;;
   }
  join: user {
     relationship: many_to_many
     sql_on: ${member_skill.user_id} = ${user.coder_id} ;;
   }

}

# Added 24th October - 2018

explore: member_profile_basic {}

explore: member_profile_advanced {

  #Added 28th May 2019
  join: computed_skills {
    relationship: many_to_many
    sql_on: ${member_profile_advanced.user_id}= ${computed_skills.user_id} ;;

  }
  join: candidate {
    type: left_outer
    sql_on: ${member_profile_advanced.handle} = ${candidate.handle};;
    relationship: one_to_one
  }
  join: taas_resource {
    type: left_outer
    sql_on: ${member_profile_advanced.user_id} = ${taas_resource.user_id} ;;
    relationship: one_to_one
  }
  join: taas_payment {
    type: left_outer
    sql_on: ${taas_resource.resource_handle} = ${taas_payment.taas_resource_handle} ;;
    relationship: one_to_many
  }
}

# Added 1st November - 2018

explore: member_stats {
  join: member_profile_basic {
    type: left_outer
    sql_on: ${member_stats.user_id} = ${member_profile_basic.user_id} ;;
    relationship: many_to_one
  }

#Added on 26th March 2019
  join: user {
    type: left_outer
    sql_on: ${member_stats.user_id} = ${user.coder_id} ;;
    relationship: many_to_one
  }
}

# Added 6th November - 2018

explore: member_stats_history {
  join: member_profile_basic {
    type: left_outer
    sql_on: ${member_stats_history.user_id} = ${member_profile_basic.user_id} ;;
    relationship: many_to_one
  }
}

# Member Newsletter join to basic user profile using user Id
# Added 19th Nov, 2018
explore: member_newsletters {
  hidden: yes
  join: member_profile_basic {
    type: left_outer
    sql_on: ${member_newsletters.user_id} = ${member_profile_basic.user_id} ;;
    relationship: one_to_one
  }
}

# Added 20th November - 2018

explore: member_profile_all {
  label: "Member Profile 360"
  join: member_stats {
    type: left_outer
    sql_on: ${member_profile_all.user_id} = ${member_stats.user_id} ;;
    relationship: one_to_many
  }

  join: member_submission {
    type: left_outer
    sql_on: ${member_profile_all.user_id} = ${member_submission.user_id};;
    relationship: one_to_many
  }

  join: member_stats_history {
    type: left_outer
    sql_on: ${member_profile_all.user_id} = ${member_stats_history.user_id} ;;
    relationship: one_to_many
  }

  join: challenge {
    type: left_outer
    sql_on: ${member_stats_history.challenge_id} = ${challenge.project_id} ;;
    relationship: many_to_many
  }

  join: member_community{
    type: left_outer
    sql_on: ${member_profile_all.user_id} = ${member_community.user_id} ;;
    relationship: one_to_many
  }

  join: member_device{
    type: left_outer
    sql_on: ${member_profile_all.user_id} = ${member_device.user_id} ;;
    relationship: one_to_many
  }

  join: member_hobby{
    type: left_outer
    sql_on: ${member_profile_all.user_id} = ${member_hobby.user_id} ;;
    relationship: one_to_many
  }

#added on 7th June
  join: member_education{
    type: left_outer
    sql_on: ${member_profile_all.user_id} = ${member_education.user_id} ;;
    relationship: one_to_many
  }

  #added on 7th June
  join: member_language{
    type: left_outer
    sql_on: ${member_profile_all.user_id} = ${member_language.user_id} ;;
    relationship: one_to_many
  }

  #added on 7th June
  join: member_work{
    type: left_outer
    sql_on: ${member_profile_all.user_id} = ${member_work.user_id} ;;
    relationship: one_to_many
  }
  join: member_skill{
    type: left_outer
    sql_on: ${member_profile_all.user_id} = ${member_skill.user_id} ;;
    relationship: one_to_many
  }

  join: skill {
    type: left_outer
    sql_on: ${member_skill.skill_id} = ${skill.skill_id} ;;
    relationship: many_to_many
  }
  #Added on 28th May 2019
  join: computed_skills {
    relationship: many_to_many
    sql_on: ${member_skill.user_id}= ${computed_skills.user_id} ;;
  }


  join: member_service_provider{
    type: left_outer
    sql_on: ${member_profile_all.user_id} = ${member_service_provider.user_id} ;;
    relationship: one_to_many
  }

  join: member_software{
    type: left_outer
    sql_on: ${member_profile_all.user_id} = ${member_software.user_id} ;;
    relationship: one_to_many
  }

  join: member_subscription{
    type: left_outer
    sql_on: ${member_profile_all.user_id} = ${member_subscription.user_id} ;;
    relationship: one_to_many
  }

  join: member_newsletters{
    type: left_outer
    sql_on: ${member_profile_all.user_id} = ${member_newsletters.user_id} ;;
    relationship: one_to_many
  }

  join: member_business_conduct_survey {
    type: left_outer
    sql_on: ${member_profile_all.user_id} = ${member_business_conduct_survey.user_id} ;;
    relationship: one_to_many
  }

  join: member_verification {
    type: left_outer
    sql_on:  ${member_profile_all.user_id} = ${member_verification.user_id};;
    relationship: one_to_many
  }

  #added on 28th June 2019
  join: user {
    type: inner
    sql_on: ${member_profile_all.user_id} = ${user.coder_id} ;;
    relationship: one_to_one
  }

  join: user_payment {
    type: left_outer
    sql_on:  ${member_profile_all.user_id} = ${user_payment.user_id};;
    relationship: one_to_many
  }

  join: group_membership {
    type: left_outer
    sql_on: ${user.coder_id} = ${group_membership.member_id} ;;
    relationship: many_to_many
  }

  join: group {
    type: left_outer
    sql_on: ${group.id} = ${group_membership.group_id} ;;
    relationship: many_to_one
  }

  join: country {
    view_label: "reporting_country_name"
    type: left_outer
    sql_on: ${member_profile_all.reporting_country} = ${country.country_name} ;;
    relationship: many_to_one
  }

  join: user_terms_signed {
    type:left_outer
    sql_on: ${user.coder_id} = ${user_terms_signed.user_id} ;;
    relationship: many_to_one
  }

  join: terms_of_use {
    type: left_outer
    sql_on: ${user_terms_signed.terms_of_use_id} = ${terms_of_use.terms_of_use_id} ;;
    relationship: many_to_one
  }

  join: candidate {
    type: inner
    sql_on: ${member_profile_all.handle} = ${candidate.handle} ;;
    relationship: one_to_one
  }

  join: payment {
    view_label: "payment details"
    type: inner
    sql_on: ${payment.payment_id} = ${user_payment.payment_id} ;;
    relationship: one_to_many
    }

  join: payment_create_date {
    from: calendar
    type: inner
    sql_on: ${payment.created_calendar_id} = ${payment_create_date.calendar_id} ;;
    relationship: many_to_one
  }

  join: user_tax_form {
    type: left_outer
    sql_on: ${user_tax_form.user_id} = ${user.coder_id} ;;
    relationship: many_to_one
  }

}

# Added 22nd November - 2018
explore: member_business_conduct_survey {
  join: member_profile_basic {
    type: left_outer
    sql_on: ${member_business_conduct_survey.user_id} = ${member_profile_basic.user_id} ;;
    relationship: many_to_one
  }
}

#added on 23rd July 2019
explore: member_verification {
  join: member_profile_basic {
    type: left_outer
    sql_on: ${member_verification.user_id} = ${member_profile_basic.user_id} ;;
    relationship: one_to_one
  }
}

# Added 2nd November - 2018, Member Submission pulled from DynamoDb
explore: member_submission {
  join: member_profile_basic {
    type: left_outer
    sql_on: ${member_submission.user_id} = ${member_profile_basic.user_id} ;;
    relationship: many_to_one
  }
  join: challenge {
    type: left_outer
    sql_on: ${member_submission.challenge_id} = ${challenge.challenge_id} ;;
    relationship: many_to_one
  }
  join:direct_project_dim  {
     type: left_outer
     sql_on: ${challenge.tc_direct_project_id} = ${direct_project_dim.direct_project_id};;
    relationship: many_to_one
  }
  join:billing_account_budgets  {
    view_label: "Billing Account"
    type: left_outer
    sql_on: ${direct_project_dim.billing_account_id} = ${billing_account_budgets.billing_account_id};;
    relationship: many_to_many
  }

  #added on 7th Junw 2021
  join: review {
    type: left_outer
    sql_on: ${member_submission.legacy_submission_id} = ${review.submission_id} ;;
    relationship: one_to_many
  }

  join: review_summation {
    type: left_outer
    sql_on: ${member_submission.legacy_submission_id} = ${review_summation.submission_id} ;;
    relationship: one_to_many
  }

}

explore: gig_skills_requested {}

explore: gig {

  join: hiring_stage {
    type: left_outer
    sql_on: ${gig.slug} = ${hiring_stage.job_slug} ;;
    relationship: one_to_many
  }

  join: candidate {
    type: left_outer
    sql_on: ${hiring_stage.candidate_slug} = ${candidate.slug} ;;
    relationship: many_to_one
  }

  join: member_profile_all {
    type: left_outer
    sql_on: ${candidate.handle} = ${member_profile_all.handle} ;;
    relationship: one_to_one
  }

  join: member_stats {
    type: left_outer
    sql_on: ${member_profile_all.user_id} = ${member_stats.user_id}  ;;
    relationship: one_to_many
  }

  join: sfdc_opportunity {
    type: full_outer
    sql_on: ${gig.opportunity_id} = ${sfdc_opportunity.X_15_digit_id} ;;
    relationship: one_to_one
  }
  join: connect_project {
    type: left_outer
    sql_on: ${sfdc_opportunity.connect_project_id} = ${connect_project.id} ;;
    relationship: one_to_one
  }

  join: member_profile_advanced {
    view_label: "Connect Project Creator"
    type: left_outer
    sql_on: ${connect_project.created_by} = ${member_profile_advanced.user_id} ;;
    relationship: one_to_one
  }
  join: taas_resource {
    type: full_outer
    sql_on: ${hiring_stage.job_candidate_id} = ${taas_resource.job_candidate_id} ;;
    relationship: one_to_one
  }

  join: taas_payment {
    type: left_outer
    sql_on: ${taas_resource.taas_resource_id} = ${taas_payment.taas_resource}  ;;
    relationship: one_to_many
  }

  join: gig_skills_requested {
    type: left_outer
    sql_on: ${gig.job_id} = ${gig_skills_requested.job_id} ;;
    relationship: many_to_many
  }

  #Adding project_stream and sfdc_revenue_recognition to gig view 2nd Feb 2021

  join : project_stream {
    type: left_outer
    sql_on: ${sfdc_opportunity.sfdc_opportunity_id} = ${project_stream.opportunity} ;;
    relationship: one_to_many
  }

  join: job_candidate_history {
    type: left_outer
    sql_on: ${gig.slug} = ${job_candidate_history.job_slug} ;;
    relationship: one_to_many
  }

  join: sfdc_revenue_recognition {
    type: inner
    sql_on: ${project_stream.id} = ${sfdc_revenue_recognition.project_strem} ;;
    relationship: one_to_many
  }

  #added bookings related views to gig explore on 17th Aug
  join: jobs {
    type: left_outer
    sql_on:${gig.slug} = ${jobs.external_id}  ;;
    relationship: one_to_one
  }

  join: job_candidates {
    type: left_outer
    sql_on: ${jobs.id} = ${job_candidates.job_id}   ;;
    relationship: one_to_many
  }

  join: resource_bookings {
    type: left_outer
    sql_on:  ${jobs.id} = ${resource_bookings.job_id};;
    relationship: one_to_many
    sql_where: ${resource_bookings.deleted_date} IS NULL ;; #Exclude records that are deleted
  }

  join: interviews {
    type: left_outer
    sql_on: ${job_candidates.job_id} = ${interviews.job_candidate_id} ;;
    relationship: one_to_many
  }

  join: work_periods {
    type: left_outer
    sql_on:  ${resource_bookings.id} = ${work_periods.resource_booking_id}   ;;
    relationship: one_to_many
  }

  join: work_period_payments {
    type: left_outer
    sql_on: ${work_periods.id} = ${work_period_payments.work_period_id} ;;
    relationship: one_to_many
  }

  join: payment_schedulers {
    type: left_outer
    sql_on: ${work_period_payments.id} = ${payment_schedulers.work_period_payment_id} ;;
    relationship: one_to_many
  }


}

explore: candidate {

  join: hiring_stage {
    type: left_outer
    sql_on: ${candidate.slug} = ${hiring_stage.candidate_slug} ;;
    relationship: one_to_many
  }

  join: job_candidate_history {
    type: left_outer
    sql_on: ${candidate.slug} = ${job_candidate_history.candidate_slug} ;;
    relationship: one_to_many
  }

  join: gig {
    type: left_outer
    sql_on: ${hiring_stage.job_slug} = ${gig.slug} ;;
    relationship: many_to_one
  }

}

explore: taas_payment {

  join: taas_resource {
    type: left_outer
    sql_on:  ${taas_payment.taas_resource_handle} =${taas_resource.resource_handle}  ;;
    relationship: many_to_one
  }

}

explore: bookings_role_search {
  join: bookings_role_search_skill {
    type: inner
    sql_on: ${bookings_role_search.id} = ${bookings_role_search_skill.role_search_id};;
    relationship: one_to_many
  }
}

# 20th April 2021 adding explore for booking
explore :  jobs {

  sql_always_where: ${deleted_date} IS NULL ;; #exclude deleted records

  join: connect_project {
    type: inner
    sql_on: ${jobs.project_id} = ${connect_project.id} ;;
    relationship: one_to_one
  }

  join: gig {
    type: left_outer
    sql_on: ${jobs.external_id} = ${gig.slug} ;;
    relationship: one_to_one
  }

  join: job_candidates {
    type: left_outer
    sql_on: ${jobs.id} = ${job_candidates.job_id}   ;;
    relationship: one_to_many
  }

  join: candidate {
    type: inner
    sql_on: ${candidate.slug} = ${job_candidates.external_id} ;;
    relationship: one_to_one
  }

  join: resource_bookings {
    type: left_outer
    sql_on:  ${jobs.id} = ${resource_bookings.job_id};;
    relationship: one_to_many
    sql_where: ${resource_bookings.deleted_date} IS NULL ;; #Exclude records that are deleted
  }

}

explore: success_signup {}

explore:  community_monthly_active_users {
  join: member_profile_all {
    type: inner
    sql_on: ${community_monthly_active_users.user_id} = ${member_profile_all.user_id} ;;
    relationship: one_to_one
  }

}


explore:  member_engagement_metrics {}

explore: member_engagement_metrics_2 {
  persist_for: "8 hours"
  from: calendar
  join: pageviews {
    type: left_outer
    sql_on: ${member_engagement_metrics_2.date_date} = ${pageviews.time_date} ;;
    relationship: one_to_many
  }
  join: signups {
    from: member_profile_all
    type: left_outer
    sql_on: ${member_engagement_metrics_2.date_date} = ${signups.created_date} AND  ${signups.status} = 'ACTIVE' ;;
    relationship: one_to_many
  }
  join: challenge_registration {
    from: challenge_stats
    type: left_outer
    sql_on: ${member_engagement_metrics_2.date_date} = ${challenge_registration.inquire_timestamp_date} ;;
    relationship: one_to_many
  }
  join: challenge_submission {
    from: challenge_stats
    type: left_outer
    sql_on: ${member_engagement_metrics_2.date_date} = ${challenge_submission.submit_timestamp_date} ;;
    relationship: one_to_many
  }
  join: gig_candidate {
    from: recruit_crm_candidate
    type: left_outer
    sql_on: ${member_engagement_metrics_2.date_date} = ${gig_candidate.created_date} ;;
    relationship: one_to_many
  }
  join: gig_bookings {
    from: resource_bookings
    type: left_outer
    sql_on: ${member_engagement_metrics_2.date_date} = ${gig_bookings.created_date} ;;
    relationship: one_to_many
  }
  join: members_paid {
    from: user_payment
    type: left_outer
    sql_on: ${member_engagement_metrics_2.calendar_id} = ${members_paid.due_calendar_id} ;;
    relationship: one_to_many
  }
  join: logins {
    from: heap_profile_events_success_login
    type: left_outer
    sql_on: ${member_engagement_metrics_2.date_date} = ${logins.time_date};;
    relationship: one_to_many
  }
}
