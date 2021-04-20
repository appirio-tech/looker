view: heap_users {
  sql_table_name: heapdata.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: _email {
    type: string
    sql: ${TABLE}._email ;;
  }

  dimension: _user_id {
    type: string
    sql: ${TABLE}._user_id ;;
  }

  dimension: avatar {
    type: string
    sql: ${TABLE}.avatar ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: createdat {
    type: string
    sql: ${TABLE}.createdat ;;
  }

  dimension: customtrackingpreferences_advertising {
    type: string
    sql: ${TABLE}.customtrackingpreferences_advertising ;;
  }

  dimension: customtrackingpreferences_functional {
    type: string
    sql: ${TABLE}.customtrackingpreferences_functional ;;
  }

  dimension: customtrackingpreferences_marketingandanalytics {
    type: string
    sql: ${TABLE}.customtrackingpreferences_marketingandanalytics ;;
  }

  dimension: destinationtrackingpreferences_ {
    type: string
    sql: ${TABLE}.destinationtrackingpreferences_ ;;
  }

  dimension: destinationtrackingpreferences_chameleon {
    type: string
    sql: ${TABLE}.destinationtrackingpreferences_chameleon ;;
  }

  dimension: destinationtrackingpreferences_google_analytics {
    type: string
    sql: ${TABLE}.destinationtrackingpreferences_google_analytics ;;
  }

  dimension: destinationtrackingpreferences_google_tag_manager {
    type: string
    sql: ${TABLE}.destinationtrackingpreferences_google_tag_manager ;;
  }

  dimension: destinationtrackingpreferences_heap {
    type: string
    sql: ${TABLE}.destinationtrackingpreferences_heap ;;
  }

  dimension: destinationtrackingpreferences_hotjar {
    type: string
    sql: ${TABLE}.destinationtrackingpreferences_hotjar ;;
  }

  dimension: destinationtrackingpreferences_linkedin_insight_tag {
    type: string
    sql: ${TABLE}.destinationtrackingpreferences_linkedin_insight_tag ;;
  }

  dimension: destinationtrackingpreferences_quora_conversion_pixel {
    type: string
    sql: ${TABLE}.destinationtrackingpreferences_quora_conversion_pixel ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: followers_count {
    type: string
    sql: ${TABLE}.followers_count ;;
  }

  dimension: for_hire {
    type: string
    sql: ${TABLE}.for_hire ;;
  }

  dimension: group_id {
    type: string
    sql: ${TABLE}.group_id ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
  }

  dimension: groups {
    type: string
    sql: ${TABLE}.groups ;;
  }

  dimension: handle {
    type: string
    sql: ${TABLE}.handle ;;
  }

  dimension: has_advanced_search {
    type: string
    sql: ${TABLE}.has_advanced_search ;;
  }

  dimension: has_basic_search {
    type: string
    sql: ${TABLE}.has_basic_search ;;
  }

  dimension: has_hiring {
    type: string
    sql: ${TABLE}.has_hiring ;;
  }

  dimension: has_jobs {
    type: string
    sql: ${TABLE}.has_jobs ;;
  }

  dimension: identity {
    type: string
    sql: ${TABLE}.identity ;;
  }

  dimension: intent_get_hired {
    type: string
    sql: ${TABLE}.intent_get_hired ;;
  }

  dimension: intent_hire {
    type: string
    sql: ${TABLE}.intent_hire ;;
  }

  dimension: intent_inspiration {
    type: string
    sql: ${TABLE}.intent_inspiration ;;
  }

  dimension: intent_share {
    type: string
    sql: ${TABLE}.intent_share ;;
  }

  dimension: ip_latitude {
    type: string
    sql: ${TABLE}.ip_latitude ;;
  }

  dimension: ip_longitude {
    type: string
    sql: ${TABLE}.ip_longitude ;;
  }

  dimension: is_pro {
    type: string
    sql: ${TABLE}.is_pro ;;
  }

  dimension: is_team {
    type: string
    sql: ${TABLE}.is_team ;;
  }

  dimension: is_team_owner {
    type: string
    sql: ${TABLE}.is_team_owner ;;
  }

  dimension: is_topcoder_admin {
    type: string
    sql: ${TABLE}.is_topcoder_admin ;;
  }

  dimension: is_topcoder_copilot {
    type: string
    sql: ${TABLE}.is_topcoder_copilot ;;
  }

  dimension: is_topcoder_manager {
    type: string
    sql: ${TABLE}.is_topcoder_manager ;;
  }

  dimension: is_topcoder_user {
    type: string
    sql: ${TABLE}.is_topcoder_user ;;
  }

  dimension_group: joindate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.joindate ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_modified ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
  }

  dimension: member_community_blockchain {
    type: string
    sql: ${TABLE}.member_community_blockchain ;;
  }

  dimension: member_community_cognitive {
    type: string
    sql: ${TABLE}.member_community_cognitive ;;
  }

  dimension: member_profile_all_age_bucket {
    type: string
    sql: ${TABLE}.member_profile_all_age_bucket ;;
  }

  dimension: member_profile_all_company_name {
    type: string
    sql: ${TABLE}.member_profile_all_company_name ;;
  }

  dimension: member_profile_all_gender {
    type: string
    sql: ${TABLE}.member_profile_all_gender ;;
  }

  dimension: member_profile_all_handle {
    type: string
    sql: ${TABLE}.member_profile_all_handle ;;
  }

  dimension: member_profile_all_tracks {
    type: string
    sql: ${TABLE}.member_profile_all_tracks ;;
  }

  dimension: member_stats_avg_placement {
    type: string
    sql: ${TABLE}.member_stats_avg_placement ;;
  }

  dimension: member_stats_maximum_rating {
    type: string
    sql: ${TABLE}.member_stats_maximum_rating ;;
  }

  dimension: member_stats_most_recent_event_date {
    type: string
    sql: ${TABLE}.member_stats_most_recent_event_date ;;
  }

  dimension: member_stats_num_inquiries {
    type: string
    sql: ${TABLE}.member_stats_num_inquiries ;;
  }

  dimension: member_stats_rating {
    type: string
    sql: ${TABLE}.member_stats_rating ;;
  }

  dimension: member_stats_submission_rate {
    type: string
    sql: ${TABLE}.member_stats_submission_rate ;;
  }

  dimension: member_stats_top_five_finishes {
    type: string
    sql: ${TABLE}.member_stats_top_five_finishes ;;
  }

  dimension: member_stats_top_ten_finishes {
    type: string
    sql: ${TABLE}.member_stats_top_ten_finishes ;;
  }

  dimension: member_stats_track {
    type: string
    sql: ${TABLE}.member_stats_track ;;
  }

  dimension: member_stats_win_percent {
    type: string
    sql: ${TABLE}.member_stats_win_percent ;;
  }

  dimension: member_stats_wins {
    type: string
    sql: ${TABLE}.member_stats_wins ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: on_team {
    type: string
    sql: ${TABLE}.on_team ;;
  }

  dimension: place {
    type: string
    sql: ${TABLE}.place ;;
  }

  dimension: player_followers_count {
    type: string
    sql: ${TABLE}.player_followers_count ;;
  }

  dimension: roles {
    type: string
    sql: ${TABLE}.roles ;;
  }

  dimension: screenshots_count {
    type: string
    sql: ${TABLE}.screenshots_count ;;
  }

  dimension: segment_library {
    type: string
    sql: ${TABLE}.segment_library ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  dimension: skill_name {
    type: string
    sql: ${TABLE}.skill_name ;;
  }

  dimension: skills {
    type: string
    sql: ${TABLE}.skills ;;
  }

  dimension: sm_au_ {
    type: string
    sql: ${TABLE}.sm_au_ ;;
  }

  dimension: tracks {
    type: string
    sql: ${TABLE}.tracks ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: user_handle {
    type: string
    sql: ${TABLE}.user_handle ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_last_login_date {
    type: string
    sql: ${TABLE}.user_last_login_date ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}.user_type ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: verified {
    type: string
    sql: ${TABLE}.verified ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      member_profile_all_company_name,
      username,
      skill_name,
      name,
      group_name,
      lastname,
      firstname,
      users.member_profile_all_company_name,
      users.username,
      users.skill_name,
      users.name,
      users.group_name,
      users.lastname,
      users.firstname,
      users.id,
      users.count
    ]
  }
}
