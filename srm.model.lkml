connection: "prod_-_topcoder_redshift"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.

fiscal_month_offset: -9

# sets the week start day to Sunday
week_start_day: sunday

# filters will NOT be case sensitive
case_sensitive: no

explore: round {}

explore: user {
label:"SRM Submission"
join:problem_submission{
  type: left_outer
  sql_on: ${user.coder_id}=${problem_submission.coder_id} ;;
  relationship: one_to_many
}
}
