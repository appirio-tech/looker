connection: "prod_-_topcoder_redshift"

# project cache for 8 hours as load projects in 8 hours
datagroup: project_cache {
  label: "Challenge Cache"
  description: "Challenges are loaded every 8 hours hence the default challenge cache"
  sql_trigger: SELECT max(project_id) FROM project ;;
  max_cache_age: "8 hours"
}

# srm cache for 24 hours
datagroup: srm_cache {
  label: "SRM Data"
  description: "SRM Data is loaded after every SRM hence cached for earlier of (24 hours or when new records are loaded)"
  sql_trigger: select count(*) FROM srm_tco19 ;;
  max_cache_age: "24 hours"
}

#TCO Leaderboard Cache
datagroup: tco_leaderboard_cache {
  label: "TCO Leaderboard Cache"
  description: "TCO Leaderboard data cache as long as there is no extra data loaded"
  sql_trigger: select count(*) FROM tco_leaderboard ;;
  max_cache_age: "24 hours"
}



# include all the views
include: "*.view"

# include all the dashboards
# include: "*.dashboard"

# sets the week start day to Sunday
week_start_day: sunday

# filters will NOT be case sensitive
case_sensitive: no

#for fiscal year
fiscal_month_offset: -9

explore: member_activity_tenure {}

explore: salesforce_segment_leads {}

#Moved from Adhoc model to topcoder_model_main
# Find new challenges that are launched to help detect new challenge scorecards
explore: project_scorecard {
  label: "New Project Scorecards"
  description: "New Project that are launched with other scorecards"
  join: challenge {
    type: left_outer
    sql_on: ${project_scorecard.project_id} = ${challenge.challenge_id} ;;
    relationship: one_to_one
  }
}

# Derived Views
explore: challenge_stats {
  join: challenge_groups {
    type: left_outer
    sql_on: ${challenge_stats.project_id} = ${challenge_groups.challenge_id} ;;
    relationship: one_to_many
  }

  join: user {
    type: left_outer
    sql_on: ${challenge_stats.registrant_id} = ${user.coder_id} ;;
    relationship: many_to_one
  }

  join: user_payment {
    type: left_outer
    sql_on: ${challenge_stats.registrant_id} = ${user_payment.user_id} ;;
    relationship: many_to_one
  }


  #Adding skills tab to Challenge stats table
  join: member_skill {
   relationship: many_to_many
   sql_on: ${member_skill.user_id} = ${user.coder_id} ;;
  }

  join: skill {
    relationship: many_to_many
    sql_on: ${member_skill.skill_id} = ${skill.skill_id} ;;
  }

  #Comment Starts 27th May 2019
  #Adding below tables to challenge stats explore

  join: member_hobby {
    type :  left_outer
    sql_on: ${challenge_stats.registrant_id}= ${member_hobby.user_id} ;;
    relationship: one_to_many
  }

  join: member_software {
    type: left_outer
    sql_on:${challenge_stats.registrant_id} = ${member_software.user_id} ;;
    relationship: one_to_many
  }

  join: member_device{
    type: left_outer
    sql_on: ${challenge_stats.registrant_id} = ${member_device.user_id} ;;
    relationship: one_to_many
  }

  #Comment Ends

  join: member_profile_advanced {
    type: left_outer
    sql_on: ${challenge_stats.registrant_id} = ${member_profile_advanced.user_id} ;;
    relationship: many_to_one
  }

  join: challenge_technology {
    type: left_outer
    sql_on: ${challenge_stats.project_id} = ${challenge_technology.project_id} ;;
    relationship: one_to_many
  }

  join: country {
    type: inner
    sql_on: ${user.comp_country_code} = ${country.country_code} ;;
    relationship: many_to_one
  }

  join: connect_project {
    type: left_outer
    sql_on: ${challenge_stats.tc_direct_project_id} = ${connect_project.direct_project_id} ;;
    relationship: many_to_one
  }

  join: submission_review {
    type: left_outer
    sql_on: ${challenge_stats.project_id} = ${submission_review.project_id} ;;
    relationship: many_to_one
  }

  join: reviewer {
    from: user
    type: left_outer
    sql_on: ${submission_review.reviewer_id} = ${reviewer.coder_id} ;;
    relationship: many_to_one
  }

  #added on 18t June 2019
  join: client_project_dim {
    type: left_outer
    sql_on: ${challenge_stats.billing_account_id} = ${client_project_dim.client_project_id} ;;
    relationship: many_to_one
  }

  #added on 18t June 2019
  join: sfdc_account {
    type: left_outer
    view_label: "Reporting Account"
    sql_on: ${client_project_dim.reporting_sfdc_account} = ${sfdc_account.account_id};;
    relationship: many_to_one
  }

  join: challenge_start_date {
    from: calendar
    type: inner
    sql_on: ${challenge_stats.start_date_calendar_id} = ${challenge_start_date.calendar_id} ;;
    relationship: many_to_one
  }


}
explore: billing_account_budgets {}
explore: non_earning_dev_design_since_2016_01_01 {}

explore: round {
  join: data_science_contest {
    type: inner
    sql_on: ${round.contest_id} = ${data_science_contest.contest_id} ;;
    relationship: one_to_many
  }
  join: round_division {
    type: inner
    sql_on: ${round.round_id} = ${round_division.round_id} ;;
    relationship: one_to_many
  }

  join: round_date {
    from: calendar
   type: inner
   sql_on: ${round.calendar_id} = ${round_date.calendar_id} ;;
    relationship: many_to_many
  }

}

explore: participant_funnel_monthly {}


