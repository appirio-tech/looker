connection: "prod_-_topcoder_redshift"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # This is a temporary model used to store temporary tables and looks

 explore: dec_give_away_submission {
   join: member_profile_basic {
    relationship: many_to_one
     sql_on: ${member_profile_basic.user_id} = ${dec_give_away_submission.user_id};;
    }
 }

explore: copilot_self_payment {}
