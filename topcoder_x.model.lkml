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

#for Topcoder X tables
explore: topcoder_x_copilot_payment {}
explore: topcoder_x_issue {}
explore: topcoder_x_owner_user_group {}
explore: topcoder_x_owner_user_team {}
explore: topcoder_x_project {}
explore: topcoder_x_user {}
explore: topcoder_x_user_mapping {}