explore: room_result {
  join: user {
    type: inner
    sql_on: ${room_result.coder_id} = ${user.coder_id} ;;
    relationship: many_to_many
  }
  join: round {
    type: left_outer
    sql_on:  ${room_result.round_id} = ${round.round_id} ;;
    relationship: many_to_one
  }
}
explore: data_science_contest {}
explore: leads {}


#removed the opportunity table on 20th June 2019
#explore: opportunity {
#  join: connect_project {
#    type: left_outer
#    sql_on: ${opportunity.connect_project_id} = ${connect_project.id} ;;
#    relationship: one_to_one
#  }

#}

#added the group deatils
explore: auth_refresh_log {
  join: user {
    type: inner
    sql_on: ${auth_refresh_log.user_id} = ${user.coder_id} ;;
    relationship: many_to_one
  }
  join: country {
    type: left_outer
    sql_on: ${user.comp_country_code} = ${country.country_code} ;;
    relationship: many_to_one
  }
  join: group_membership {
    type: left_outer
    sql_on: ${user.coder_id} = ${group_membership.member_id} ;;
    relationship: many_to_one
  }
  join: group {
    type: left_outer
    sql_on: ${group.id} = ${group_membership.group_id} ;;
    relationship: many_to_one
  }

}

explore: copilot {}

explore: group_membership{
  join: group {
    type: inner
    sql_on: ${group.id} = ${group_membership.group_id} ;;
    relationship: many_to_many
  }

  join: user {
    type: left_outer
    sql_on: ${group_membership.member_id} = ${user.coder_id} and ${group_membership.membership_type_ind} = 1 ;;
    relationship: one_to_one
  }

  #added on 2nd July 2019
  join: sub_group {
      from:  group
      type: left_outer
      sql_on: ${group_membership.member_id} = ${sub_group.id} and ${group_membership.membership_type_ind} = 2 ;;
    relationship: one_to_one
  }

}

explore: challenge_volume {
  join: client_project_dim {
    type: left_outer
    sql_on: ${client_project_dim.client_id} = ${challenge_volume.client_id} ;;
    relationship: many_to_one
  }

  join: direct_project_dim {
    type: left_outer
    sql_on: ${challenge_volume.direct_project_id} = ${direct_project_dim.direct_project_id} ;;
    relationship: many_to_one
  }

  join: connect_project {
    type: left_outer
    sql_on: ${direct_project_dim.direct_project_id} = ${connect_project.direct_project_id} ;;
    relationship: many_to_one
  }
}


# Table Views
explore: cost_transaction {
  join: connect_project {
    type: left_outer
    sql_on: ${cost_transaction.direct_project_id} = ${connect_project.direct_project_id} ;;
    relationship: many_to_one
  }

  join: client_project_dim {
    type: left_outer
    sql_on: ${client_project_dim.billing_account_id} = ${cost_transaction.billing_project_id} ;;
    relationship: many_to_one
  }

  #added on 20th June 2019
  join: sfdc_account {
    type: left_outer
    view_label: "Reporting Account"
    sql_on: ${client_project_dim.reporting_sfdc_account} = ${sfdc_account.account_id} ;;
    relationship: many_to_one
  }


  join: challenge_groups {
    type: left_outer
    sql_on: ${cost_transaction.contest_id} = ${challenge_groups.challenge_id} ;;
    relationship: one_to_many
  }
  join: challenge {
    type: left_outer
    sql_on: ${cost_transaction.contest_id} = ${challenge.project_id} ;;
    relationship: one_to_many
  }
  join: member_profile_basic {
    view_label: "Challenge Manager"
    type: left_outer
    sql_on: ${challenge.challenge_manager_id} = ${member_profile_basic.user_id} ;;
    relationship: one_to_many
  }
  join: member_profile_basic_winner {
    from: member_profile_basic
    view_label: "Challenge Winner"
    type: left_outer
    sql_on: ${challenge.winner_id} = ${member_profile_basic.user_id} ;;
    relationship: one_to_one
  }
  join: sfdc_opportunity {
    type:  left_outer
    sql_on: ${sfdc_account.account_id} = ${sfdc_opportunity.account_id} ;;
    relationship: many_to_one
  }

  #added on 2nd Jun 2020
  join: direct_project_dim {
    type: left_outer
    sql_on: ${cost_transaction.direct_project_id} = ${direct_project_dim.direct_project_id} ;;
    relationship: many_to_one
  }
}

explore: consulting_time_and_material {
  join: resource {
    from: user
    type: left_outer
    sql_on: ${consulting_time_and_material.resource_topcoder_user_id} = ${resource.coder_id} ;;
    relationship: many_to_one
  }

  join: cost_transaction {
    type: left_outer
    sql_on: ${consulting_time_and_material.account_name} = ${cost_transaction.client} ;;
    relationship: many_to_one
  }
}

explore: user {
  join: country {
    type: left_outer
    sql_on: ${user.comp_country_code} = ${country.country_code} ;;
    relationship: many_to_one
  }

  join: user_tax_form {
    type: left_outer
    sql_on: ${user_tax_form.user_id} = ${user.coder_id} ;;
    relationship: many_to_one
  }
#  join: copilot_user {
#    from:  copilot
#    type:  left_outer
#    sql_on: ${user.handle} = ${copilot_user.handle} ;;
#    relationship: one_to_one
#  }

}




explore: country {}

# Hide the Calendar explore as it doesn't seem to be useful
explore: calendar {
  hidden: yes
}

explore: challenge_groups {
  join: group {
    type: inner
    sql_on: ${group.id} = ${challenge_groups.group_id} ;;
    relationship: many_to_one
  }
}

