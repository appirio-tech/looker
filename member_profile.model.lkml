connection: "prod_-_topcoder_redshift"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
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

explore: member_profile_advanced {}

explore: member_community {
  join: member_profile_basic{
    type: left_outer
    sql_on: ${member_community.user_id} = ${member_profile_basic.user_id} ;;
    relationship: many_to_one
  }
}

explore: member_device {
  join: member_profile_basic {
    type: left_outer
    sql_on: ${member_device.user_id} = ${member_profile_basic.user_id} ;;
    relationship: many_to_one
  }
}

explore: member_hobby {
  join: member_profile_basic {
    type: left_outer
    sql_on: ${member_hobby.user_id} = ${member_profile_basic.user_id} ;;
    relationship: many_to_one
  }
}

explore: member_service_provider {
  join: member_profile_basic {
    type: left_outer
    sql_on: ${member_service_provider.user_id} = ${member_profile_basic.user_id} ;;
    relationship: many_to_one
  }
}

explore: member_software {
  join: member_profile_basic {
    type: left_outer
    sql_on: ${member_software.user_id} = ${member_profile_basic.user_id} ;;
    relationship: many_to_one
  }
}

explore: member_subscription {
  join: member_profile_basic {
    type: left_outer
    sql_on: ${member_subscription.user_id} = ${member_profile_basic.user_id} ;;
    relationship: many_to_one
  }
}

# Added 1st November - 2018

explore: member_stats {}
