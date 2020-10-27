view: candidate {
  sql_table_name: tcs_dw.recruit_crm_candidate ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension_group: available_from {
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
    sql: ${TABLE}.available_from ;;
  }

  dimension: avatar {
    type: string
    sql: ${TABLE}.avatar ;;
  }

  dimension: c2c_only {
    type: yesno
    sql: ${TABLE}.c2c_only ;;
  }

  dimension: candidate_don {
    type: string
    sql: ${TABLE}.candidate_don ;;
  }

  dimension: cbr {
    type: string
    sql: ${TABLE}.cbr ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: contact_number {
    type: string
    sql: ${TABLE}.contact_number ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

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
    sql: ${TABLE}.created_on ;;
  }

  dimension: currency_id {
    type: string
    sql: ${TABLE}.currency_id ;;
  }

  dimension: current_organization {
    type: string
    sql: ${TABLE}.current_organization ;;
  }

  dimension: current_salary {
    type: number
    sql: ${TABLE}.current_salary ;;
  }

  dimension: current_status {
    type: string
    sql: ${TABLE}.current_status ;;
  }

  dimension: current_taas_pay {
    type: string
    sql: ${TABLE}.current_taas_pay ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: facebook_profile_url {
    type: string
    sql: ${TABLE}.facebook_profile_url ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: github_profile_url {
    type: string
    sql: ${TABLE}.github_profile_url ;;
  }

  dimension: good_fit_explanation {
    type: string
    sql: ${TABLE}.good_fit_explanation ;;
  }

  dimension: handle {
    type: string
    sql: ${TABLE}.handle ;;
  }

  dimension: hear_about_gig {
    type: string
    sql: ${TABLE}.hear_about_gig ;;
  }

  dimension: job_application_notes {
    type: string
    sql: ${TABLE}.job_application_notes ;;
  }

  dimension: language_skills {
    type: string
    sql: ${TABLE}.language_skills ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: linkedin_profile_url {
    type: string
    sql: ${TABLE}.linkedin_profile_url ;;
  }

  dimension: locality {
    type: string
    sql: ${TABLE}.locality ;;
  }

  dimension: notice_period {
    type: number
    sql: ${TABLE}.notice_period ;;
  }

  dimension: owner {
    type: string
    sql: ${TABLE}.owner ;;
  }

  dimension: pool_status {
    type: string
    sql: ${TABLE}.pool_status ;;
  }

  dimension: position {
    type: string
    sql: ${TABLE}.position ;;
  }

  dimension: profile_update_link_status {
    type: string
    sql: ${TABLE}.profile_update_link_status ;;
  }

  dimension_group: profile_update_requested {
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
    sql: ${TABLE}.profile_update_requested_on ;;
  }

  dimension_group: profile_updated {
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
    sql: ${TABLE}.profile_updated_on ;;
  }

  dimension: profile_url {
    type: string
    sql: ${TABLE}.profile_url ;;
  }

  dimension: qualification_id {
    type: string
    sql: ${TABLE}.qualification_id ;;
  }

  dimension: relevant_experience {
    type: number
    sql: ${TABLE}.relevant_experience ;;
  }

  dimension: requires_eu_visa {
    type: yesno
    sql: ${TABLE}.requires_eu_visa ;;
  }

  dimension: requires_us_visa {
    type: yesno
    sql: ${TABLE}.requires_us_visa ;;
  }

  dimension: resource_url {
    type: string
    sql: ${TABLE}.resource_url ;;
  }

  dimension: resume_file_link {
    type: string
    sql: ${TABLE}.resume_file_link ;;
  }

  dimension: resume_filename {
    type: string
    sql: ${TABLE}.resume_filename ;;
  }

  dimension: salary_expectation {
    type: number
    sql: ${TABLE}.salary_expectation ;;
  }

  dimension: salary_type {
    type: string
    sql: ${TABLE}.salary_type ;;
  }

  dimension: skill {
    type: string
    sql: ${TABLE}.skill ;;
  }

  dimension: slug {
    type: string
    sql: ${TABLE}.slug ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: specialization {
    type: string
    sql: ${TABLE}.specialization ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: tech_skills {
    type: string
    sql: ${TABLE}.tech_skills ;;
  }

  dimension: twitter_profile_url {
    type: string
    sql: ${TABLE}.twitter_profile_url ;;
  }

  dimension: updated_by {
    type: string
    sql: ${TABLE}.updated_by ;;
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
    sql: ${TABLE}.updated_on ;;
  }

  dimension: w2_only {
    type: yesno
    sql: ${TABLE}.w2_only ;;
  }

  dimension: willing_to_relocate {
    type: number
    sql: ${TABLE}.willing_to_relocate ;;
  }

  dimension: work_ex_year {
    type: number
    sql: ${TABLE}.work_ex_year ;;
  }

  measure: count {
    type: count
    drill_fields: [id, resume_filename, last_name, first_name]
  }
}