explore: connect_project {

  join: direct_project_dim {
    type: left_outer
    sql_on: ${connect_project.direct_project_id} = ${direct_project_dim.direct_project_id} ;;
    relationship: many_to_one
  }

  join: client_project_dim {
    type: left_outer
    sql_on: ${client_project_dim.billing_account_id} = ${direct_project_dim.billing_account_id} ;;
    relationship: many_to_one
  }

  #added sfdc account info to connect project on 10th Sep 2019

  join: sfdc_account {
    type: left_outer
    view_label: "Reporting Account"
    sql_on: ${client_project_dim.reporting_sfdc_account} = ${sfdc_account.account_id};;
    relationship: many_to_one
  }

  join: connect_project_members {
    type: left_outer
    sql_on: ${connect_project.id} = ${connect_project_members.project_id} ;;
    relationship: one_to_many
  }

  join: connect_project_member_user {
    from: user
    type: left_outer
    sql_on: ${connect_project_members.created_by} = ${connect_project_member_user.coder_id} ;;
    relationship: many_to_one
  }

  join: member_traits {
    from: member_profile_advanced
    type: left_outer
    sql_on: ${connect_project_members.user_id} = ${member_traits.user_id} ;;
    relationship: one_to_one
  }

  #added on 29th Aug 2019
  join: connect_project_creator_member {
    from:connect_project_members
    type: inner
    sql_on: ${connect_project.created_by}=${connect_project_creator_member.user_id} and ${connect_project.id}=${connect_project_creator_member.project_id} ;;
    relationship: one_to_one
  }

  #added on 21st Oct 2020 to display details of creater of the project
  join: connect_project_creater_member_user {
    from :  user
    type: left_outer
    sql_on: ${connect_project_creator_member.user_id} = ${connect_project_creater_member_user.coder_id} ;;
    relationship: many_to_one
  }

  join: connect_messages {
    type: left_outer
    sql_on: ${connect_project.id} = ${connect_messages.project_id} ;;
    relationship: one_to_many
  }

  join: message_author {
    from: user
    type: left_outer
    sql_on: ${connect_messages.created_by} = ${message_author.coder_id} ;;
    relationship: many_to_one
  }
  #Added on 17th April for Template ID
  join: connect_templates {
    type: left_outer
    sql_on: ${connect_project.template_id} = ${connect_templates.id} ;;
    relationship: one_to_one
  }

  #added on 23rd july 2019 for project stream
  join: project_stream {
    type: full_outer
    sql_on: ${connect_project.id}=${project_stream.tc_connect_project_id} ;;
    relationship: one_to_one
  }

  join: connect_intake_form {
    type: inner
    sql_on: ${connect_project.id} = ${connect_intake_form.id} ;;
    relationship: one_to_one
  }

  join: connect_status_history {
    type: left_outer
    sql_on: ${connect_project.id} = ${connect_status_history.project_id} ;;
    relationship: one_to_many
  }

  join: connect_intake_form_extension {
    type: left_outer
    sql_on: ${connect_project.id} = ${connect_intake_form_extension.connect_project_id} ;;
    relationship: one_to_many
  }
}

#explore:  member_aggregated_skills {}

explore: connect_project_members {

  join: member_profile_advanced {
    type: inner
    sql_on: ${connect_project_members.user_id} = ${member_profile_advanced.user_id} ;;
    relationship: one_to_one
  }
}

explore: challenge {
  join: client_project_dim {
    type: left_outer
    sql_on: ${client_project_dim.client_project_id} = ${challenge.client_project_id} ;;
    relationship: many_to_one
  }

  join: direct_project_dim {
    type: left_outer
    sql_on: ${challenge.tc_direct_project_id} = ${direct_project_dim.direct_project_id} ;;
    relationship: many_to_one
  }

  join: sfdc_account {
    view_label: "Reporting Account"
    type: left_outer
    sql_on: ${client_project_dim.reporting_sfdc_account} = ${sfdc_account.account_id};;
    relationship: many_to_one
  }

  join: connect_project {
    type: left_outer
    sql_on: ${direct_project_dim.direct_project_id} = ${connect_project.direct_project_id} ;;
    relationship: many_to_one
  }

  join: copilot {
    from: user
    type: left_outer
    sql_on: ${challenge.copilot_id} = ${copilot.coder_id} ;;
    relationship: many_to_one
  }

  join: copilot_country {
    from: country
    type: left_outer
    sql_on: ${copilot.country_code} = ${copilot_country.country_code} ;;
    relationship: many_to_one
  }

  join: creator {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_creator_id} = ${creator.coder_id} ;;
    relationship: many_to_one
  }

  join: manager {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_manager_id} = ${manager.coder_id} ;;
    relationship: many_to_one
  }

  join: launcher {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_launcher_id} = ${launcher.coder_id} ;;
    relationship: many_to_one
  }

  join: contest_project_xref {
    type: left_outer
    sql_on: ${challenge.project_id} = ${contest_project_xref.project_id} ;;
    relationship: many_to_one
  }

  join: contest {
    type: left_outer
    sql_on: ${contest.contest_id} = ${contest_project_xref.contest_id} ;;
    relationship: many_to_one
  }

  join: event {
    type: left_outer
    sql_on: ${contest.event_id} = ${event.event_id} ;;
    relationship: many_to_one
  }

  join: challenge_groups {
    type: left_outer
    sql_on: ${challenge.project_id} = ${challenge_groups.challenge_id} ;;
    relationship: one_to_many
  }
  join: winner {
    from: user
    type: left_outer
    sql_on: ${challenge.winner_id} = ${winner.coder_id} ;;
    relationship: many_to_one
  }

  #5th Nov 2019 : Adding Topcoder X tables

  join: topcoder_x_issue {
    type: left_outer
    sql_on: ${challenge.challenge_id} = ${topcoder_x_issue.challenge_id} ;;
    relationship: one_to_one
  }

  join: topcoder_x_project {
    type: left_outer
    sql_on: ${topcoder_x_issue.project_id} = ${topcoder_x_project.id} ;;
    relationship: one_to_many
  }

  join: topcoder_x_copilot_payment {
    type: left_outer
    sql_on: ${topcoder_x_copilot_payment.project} = ${topcoder_x_project.id} ;;
    relationship: one_to_many
  }

  join: challenge_phases {
    type: left_outer
    sql_on: ${challenge.challenge_id} = ${challenge_phases.challenge_id};;
    relationship: one_to_many
  }

}

