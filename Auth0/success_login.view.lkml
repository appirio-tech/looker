# The name of this view in Looker is "Success Login"
view: success_login {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: segment_auth0.success_login ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Avatar URL" in Explore.

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

  dimension: collaborators {
    type: number
    sql: ${TABLE}.collaborators ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_collaborators {
    type: sum
    sql: ${collaborators} ;;
  }

  measure: average_collaborators {
    type: average
    sql: ${collaborators} ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: context_library_name {
    type: string
    sql: ${TABLE}.context_library_name ;;
  }

  dimension: context_library_version {
    type: string
    sql: ${TABLE}.context_library_version ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: disk_usage {
    type: number
    sql: ${TABLE}.disk_usage ;;
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

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: event_text {
    type: string
    sql: ${TABLE}.event_text ;;
  }

  dimension: events_url {
    type: string
    sql: ${TABLE}.events_url ;;
  }

  dimension: family_name {
    type: string
    sql: ${TABLE}.family_name ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: followers {
    type: number
    sql: ${TABLE}.followers ;;
  }

  dimension: followers_url {
    type: string
    sql: ${TABLE}.followers_url ;;
  }

  dimension: following {
    type: number
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

  dimension: last_ip {
    type: string
    sql: ${TABLE}.last_ip ;;
  }

  dimension_group: last_login {
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
    sql: ${TABLE}.last_login ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
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
    type: number
    sql: ${TABLE}.logins_count ;;
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

  dimension_group: original_timestamp {
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
    sql: ${TABLE}.original_timestamp ;;
  }

  dimension: owned_private_repos {
    type: number
    sql: ${TABLE}.owned_private_repos ;;
  }

  dimension: picture {
    type: string
    sql: ${TABLE}.picture ;;
  }

  dimension: plan_collaborators {
    type: number
    sql: ${TABLE}.plan_collaborators ;;
  }

  dimension: plan_name {
    type: string
    sql: ${TABLE}.plan_name ;;
  }

  dimension: plan_private_repos {
    type: number
    sql: ${TABLE}.plan_private_repos ;;
  }

  dimension: plan_space {
    type: number
    sql: ${TABLE}.plan_space ;;
  }

  dimension: private_gists {
    type: number
    sql: ${TABLE}.private_gists ;;
  }

  dimension: public_gists {
    type: number
    sql: ${TABLE}.public_gists ;;
  }

  dimension: public_repos {
    type: number
    sql: ${TABLE}.public_repos ;;
  }

  dimension_group: received {
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
    sql: ${TABLE}.received_at ;;
  }

  dimension: received_events_url {
    type: string
    sql: ${TABLE}.received_events_url ;;
  }

  dimension: reg_source {
    type: string
    sql: ${TABLE}.reg_source ;;
  }

  dimension: repos_url {
    type: string
    sql: ${TABLE}.repos_url ;;
  }

  dimension: return_url {
    type: string
    sql: ${TABLE}.return_url ;;
  }

  dimension: roles {
    type: string
    sql: ${TABLE}.roles ;;
  }

  dimension_group: sent {
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
    sql: ${TABLE}.sent_at ;;
  }

  dimension: site_admin {
    type: string
    sql: ${TABLE}.site_admin ;;
  }

  dimension: starred_url {
    type: string
    sql: ${TABLE}.starred_url ;;
  }

  dimension: subscriptions_url {
    type: string
    sql: ${TABLE}.subscriptions_url ;;
  }

  dimension_group: timestamp {
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
    sql: ${TABLE}.timestamp ;;
  }

  dimension: total_private_repos {
    type: number
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

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension_group: uuid_ts {
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
    sql: ${TABLE}.uuid_ts ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      given_name,
      context_library_name,
      name,
      family_name,
      nickname,
      plan_name,
      first_name,
      twitter_username,
      last_name
    ]
  }
}
