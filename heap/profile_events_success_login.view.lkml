view: heap_profile_events_success_login {
  sql_table_name: heapdata.profile_events_success_login ;;

  dimension: _country {
    type: string
    sql: ${TABLE}._country ;;
  }

  dimension: _user_id {
    type: string
    sql: ${TABLE}._user_id ;;
  }

  dimension: app_name {
    type: string
    sql: ${TABLE}.app_name ;;
  }

  dimension: app_version {
    type: string
    sql: ${TABLE}.app_version ;;
  }

  dimension: avatar_url {
    type: string
    sql: ${TABLE}.avatar_url ;;
  }

  dimension: bio {
    type: string
    sql: ${TABLE}.bio ;;
  }

  dimension: blocked {
    type: string
    sql: ${TABLE}.blocked ;;
  }

  dimension: blog {
    type: string
    sql: ${TABLE}.blog ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: browser_type {
    type: string
    sql: ${TABLE}.browser_type ;;
  }

  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: collaborators {
    type: string
    sql: ${TABLE}.collaborators ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: continent {
    type: string
    sql: ${TABLE}.continent ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: disk_usage {
    type: string
    sql: ${TABLE}.disk_usage ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_verified {
    type: string
    sql: ${TABLE}.email_verified ;;
  }

  dimension: emails {
    type: string
    sql: ${TABLE}.emails ;;
  }

  dimension: event_id {
    type: number
    sql: ${TABLE}.event_id ;;
  }

  dimension: events_url {
    type: string
    sql: ${TABLE}.events_url ;;
  }

  dimension: family_name {
    type: string
    sql: ${TABLE}.family_name ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: followers {
    type: string
    sql: ${TABLE}.followers ;;
  }

  dimension: followers_url {
    type: string
    sql: ${TABLE}.followers_url ;;
  }

  dimension: following {
    type: string
    sql: ${TABLE}.following ;;
  }

  dimension: following_url {
    type: string
    sql: ${TABLE}.following_url ;;
  }

  dimension: gists_url {
    type: string
    sql: ${TABLE}.gists_url ;;
  }

  dimension: given_name {
    type: string
    sql: ${TABLE}.given_name ;;
  }

  dimension: google_referrer {
    type: string
    sql: ${TABLE}.google_referrer ;;
  }

  dimension: hash {
    type: string
    sql: ${TABLE}.hash ;;
  }

  dimension: heap_app_name {
    type: string
    sql: ${TABLE}.heap_app_name ;;
  }

  dimension: heap_app_version {
    type: string
    sql: ${TABLE}.heap_app_version ;;
  }

  dimension: heap_device {
    type: string
    sql: ${TABLE}.heap_device ;;
  }

  dimension: heap_device_id {
    type: string
    sql: ${TABLE}.heap_device_id ;;
  }

  dimension: heap_previous_page {
    type: string
    sql: ${TABLE}.heap_previous_page ;;
  }

  dimension: hireable {
    type: string
    sql: ${TABLE}.hireable ;;
  }

  dimension: html_url {
    type: string
    sql: ${TABLE}.html_url ;;
  }

  dimension: identities {
    type: string
    sql: ${TABLE}.identities ;;
  }

  dimension: ip {
    type: string
    sql: ${TABLE}.ip ;;
  }

  dimension: landing_page {
    type: string
    sql: ${TABLE}.landing_page ;;
  }

  dimension: landing_page_hash {
    type: string
    sql: ${TABLE}.landing_page_hash ;;
  }

  dimension: landing_page_query {
    type: string
    sql: ${TABLE}.landing_page_query ;;
  }

  dimension: last_ip {
    type: string
    sql: ${TABLE}.last_ip ;;
  }

  dimension: last_login {
    type: string
    sql: ${TABLE}.last_login ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: library {
    type: string
    sql: ${TABLE}.library ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: login {
    type: string
    sql: ${TABLE}.login ;;
  }

  dimension: logins_count {
    type: string
    sql: ${TABLE}.logins_count ;;
  }

  dimension: marketing_channel {
    type: string
    sql: ${TABLE}.marketing_channel ;;
  }

  dimension: marketing_channel_copy {
    type: string
    sql: ${TABLE}.marketing_channel_copy ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: nickname {
    type: string
    sql: ${TABLE}.nickname ;;
  }

  dimension: node_id {
    type: string
    sql: ${TABLE}.node_id ;;
  }

  dimension: organizations_url {
    type: string
    sql: ${TABLE}.organizations_url ;;
  }

  dimension: owned_private_repos {
    type: string
    sql: ${TABLE}.owned_private_repos ;;
  }

  dimension: page_type {
    type: string
    sql: ${TABLE}.page_type ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}.path ;;
  }

  dimension: picture {
    type: string
    sql: ${TABLE}.picture ;;
  }

  dimension: plan_collaborators {
    type: string
    sql: ${TABLE}.plan_collaborators ;;
  }

  dimension: plan_name {
    type: string
    sql: ${TABLE}.plan_name ;;
  }

  dimension: plan_private_repos {
    type: string
    sql: ${TABLE}.plan_private_repos ;;
  }

  dimension: plan_space {
    type: string
    sql: ${TABLE}.plan_space ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: private_gists {
    type: string
    sql: ${TABLE}.private_gists ;;
  }

  dimension: public_gists {
    type: string
    sql: ${TABLE}.public_gists ;;
  }

  dimension: public_repos {
    type: string
    sql: ${TABLE}.public_repos ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: quora_referrer {
    type: string
    sql: ${TABLE}.quora_referrer ;;
  }

  dimension: received_events_url {
    type: string
    sql: ${TABLE}.received_events_url ;;
  }

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: regsource {
    type: string
    sql: ${TABLE}.regsource ;;
  }

  dimension: repos_url {
    type: string
    sql: ${TABLE}.repos_url ;;
  }

  dimension: returnurl {
    type: string
    sql: ${TABLE}.returnurl ;;
  }

  dimension: roles {
    type: string
    sql: ${TABLE}.roles ;;
  }

  dimension: screen_a11y_id {
    type: string
    sql: ${TABLE}.screen_a11y_id ;;
  }

  dimension: screen_a11y_label {
    type: string
    sql: ${TABLE}.screen_a11y_label ;;
  }

  dimension: search_engine {
    type: string
    sql: ${TABLE}.search_engine ;;
  }

  dimension: search_keyword {
    type: string
    sql: ${TABLE}.search_keyword ;;
  }

  dimension: segment_library {
    type: string
    sql: ${TABLE}.segment_library ;;
  }

  dimension: session_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.session_id ;;
  }

  dimension_group: session {
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
    sql: ${TABLE}.session_time ;;
  }

  dimension: site_admin {
    type: string
    sql: ${TABLE}.site_admin ;;
  }

  dimension: social_network {
    type: string
    sql: ${TABLE}.social_network ;;
  }

  dimension: starred_url {
    type: string
    sql: ${TABLE}.starred_url ;;
  }

  dimension: subscriptions_url {
    type: string
    sql: ${TABLE}.subscriptions_url ;;
  }

  dimension_group: time {
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
    sql: ${TABLE}.time ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: total_private_repos {
    type: string
    sql: ${TABLE}.total_private_repos ;;
  }

  dimension: twitter_username {
    type: string
    sql: ${TABLE}.twitter_username ;;
  }

  dimension: two_factor_authentication {
    type: string
    sql: ${TABLE}.two_factor_authentication ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: updated_at {
    type: string
    sql: ${TABLE}.updated_at ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: utm_content {
    type: string
    sql: ${TABLE}.utm_content ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_term {
    type: string
    sql: ${TABLE}.utm_term ;;
  }

  dimension: utmsource {
    type: string
    sql: ${TABLE}.utmsource ;;
  }

  dimension: view_controller {
    type: string
    sql: ${TABLE}.view_controller ;;
  }

  dimension: youtube_referrer {
    type: string
    sql: ${TABLE}.youtube_referrer ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_distinct_users {
    type: count_distinct
    sql: ${nickname} ;;
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      twitter_username,
      heap_app_name,
      plan_name,
      given_name,
      lastname,
      family_name,
      name,
      nickname,
      firstname,
      app_name,
      sessions.session_id,
      sessions.heap_app_name,
      sessions.app_name
    ]
  }

  set: engagement_drill_fields {
    fields: [ time_week, count]
  }
}