explore: project_result {
  join: challenge {
    type: left_outer
    sql_on: ${project_result.project_id} = ${challenge.project_id} ;;
    relationship: many_to_one
  }

  join: user {
    type: inner
    sql_on: ${project_result.user_id} = ${user.coder_id} ;;
    relationship: many_to_one
  }

  join: country {
    type: left_outer
    sql_on: ${user.comp_country_code} = ${country.country_code} ;;
    relationship: many_to_one
  }

  join: client_project_dim {
    type: left_outer
    sql_on: ${client_project_dim.client_project_id} = ${challenge.client_project_id} ;;
    relationship: many_to_one
  }

  join: direct_project_dim {
    type: left_outer
    sql_on: ${challenge.tc_direct_project_id} = ${direct_project_dim.direct_project_id} ;;
    relationship: many_to_one
  }

  join: connect_project {
    type: left_outer
    sql_on: ${direct_project_dim.direct_project_id} = ${connect_project.direct_project_id} ;;
    relationship: many_to_one
  }

  join: copilot {
    from: user
    type: left_outer
    sql_on: ${challenge.copilot_id} = ${copilot.coder_id} ;;
    relationship: many_to_one
  }

  join: creator {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_creator_id} = ${creator.coder_id} ;;
    relationship: many_to_one
  }

  join: manager {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_manager_id} = ${manager.coder_id} ;;
    relationship: many_to_one
  }

  join: launcher {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_launcher_id} = ${launcher.coder_id} ;;
    relationship: many_to_one
  }

}

explore: design_project_result {
  join: challenge {
    type: left_outer
    sql_on: ${design_project_result.project_id} = ${challenge.project_id} ;;
    relationship: many_to_one
  }

  join: submitter {
    from: user
    type: inner
    sql_on: ${design_project_result.user_id} = ${submitter.coder_id} ;;
    relationship: many_to_one
  }

  join: submitter_country {
    from: country
    type: left_outer
    sql_on: ${submitter.comp_country_code} = ${submitter_country.country_code} ;;
    relationship: many_to_one
  }

  join: client_project_dim {
    type: left_outer
    sql_on: ${client_project_dim.client_project_id} = ${challenge.client_project_id} ;;
    relationship: many_to_one
  }

  join: direct_project_dim {
    type: left_outer
    sql_on: ${challenge.tc_direct_project_id} = ${direct_project_dim.direct_project_id} ;;
    relationship: many_to_one
  }

  join: connect_project {
    type: left_outer
    sql_on: ${direct_project_dim.direct_project_id} = ${connect_project.direct_project_id} ;;
    relationship: many_to_one
  }

  join: copilot {
    from: user
    type: left_outer
    sql_on: ${challenge.copilot_id} = ${copilot.coder_id} ;;
    relationship: many_to_one
  }

  join: creator {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_creator_id} = ${creator.coder_id} ;;
    relationship: many_to_one
  }

  join: manager {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_manager_id} = ${manager.coder_id} ;;
    relationship: many_to_one
  }

  join: launcher {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_launcher_id} = ${launcher.coder_id} ;;
    relationship: many_to_one
  }
}

explore: payment {
  join: user_payment {
    type: inner
    sql_on: ${payment.payment_id} = ${user_payment.payment_id} ;;
    relationship: one_to_many
  }

  join: payee {
    from: user
    type: inner
    sql_on: ${user_payment.user_id} = ${payee.coder_id} ;;
    relationship: many_to_many
  }

  join: member_profile_basic {
    type: inner
    sql_on: ${user_payment.user_id} = ${member_profile_basic.user_id} ;;
    relationship: many_to_many
  }

  join: member_profile_advanced {
    type: inner
    sql_on: ${user_payment.user_id} = ${member_profile_advanced.user_id} ;;
    relationship: many_to_many
  }
  join: payee_country {
    from: country
    type: inner
    sql_on: ${payee_country.country_code} = ${payee.country_code} ;;
    relationship: many_to_many
  }

  join: payee_competition_country {
    from: country
    type: inner
    sql_on: ${payee_competition_country.country_code} = ${payee.comp_country_code} ;;
    relationship: many_to_many
  }

   join: payment_create_date {
    from: calendar
    type: inner
    sql_on: ${payment.created_calendar_id} = ${payment_create_date.calendar_id} ;;
    relationship: many_to_one
  }

  join: payment_modify_date {
    from: calendar
    type: inner
   sql_on: ${payment.modified_calendar_id} = ${payment_modify_date.calendar_id} ;;
    relationship: many_to_one
  }

   join: payment_due_date {
    from: calendar
    type: inner
    sql_on: ${user_payment.due_calendar_id} = ${payment_due_date.calendar_id} ;;
    relationship: many_to_one
  }

  join: payment_paid_date {
    from: calendar
    type: inner
    sql_on: ${user_payment.paid_calendar_id} = ${payment_paid_date.calendar_id} ;;
    relationship: many_to_one
  }

  join: challenge {
    type: left_outer
    sql_on: ${payment.reference_id} = ${challenge.project_id} ;;
    relationship: many_to_one
  }

  join: challenge_technology {
    type: left_outer
    sql_on: ${challenge.project_id} = ${challenge_technology.project_id} ;;
    relationship: one_to_many
  }

  join: challenge_groups {
    type: left_outer
    sql_on: ${challenge.project_id} = ${challenge_groups.challenge_id} ;;
    relationship: many_to_many
  }

  join: direct_project_dim {
    type: left_outer
    sql_on: ${challenge.tc_direct_project_id} = ${direct_project_dim.direct_project_id} ;;
    relationship: many_to_one
  }

  join: connect_project {
    type: left_outer
    sql_on: ${direct_project_dim.direct_project_id} = ${connect_project.direct_project_id} ;;
    relationship: many_to_one
  }

  join: client_project_dim {
    type: left_outer
    sql_on: ${client_project_dim.client_project_id} = ${challenge.client_project_id} ;;
    relationship: many_to_one
  }

  join : fulfilment_copilot {
    type:left_outer
    sql_on: ${payee.coder_id} = ${fulfilment_copilot.copilot} ;;
    relationship: many_to_many
  }

  join: sfdc_account {
    type: left_outer
    view_label: "Reporting Account"
    sql_on: ${client_project_dim.reporting_sfdc_account} = ${sfdc_account.account_id};;
    relationship: many_to_one
  }

  join: sfdc_opportunity {
    type:  left_outer
    sql_on: ${sfdc_account.account_id} = ${sfdc_opportunity.account_id} ;;
    relationship: many_to_one
  }

  join: billing_account_budgets{
    type:  left_outer
    sql_on: ${client_project_dim.billing_account_id} = ${billing_account_budgets.billing_account_id} ;;
    relationship: one_to_one
  }

  #added on 27th Jan 2020
  join: user_tax_form {
    type: left_outer
    sql_on: ${user_tax_form.user_id} = ${payee.coder_id} ;;
    relationship: many_to_one
  }
}

