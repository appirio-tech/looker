connection: "prod_-_topcoder_redshift"

# include all views in this project
include: "*.view"

# include all dashboards in this project
# include: "*.dashboard"

# sets the week start day to Sunday
week_start_day: sunday

explore: user {
  fields: [
    ALL_FIELDS*,
    user.email,
    user.first_name,
    user.last_name
  ]

  join: country {
    type: left_outer
    sql_on: ${user.comp_country_code} = ${country.country_code} ;;
    relationship: many_to_one
  }
}

explore: challenge {
  fields: [
    ALL_FIELDS*,
    -copilot.email,
    -creator.email,
    -manager.email,
    -launcher.email
  ]

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
    sql_on: ${direct_project_dim.direct_project_id} = ${connect_project.directprojectid} ;;
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
}

explore: project_result {
  fields: [
    ALL_FIELDS*,
    -copilot.email,
    -submitter.email,
    -creator.email,
    -manager.email,
    -launcher.email
  ]

  join: challenge {
    type: left_outer
    sql_on: ${project_result.project_id} = ${challenge.project_id} ;;
    relationship: many_to_one
  }

  join: submitter {
    from: user
    type: inner
    sql_on: ${project_result.user_id} = ${submitter.coder_id} ;;
    relationship: many_to_one
  }

  join: country {
    type: left_outer
    sql_on: ${submitter.comp_country_code} = ${country.country_code} ;;
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
    sql_on: ${direct_project_dim.direct_project_id} = ${connect_project.directprojectid} ;;
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
  fields: [
    ALL_FIELDS*,
    -copilot.email,
    -creator.email,
    -manager.email,
    -launcher.email,
    -submitter.email
  ]

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
    sql_on: ${direct_project_dim.direct_project_id} = ${connect_project.directprojectid} ;;
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


explore: round_division {}
explore: room {}


explore: room_result {
  fields: [
    ALL_FIELDS*,
    -submitter.email,
    -submitter.first_name,
    -submitter.last_name
  ]

  join: submitter {
    from: user
    type: inner
    sql_on: ${room_result.coder_id} = ${submitter.coder_id} ;;
    relationship: many_to_one
  }

  join: country {
    type: left_outer
    sql_on: ${submitter.comp_country_code} = ${country.country_code} ;;
    relationship: many_to_one
  }

  join: room {
    type: inner
    sql_on: ${room_result.room_id} = ${room.room_id} ;;
    relationship: many_to_one
  }

  join: round {
    type: inner
    sql_on: ${room_result.round_id} = ${round.round_id} ;;
    relationship: many_to_one
  }

}


explore: data_science_contest {}

explore: auth_refresh_log {}
