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

explore: member_stats {
  join: member_profile_basic {
    type: left_outer
    sql_on: ${member_stats.user_id} = ${member_profile_basic.user_id} ;;
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
  join: member_profile_basic {
    type: left_outer
    sql_on: ${member_newsletters.user_id} = ${member_profile_basic.user_id} ;;
    relationship: one_to_one
  }
}

# Added 20th November - 2018

explore: member_profile_360 {
  join: member_stats {
    type: left_outer
    sql_on: ${member_profile_360.user_id} = ${member_stats.user_id} ;;
    relationship: one_to_many
  }

  join: member_stats_history {
    type: left_outer
    sql_on: ${member_profile_360.user_id} = ${member_stats_history.user_id} ;;
    relationship: one_to_many
  }

  join: challenge {
    type: left_outer
    sql_on: ${member_stats_history.challenge_id} = ${challenge.project_id} ;;
    relationship: many_to_many
  }

  join: member_community{
    type: left_outer
    sql_on: ${member_profile_360.user_id} = ${member_community.user_id} ;;
    relationship: one_to_many
  }

  join: member_device{
    type: left_outer
    sql_on: ${member_profile_360.user_id} = ${member_device.user_id} ;;
    relationship: one_to_many
  }

  join: member_hobby{
    type: left_outer
    sql_on: ${member_profile_360.user_id} = ${member_hobby.user_id} ;;
    relationship: one_to_many
  }

  join: member_skill{
    type: left_outer
    sql_on: ${member_profile_360.user_id} = ${member_skill.user_id} ;;
    relationship: one_to_many
  }

  join: skill {
    type: left_outer
    sql_on: ${member_skill.skill_id} = ${skill.skill_id} ;;
    relationship: many_to_many
  }

  join: member_service_provider{
    type: left_outer
    sql_on: ${member_profile_360.user_id} = ${member_service_provider.user_id} ;;
    relationship: one_to_many
  }

  join: member_software{
    type: left_outer
    sql_on: ${member_profile_360.user_id} = ${member_software.user_id} ;;
    relationship: one_to_many
  }

  join: member_subscription{
    type: left_outer
    sql_on: ${member_profile_360.user_id} = ${member_subscription.user_id} ;;
    relationship: one_to_many
  }

  join: member_newsletters{
    type: left_outer
    sql_on: ${member_profile_360.user_id} = ${member_newsletters.user_id} ;;
    relationship: one_to_many
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
}