#added on 27th Jan 2020
explore: user_tax_form {
  hidden:yes
  }

explore: user_payment {}

#added on 17th June 2019
explore: client_project_dim {
  join: reporting_account{
    from: sfdc_account
    type: left_outer
    sql_on: ${client_project_dim.reporting_sfdc_account} = ${reporting_account.account_id};;
    relationship: many_to_one
}

  #added on 20th June 2019
  join: sponsored_account{
    from :  sfdc_account
    type: left_outer
    sql_on: ${client_project_dim.billing_account_id} = ${sponsored_account.account_id};;
    relationship: many_to_one
  }
}

#- explore: client_user_stats

explore: contest {
  hidden: yes

  join: contest_project_xref {
    type: inner
    sql_on: ${contest.contest_id} = ${contest_project_xref.contest_id} ;;
    relationship: one_to_many
  }

  join: event {
    type: inner
    sql_on: ${contest.event_id} = ${event.event_id} ;;
    relationship: many_to_many
  }

  join: challenge {
    type: left_outer
    sql_on: ${contest_project_xref.project_id} = ${challenge.project_id} ;;
    relationship: many_to_one
  }

  join: client_project_dim {
    type: left_outer
    sql_on: ${client_project_dim.client_project_id} = ${challenge.client_project_id} ;;
    relationship: many_to_one
  }

  join: direct_project_dim {
    type: left_outer
    sql_on: ${challenge.tc_direct_project_id} = ${direct_project_dim.direct_project_id} ;;
    relationship: many_to_one
  }

  join: copilot {
    from: user
    type: left_outer
    sql_on: ${challenge.copilot_id} = ${copilot.coder_id} ;;
    relationship: many_to_one
  }

  join: creator {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_creator_id} = ${creator.coder_id} ;;
    relationship: many_to_one
  }

  join: manager {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_manager_id} = ${manager.coder_id} ;;
    relationship: many_to_one
  }

  join: launcher {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_launcher_id} = ${launcher.coder_id} ;;
    relationship: many_to_one
  }
}

#- explore: contest_prize
#- explore: contest_project_xref
#- explore: contest_result
#- explore: contest_season_xref
#- explore: contest_stage_xref

explore: copilot_statistics {
  join: user {
    type: inner
    sql_on: ${copilot_statistics.user_id} = ${user.coder_id} ;;
    relationship: one_to_one
  }
}

explore: country_user_rank {}

#- explore: data_type_lu

explore: direct_project_dim {
  join: connect_project {
    type: left_outer
    sql_on: ${direct_project_dim.direct_project_id} = ${connect_project.direct_project_id} ;;
    relationship: many_to_one
  }
}

#- explore: dr_points

explore: event {
  join: event_registration {
    type: inner
    sql_on: ${event.event_id} = ${event_registration.event_id} ;;
    relationship: many_to_many
  }

  join: registrant {
    from: user
    type: left_outer
    sql_on: ${event_registration.user_id} = ${registrant.coder_id} ;;
    relationship: many_to_many
  }

  join: country {
    type: left_outer
    sql_on: ${registrant.comp_country_code} = ${country.country_code} ;;
    relationship: many_to_one
  }

}

explore: jira_issue {}

#- explore: monthly_contest_stats
#- explore: participation
#explore: participation_metrics_report_copilot {
#  join: user {
#    type: inner
#    sql_on: ${participation_metrics_report_copilot.copilot_id} = ${user.coder_id} ;;
#    relationship: one_to_one
#  }
#
#  join: challenge {
#    type: left_outer
#    sql_on: ${challenge.project_id} = ${participation_metrics_report_copilot.contest_id} ;;
#    relationship: many_to_one
#  }

#  join: client_project_dim {
#    type: left_outer
#    sql_on: ${client_project_dim.client_project_id} = ${challenge.client_project_id} ;;
#    relationship: many_to_one
#  }
#}

