connection: "prod_-_topcoder_redshift"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
include: "/topcoder_x/*.view.lkml"             # include all views from /topcoder_x folder

fiscal_month_offset: -9

# sets the week start day to Sunday
week_start_day: sunday

# filters will NOT be case sensitive
case_sensitive: no

#for Topcoder X tables
#explore: topcoder_x_copilot_payment {}

#: topcoder_x_issue {}
explore: topcoder_x_owner_user_group {}
explore: topcoder_x_owner_user_team {}
explore: topcoder_x_project {

  join: topcoder_x_copilot_payment {
    type: left_outer
    sql_on: ${topcoder_x_project.id} = ${topcoder_x_copilot_payment.project} ;;
    relationship: one_to_many
  }

  join : topcoder_x_issue {
    type: left_outer
    sql_on: ${topcoder_x_project.id} = ${topcoder_x_issue.project_id} ;;
    relationship: one_to_many
  }

  join: direct_project_dim {
    type: left_outer
    sql_on: ${topcoder_x_project.tc_direct_id} = ${direct_project_dim.direct_project_id} ;;
    relationship: many_to_one
  }

  join: client_project_dim {
    type: left_outer
    sql_on: ${client_project_dim.client_project_id} = ${challenge.client_project_id} ;;
    relationship: many_to_one
  }

  join: sfdc_account {
    view_label: "Reporting Account"
    type: left_outer
    sql_on: ${client_project_dim.reporting_sfdc_account} = ${sfdc_account.account_id};;
    relationship: many_to_one
  }

  join: challenge {
    type: left_outer
    sql_on: ${topcoder_x_issue.challenge_id} = ${challenge.challenge_id}  ;;
    relationship: one_to_one
  }

  join: winner {
    from: user
    type: left_outer
    sql_on: ${challenge.winner_id} = ${winner.coder_id} ;;
    relationship: many_to_one
  }



}
explore: topcoder_x_user {}
explore: topcoder_x_user_mapping {}
