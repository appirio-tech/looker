connection: "prod_-_topcoder_redshift"

# include all the views
include: "*.view"
include: "/SRM/*.view.lkml" # include all views from /SRM folder
include: "/informix_challenge/*.view.lkml"             # include all views from /informix_challenge folder
include: "/user/*.view.lkml"
include: "/connect/*.view.lkml"
include: "/leaderboards/*.view.lkml"
include: "/submission/*.view.lkml"
include: "/connect_project/*.view.lkml"

# include all the dashboards
# include: "*.dashboard"

# sets the week start day to Sunday
week_start_day: sunday

# filters will NOT be case sensitive
case_sensitive: no

#for fiscal year
fiscal_month_offset: -9

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
  join: challenge_technology {
    type: left_outer
    sql_on: ${challenge_stats.project_id} = ${challenge_technology.project_id} ;;
    relationship: one_to_many
  }
}

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

explore: round_division {}
explore: room {}
explore: room_result {}
explore: data_science_contest {}


explore: copilot {}


# Table Views

explore: user {
  join: country {
    type: left_outer
    sql_on: ${user.comp_country_code} = ${country.country_code} ;;
    relationship: many_to_one
  }
}

explore: country {}

explore: calendar {}


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


explore: client_project_dim {
}

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

explore: copilot_statistics {
  join: user {
    type: inner
    sql_on: ${copilot_statistics.user_id} = ${user.coder_id} ;;
    relationship: one_to_one
  }
}


explore: direct_project_dim {
  join: connect_project {
    type: left_outer
    sql_on: ${direct_project_dim.direct_project_id} = ${connect_project.direct_project_id} ;;
    relationship: many_to_one
  }
}


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

explore: challenge_technology {
  join: challenge {
    type: left_outer
    sql_on: ${challenge.project_id} = ${challenge_technology.project_id} ;;
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
explore: user_achievement_rule {}

explore: user_achievement_type_lu {}

explore: user_achievement_xref {}

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