#explore: participation_metrics_report_member {
#  join: user {
#    type: inner
#    sql_on: ${participation_metrics_report_member.registrant_id} = ${user.coder_id} ;;
#    relationship: one_to_one
#  }
#
#  join: challenge {
#    type: left_outer
#    sql_on: ${challenge.project_id} = ${participation_metrics_report_member.contest_id} ;;
#    relationship: many_to_one
#  }
#
#  join: client_project_dim {
#    type: left_outer
#    sql_on: ${client_project_dim.client_project_id} = ${challenge.client_project_id} ;;
#    relationship: many_to_one
#  }
#}

explore: challenge_platform {
  join: challenge {
    type: left_outer
    sql_on: ${challenge.project_id} = ${challenge_platform.project_id} ;;
    relationship: many_to_one
  }

  join: client_project_dim {
    type: left_outer
    sql_on: ${client_project_dim.client_project_id} = ${challenge.client_project_id} ;;
    relationship: many_to_one
  }

  join: project_result {
    type: left_outer
    sql_on: ${challenge.project_id} = ${project_result.project_id} ;;
    relationship: many_to_one
  }

  join: direct_project_dim {
    type: left_outer
    sql_on: ${challenge.tc_direct_project_id} = ${direct_project_dim.direct_project_id} ;;
    relationship: many_to_one
  }

  join: connect_project {
    type: left_outer
    sql_on: ${direct_project_dim.direct_project_id} = ${connect_project.direct_project_id} ;;
    relationship: many_to_one
  }

  join: copilot {
    from: user
    type: left_outer
    sql_on: ${challenge.copilot_id} = ${copilot.coder_id} ;;
    relationship: many_to_one
  }

  join: creator {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_creator_id} = ${creator.coder_id} ;;
    relationship: many_to_one
  }

  join: manager {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_manager_id} = ${manager.coder_id} ;;
    relationship: many_to_one
  }

  join: launcher {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_launcher_id} = ${launcher.coder_id} ;;
    relationship: many_to_one
  }

  join: submitter {
    from: user
    type: inner
    sql_on: ${project_result.user_id} = ${submitter.coder_id} ;;
    relationship: many_to_one
  }

  join: submitter_country {
    from: country
    type: left_outer
    sql_on: ${submitter.comp_country_code} = ${submitter_country.country_code} ;;
    relationship: many_to_one
  }
}

#- explore: project_review
#- explore: project_spec_review_xref

explore: challenge_technology {
  join: challenge {
    type: left_outer
    sql_on: ${challenge.project_id} = ${challenge_technology.project_id} ;;
    relationship: many_to_one
  }

  join: challenge_groups {
    type: left_outer
    sql_on: ${challenge.project_id} = ${challenge_groups.challenge_id} ;;
    relationship: many_to_many
  }

  join: client_project_dim {
    type: left_outer
    sql_on: ${client_project_dim.client_project_id} = ${challenge.client_project_id} ;;
    relationship: many_to_one
  }

  #added on 30th Sept 2019
  join: sfdc_account {
    type: left_outer
    view_label: "Reporting Account"
    sql_on: ${client_project_dim.reporting_sfdc_account} = ${sfdc_account.account_id};;
    relationship: many_to_one
  }

  join: project_result {
    type: left_outer
    sql_on: ${challenge.project_id} = ${project_result.project_id} ;;
    relationship: many_to_one
  }

  join: direct_project_dim {
    type: left_outer
    sql_on: ${challenge.tc_direct_project_id} = ${direct_project_dim.direct_project_id} ;;
    relationship: many_to_one
  }

  join: connect_project {
    type: left_outer
    sql_on: ${direct_project_dim.direct_project_id} = ${connect_project.direct_project_id} ;;
    relationship: many_to_one
  }

  join: copilot {
    from: user
    type: left_outer
    sql_on: ${challenge.copilot_id} = ${copilot.coder_id} ;;
    relationship: many_to_one
  }

  join: creator {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_creator_id} = ${creator.coder_id} ;;
    relationship: many_to_one
  }

  join: manager {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_manager_id} = ${manager.coder_id} ;;
    relationship: many_to_one
  }

  join: launcher {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_launcher_id} = ${launcher.coder_id} ;;
    relationship: many_to_one
  }

  join: submitter {
    from: user
    type: inner
    sql_on: ${project_result.user_id} = ${submitter.coder_id} ;;
    relationship: many_to_one
  }

  join: submitter_country {
    from: country
    type: left_outer
    sql_on: ${submitter.comp_country_code} = ${submitter_country.country_code} ;;
    relationship: many_to_one
  }

}

#- explore: review_resp
explore: rookie {}

#- explore: royalty
explore: school_user_rank {}

#- explore: season
#- explore: stage
explore: streak {}

explore: streak_type_lu {}

explore: submission {}

