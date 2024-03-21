connection: "prod_-_topcoder_redshift"

#include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

include: "/SRM/*.view.lkml" # include all views from /SRM folder
include: "/members/*.view.lkml"
# # Select the views that should be a part of this model,
# # and define the joins that connect them together.

fiscal_month_offset: -9

# sets the week start day to Sunday
week_start_day: sunday

# filters will NOT be case sensitive
case_sensitive: no


explore: srm_challenge  {


join:user{
  type: left_outer
  sql_on: ${user.coder_id} = ${srm_challenge.challenger_id} ;;
  relationship: one_to_many
}


}
