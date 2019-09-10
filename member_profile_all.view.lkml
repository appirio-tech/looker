view: member_profile_all {
  derived_table:{
    sql: SELECT basic.birth_date,
          basic.country,
          --basic.created_at,
          --basic.created_by,
          basic.current_location,
          basic.gender,
          basic.primary_interest_in_topcoder,
          basic.short_bio,
          basic.t_shirt_size,
          --basic.updated_at,
          --basic.updated_by,
          --basic.user_id,
          customer.business_email,
          customer.business_phone,
          customer.company_name,
          customer.company_size,
          --customer.created_at,
          --customer.created_by,
          customer.first_last_name,
          customer.title,
          --customer.updated_at,
          --customer.updated_by,
          --customer.user_id,
          --personalization.created_at,
          --personalization.created_by,
          --personalization.updated_at,
          --personalization.updated_by,
          personalization.user_consent,
          --personalization.user_id,
          member.created_at,
          member.created_by,
          member.updated_at,
          member.updated_by,
          member.address_type,
          member.description,
          member.email_verify_token,
          member.email_verify_token_date,
          member.first_name,
          member.last_name,
          member.new_email,
          member.other_lang_name,
          member.photo_url,
          member.quote,
          member.state_code,
          member.zip,
          member.street_address_1,
          member.street_address_2,
          member.city,
          member.email,
          member.handle,
          member.handle_lower,
          member.competition_country_code,
          member.home_country_code,
          member.home_country_name,
          member.competition_country_name,
          member.status,
          member.tracks,
          member.user_id
          from tcs_dw.member_profile member
          LEFT OUTER JOIN tcs_dw.member_basic_info basic ON member.user_id = basic.user_id
          LEFT OUTER JOIN tcs_dw.member_customer_info customer ON member.user_id = customer.user_id
          LEFT OUTER JOIN tcs_dw.member_personalization personalization ON member.user_id = personalization.user_id

          ;;
          persist_for: "8 hours" #Persist for 8 hours as data gets loaded in every 8 hours
          distribution_style: even #Required for saving the look
          indexes: ["user_id"]

    }

    dimension_group: birth {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        quarter,
        year,
        fiscal_month_num,
        fiscal_quarter,
        fiscal_quarter_of_year,
        fiscal_year
      ]
      sql: ${TABLE}.birth_date ;;
    }

    dimension: age_bucket {
      type: tier
      tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
      style: relational # the default value, could be excluded
      sql: datediff(year, ${TABLE}.birth_date, current_date) ;;
    }

    dimension: country {
      type: string
      label: "Mailing Country"
      map_layer_name: countries
      sql: ${TABLE}.country ;;
      group_label: "Address"
    }

#added on 22nd May 2019

  dimension: home_country {
    type: string
    description: "Country name for the country member belong to"
    sql: ${TABLE}.home_country_name ;;
    group_label: "Address"
  }

  dimension: competition_country {
    type: string
    description: "Country name for the country member is competing in"
    sql: ${TABLE}.competition_country_name ;;
    group_label: "Address"
  }