explore: submission_review {
  join: reviewer {
    from: user
    type: inner
    sql_on: ${submission_review.reviewer_id} = ${reviewer.coder_id} ;;
    relationship: many_to_one
  }

  join: reviewer_responsibility {
    from: review_resp
    type: inner
    sql_on: ${submission_review.review_resp_id} = ${reviewer_responsibility.review_resp_id} ;;
    relationship: many_to_one
  }

  join: challenge {
    type: inner
    sql_on: ${submission_review.project_id} = ${challenge.project_id} ;;
    relationship: many_to_one
  }

  join: client_project_dim {
    type: left_outer
    sql_on: ${client_project_dim.client_project_id} = ${challenge.client_project_id} ;;
    relationship: many_to_one
  }

  join: direct_project_dim {
    type: left_outer
    sql_on: ${challenge.tc_direct_project_id} = ${direct_project_dim.direct_project_id} ;;
    relationship: many_to_one
  }

  join: connect_project {
    type: left_outer
    sql_on: ${direct_project_dim.direct_project_id} = ${connect_project.direct_project_id} ;;
    relationship: many_to_one
  }

  join: copilot {
    from: user
    type: left_outer
    sql_on: ${challenge.copilot_id} = ${copilot.coder_id} ;;
    relationship: many_to_one
  }

  join: creator {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_creator_id} = ${creator.coder_id} ;;
    relationship: many_to_one
  }

  join: manager {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_manager_id} = ${manager.coder_id} ;;
    relationship: many_to_one
  }

  join: launcher {
    from: user
    type: left_outer
    sql_on: ${challenge.challenge_launcher_id} = ${launcher.coder_id} ;;
    relationship: many_to_one
  }

  join: challenge_groups {
    type: left_outer
    sql_on: ${challenge.project_id} = ${challenge_groups.challenge_id} ;;
    relationship: one_to_many
  }
}

explore: subjective_response {}

#- explore: tcd_project_stat
explore: track {}

explore: track_contest {}

explore: track_contest_results {}

explore: user_achievement_rule {}

explore: user_achievement_type_lu {}

explore: user_achievement_xref {}

#- explore: user_component_score
#- explore: user_contest_prize
explore: user_event_xref {}

explore: user_rank {}

explore: user_rank_type_lu {}

explore: user_rating {
  join: challenge_type {
    from: challenge_type
    type: left_outer
    sql_on: ${user_rating.phase_id} = ${challenge_type.phase_id} ;;
    relationship: many_to_one
  }

  join: user {
    type: inner
    sql_on: ${user_rating.user_id} = ${user.coder_id} ;;
    relationship: many_to_one
  }

  join: country {
    type: left_outer
    sql_on: ${user.comp_country_code} = ${country.country_code} ;;
    relationship: many_to_one
  }
}

explore: user_reliability {}

explore: weekly_contest_stats {}

explore: coder_rank {}

explore: language_lu {}

explore: algo_rating {
  join: user {
    type: inner
    sql_on: ${algo_rating.coder_id} = ${user.coder_id} ;;
    relationship: many_to_one
  }

  join: language_lu {
    type: inner
    sql_on: ${user.language_id} = ${language_lu.language_id} ;;
    relationship: many_to_one
  }

  join: country {
    type: left_outer
    sql_on: ${user.comp_country_code} = ${country.country_code} ;;
    relationship: many_to_one
  }

  join: algo_rating_type_lu {
    type: inner
    sql_on: ${algo_rating.algo_rating_type_id} = ${algo_rating_type_lu.algo_rating_type_id} ;;
    relationship: many_to_one
  }
}

explore: subscription {}

# Added 23rd March - 2018
explore: member_participation {}

#Added 3rd April - 2018
explore: review_board_by_track {
  join: user {
    type:inner
    sql_on: ${user.coder_id} = ${review_board_by_track.user_id} ;;
    relationship: many_to_one
  }
}

# Added 17th August - 2018
explore: client_terms_mapping {

  join: client_project_dim {
    type: left_outer
    sql_on: ${client_project_dim.billing_account_id} = ${client_terms_mapping.billing_account_id} ;;
    relationship: many_to_one
  }

  join: challenge {
    type: left_outer
    sql_on: ${challenge.client_project_id} = ${client_project_dim.client_project_id} ;;
    relationship: many_to_one
  }

  join: terms_of_use {
    type: left_outer
    sql_on: ${terms_of_use.terms_of_use_id} = ${client_terms_mapping.terms_of_use_id} ;;
    relationship: many_to_one
  }

}

# Added 23rd August - 2018
explore: revenue_details {}

# Added 24th August - 2018
explore: srm_tco19 {

  join: user {
    type: left_outer
    sql_on: ${srm_tco19.user_id} = ${user.coder_id} ;;
    relationship: many_to_one
  }

  join : member_profile_all {
    type: left_outer
    sql_on: ${user.coder_id} = ${member_profile_all.user_id} ;;
    relationship: one_to_one
  }
  # cache for 24 hours
  persist_with: srm_cache

}

# Added 3rd September - 2018
explore: user_terms_signed {

  join: terms_of_use {
    type: left_outer
    sql_on: ${user_terms_signed.terms_of_use_id} = ${terms_of_use.terms_of_use_id} ;;
    relationship: many_to_one
  }

  join: user {
    type:left_outer
    sql_on: ${user.coder_id} = ${user_terms_signed.user_id} ;;
    relationship: many_to_one
  }

}

# Added 11th September - 2018
explore: connect_project_phases {

  join: connect_project {
    type: inner
    sql_on: ${connect_project_phases.project_id} = ${connect_project.id} ;;
    relationship: many_to_one
  }

}

# Added 17th September - 2018
  explore: newest_submitters {

    join: challenge {
      type: left_outer
      sql_on: ${newest_submitters.challenge_id} = ${challenge.project_id} ;;
      relationship: many_to_one
    }

    join: challenge_groups {
      type: left_outer
      sql_on: ${newest_submitters.challenge_id} = ${challenge_groups.challenge_id} ;;
      relationship: one_to_many
    }

    join: user {
      type:left_outer
      sql_on: ${newest_submitters.user_id} = ${user.coder_id};;
      relationship: many_to_one
    }

  }

# Added 25th September - 2018
explore: problem {

  join: round {
    type: left_outer
    sql_on: ${problem.round_id} = ${round.round_id} ;;
    relationship: many_to_one
  }

}

# Added 28th September - 2018
explore: non_qa_dev_challenges {
  join: challenge_groups {
    type: left_outer
    sql_on: ${non_qa_dev_challenges.project_id} = ${challenge_groups.challenge_id} ;;
    relationship: one_to_many
  }
  join: user {
    type: left_outer
    sql_on: ${non_qa_dev_challenges.registrant_id} = ${user.coder_id} ;;
    relationship: many_to_one
  }
  join: member_profile_basic {
    type: left_outer
    sql_on: ${non_qa_dev_challenges.registrant_id} = ${member_profile_basic.user_id} ;;
    relationship: many_to_one
  }
  join: challenge_technology {
    type: left_outer
    sql_on: ${non_qa_dev_challenges.project_id} = ${challenge_technology.project_id} ;;
    relationship: one_to_many
  }
  # cache for 8 hours
  persist_with: project_cache
}

  explore: non_qa_design_challenges {
    join: challenge_groups {
      type: left_outer
      sql_on: ${non_qa_design_challenges.project_id} = ${challenge_groups.challenge_id} ;;
      relationship: one_to_many
    }
    join: user {
      type: left_outer
      sql_on: ${non_qa_design_challenges.registrant_id} = ${user.coder_id} ;;
      relationship: many_to_one
    }
    join: member_profile_basic {
      type: left_outer
      sql_on: ${non_qa_design_challenges.registrant_id} = ${member_profile_basic.user_id} ;;
      relationship: many_to_one
    }
    join: challenge_technology {
      type: left_outer
      sql_on: ${non_qa_design_challenges.project_id} = ${challenge_technology.project_id} ;;
      relationship: one_to_many
    }
    # cache for 8 hours
    persist_with: project_cache
}

#Added 14th November 2018

explore: challenge_user_payments {
  join: challenge {
    type: left_outer
    sql_on: ${challenge_user_payments.challenge_id} = ${challenge.project_id} ;;
    relationship: many_to_one
   }
    join: user {
      type: left_outer
      sql_on: ${challenge_user_payments.user_id} = ${user.coder_id} ;;
      relationship: many_to_one
    }
  }

  # for new data science participants and submitters
  explore: data_science_members  {}

  #for sfdc account and opportunity and assignment table
  explore:  sfdc_account{}
  explore:  sfdc_opportunity{}
  explore:  sfdc_assignment {}
  explore:  sfdc_forecast {}
  explore:  sfdc_revenue_recognition {
    join: project_stream {
      type: inner
      sql_on: ${project_stream.id}=${sfdc_revenue_recognition.project_strem} ;;
      relationship: one_to_many
    }
  }

  #for prject stream data
  #joined afdc assignment table on 8th Jan 2020
  explore: project_stream {
    join: sfdc_assignment {
      type: left_outer
      sql_on: ${project_stream.id}=${sfdc_assignment.project_stream_id} ;;
      relationship: one_to_many
    }
  }


#for December promotion look
explore: dec_give_away_submission {
  join: member_profile_basic {
    relationship: many_to_one
    sql_on: ${member_profile_basic.user_id} = ${dec_give_away_submission.user_id};;
  }
}

#for Design month TCO leaderboards
#added on 25th April 2020

explore: design_month_tco {
  join:  challenge{
    type: left_outer
    relationship: many_to_one
    sql_on: ${design_month_tco.challenge_id} = ${challenge.challenge_id} ;;
  }
  join: user {
    type: left_outer
    sql_on: ${design_month_tco.user_id} = ${user.coder_id} ;;
    relationship: many_to_one
  }

  join: user_payment {
    type: inner
    sql_on: ${design_month_tco.user_id} = ${user_payment.user_id} ;;
    relationship: many_to_many
  }

  join: payment {
    type: inner
    sql_on: ${user_payment.payment_id} = ${payment.payment_id} ;;
    relationship: one_to_many
  }

  join: challenge_stats {
    type: left_outer
    sql_on: ${challenge_stats.challenge_id} = ${challenge.challenge_id} ;;
    relationship: many_to_one
   }

  join: design_month_tco_temp {
    type: left_outer
    sql_on: ${design_month_tco_temp.user_id} = ${design_month_tco.user_id} ;;
    relationship: one_to_many
  }

  }



  explore: tco_rating_booster {
    hidden: yes
  }

#Member_max_rating Derived table , explore ,view has been removed
#explore: member_max_rating{
 #   hidden: yes
#  }
  #added on 1st July 2020

  #modified on 17th July 2020

  explore: tco_leaderboard {

    join: challenge {
      type: left_outer
      relationship: many_to_one
      sql_on: ${tco_leaderboard.challenge_id} = ${challenge.challenge_id} ;;
    }

    join: round {
      type: left_outer
      relationship: many_to_one
      sql_on: ${tco_leaderboard.round_id} = ${round.round_id} ;;
    }

    join: member_profile_basic {
      type: left_outer
      relationship: many_to_one
      sql_on: ${tco_leaderboard.user_id} = ${member_profile_basic.user_id} ;;
    }

    join : member_profile_all {
      type: left_outer
      relationship: many_to_one
      sql_on:  ${tco_leaderboard.user_id} = ${member_profile_all.user_id} ;;
    }

  #Removed member_stats and member_max_rating as this field has now being loeaded into member profile basic.

    #join: member_stats {
    #  type: left_outer
    #  relationship: many_to_one
    #  sql_on:  ${member_stats.user_id}  = ${tco_leaderboard.user_id} ;;
    #}

    #join: member_max_rating {
    #  type: left_outer
    #  relationship: one_to_one
    #  sql_on: ${tco_leaderboard.user_id}  = ${member_max_rating.user_id} ;;
    #}

    #join: fulfilment_copilot {
    #  type: left_outer
    #  relationship: one_to_one
    #  sql_on: ${tco_leaderboard.challenge_id} = ${fulfilment_copilot.challenge_id} ;;
    #}

  }