#added on 28th June 2019
  dimension: reporting_country {
    type: string
    description: "There are 3 countries in the system. Shows reporting country based on logic ( Competition Country > Home Country > Mailing Country)"
    map_layer_name: countries
    group_label: "Address"
    sql: CASE
        WHEN ${TABLE}.competition_country_name is not null
          THEN  ${TABLE}.competition_country_name
        WHEN ${TABLE}.home_country_name is not null
          THEN ${TABLE}.home_country_name
       ELSE ${TABLE}.country
   END;;
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
        year,
        fiscal_month_num,
        fiscal_quarter,
        fiscal_quarter_of_year,
        fiscal_year
      ]
      sql: ${TABLE}.created_at ;;
    }

    dimension: created_by {
      type: number
      sql: ${TABLE}.created_by ;;
    }

    dimension: current_location {
      type: string
      sql: ${TABLE}.current_location ;;
    }

    dimension: gender {
      type: string
      sql: ${TABLE}.gender ;;
    }

    dimension: primary_interest_in_topcoder {
      type: string
      description: "member's primary interest areas like Web Development, React Architect etc."
      sql: ${TABLE}.primary_interest_in_topcoder ;;
    }

    dimension: short_bio {
      type: string
      description: "Short summary about the member"
      sql: ${TABLE}.short_bio ;;
    }

    dimension: t_shirt_size {
      type: string
      sql: ${TABLE}.t_shirt_size ;;
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
        year,
        fiscal_month_num,
        fiscal_quarter,
        fiscal_quarter_of_year,
        fiscal_year
      ]
      sql: ${TABLE}.updated_at ;;
    }

    dimension: updated_by {
      type: number
      sql: ${TABLE}.updated_by ;;
    }

    dimension: user_id {
      type: number
      primary_key: yes
      sql: ${TABLE}.user_id ;;
      tags: ["user_id"]
    }

    dimension: business_email {
      type: string
      sql: ${TABLE}.business_email ;;
      tags: ["email"]
    }

    dimension: business_phone {
      type: string
      sql: ${TABLE}.business_phone ;;
    }

    dimension: company_name {
      type: string
      sql: ${TABLE}.company_name ;;
    }

    dimension: company_size {
      type: string
      description: "size of the company a particular member owns like 1-50 or 500+ etc."
      sql: ${TABLE}.company_size ;;
    }

    dimension: first_last_name {
      label: "Full name"
      type: string
      sql: ${TABLE}.first_last_name ;;
    }

    dimension: title {
      type: string
      description: "primary role of a member like Android Developer, Researcher"
      sql: ${TABLE}.title ;;
    }

    dimension: user_consent {
      type: yesno
      description: "Member consent to use his personal information to make his experience at Topcoder great"
      sql: ${TABLE}.user_consent ;;
    }

    dimension: city {
      type: string
      label: "Mailing City"
      sql: ${TABLE}.city ;;
      group_label: "Address"
    }

    dimension: competition_country_code {
      type: string
      description: "Country code for the country the member is competing in"
      sql: ${TABLE}.competition_country_code ;;
      group_label: "Address"
    }

    dimension: email {
      type: string
      sql: ${TABLE}.email ;;
      tags: ["email"]
    }

    dimension: handle {
      type: string
      sql: ${TABLE}.handle ;;
    }

    dimension: handle_lower {
      type: string
      sql: ${TABLE}.handle_lower ;;
    }

    dimension: home_country_code {
      type: string
      description: "Country code for the country member belong to"
      sql: ${TABLE}.home_country_code ;;
      group_label: "Address"
    }

    dimension: status {
      type: string
      description: "Status of the member account - Active, Inactive, Unverified etc."
      sql: ${TABLE}.status ;;
    }

    dimension: tracks {
      type: string
      description: "Design, develop, data science or any of them in combination"
      sql: ${TABLE}.tracks ;;
    }

    dimension: address_type {
      type: string
      description: "Address given is an office address or home address"
      sql: ${TABLE}.address_type ;;
    }

    dimension: description {
      type: string
      description: "Brief description about the member"
      sql: ${TABLE}.description ;;
    }

    dimension: email_verify_token {
      type: string
      sql: ${TABLE}.email_verify_token ;;
    }

    dimension_group: email_verify_token {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        quarter,
        year,
        fiscal_month_num,
        fiscal_quarter,
        fiscal_quarter_of_year,
        fiscal_year
      ]
      sql: ${TABLE}.email_verify_token_date ;;
    }

    dimension: first_name {
      type: string
      sql: ${TABLE}.first_name ;;
    }

    dimension: last_name {
      type: string
      sql: ${TABLE}.last_name ;;
    }

    dimension: new_email {
      type: string
      sql: ${TABLE}.new_email ;;
    }

    dimension: other_lang_name {
      type: string
      sql: ${TABLE}.other_lang_name ;;
    }

    dimension: photo_url {
      type: string
      sql: ${TABLE}.photo_url ;;
    }

    dimension: quote {
      type: string
      description: "One line that represents member"
      sql: ${TABLE}.quote ;;
    }

    dimension: state_code {
      type: string
      label: "Mailing State Code"
      sql: ${TABLE}.state_code ;;
      group_label: "Address"
    }

    dimension: street_address_1 {
      type: string
      label: "Mailing Street Address 1"
      sql: ${TABLE}.street_address_1 ;;
      group_label: "Address"
    }

    dimension: street_address_2 {
      type: string
      label: "Mailing Street Address 2"
      sql: ${TABLE}.street_address_2 ;;
      group_label: "Address"
    }

    dimension: zip {
      type: zipcode
      sql: ${TABLE}.zip ;;
      group_label: "Address"
    }

    measure: count {
      type: count
    }

  }
