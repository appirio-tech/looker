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

#added on 20th Dec 2019

  dimension: geographical_location {
    label: "Geo Location"
    description: "Geographical region of the member's country"
    group_label: "Address"
    case: {
      when: {
        sql:  ${reporting_country} = 'China' or
              ${reporting_country} = 'Taiwan' or
              ${reporting_country} = 'Hong Kong' or
              ${reporting_country} = 'Macau' or
              ${reporting_country} = 'Japan' or
              ${reporting_country} = 'Mongolia' or
              ${reporting_country} = 'North Korea' or
              ${reporting_country} = 'South Korea';;
        label: "Eastern Asia"
      }
        when: {
        sql:  ${reporting_country} ='Brunei Darussalam' or
              ${reporting_country} ='Cambodia' or
              ${reporting_country} ='Indonesia' or
              ${reporting_country} ='Laos' or
              ${reporting_country} ='Malaysia' or
              ${reporting_country} ='Myanmar' or
              ${reporting_country} ='Philippines' or
              ${reporting_country} ='Singapore' or
              ${reporting_country} ='Thailand' or
              ${reporting_country} ='Timor-Leste' or
              ${reporting_country} ='East Timor' or
              ${reporting_country} ='Vietnam' or
              ${reporting_country} ='Viet Nam' or
              ${reporting_country} ='Australia' or
              ${reporting_country} ='Melanesia' or
              ${reporting_country} ='Micronesia' or
              ${reporting_country} ='Micronesia, Federated States of' or
              ${reporting_country} ='Polynesia' or
              ${reporting_country} ='French Polynesia' or
              ${reporting_country} ='New Zealand' ;;
      label: "South-Eastern Asia and Ocenia"
    }
      when: {
        sql:  ${reporting_country} ='Afghanistan' or
              ${reporting_country} ='Bangladesh' or
              ${reporting_country} ='Bhutan' or
              ${reporting_country} ='India' or
              ${reporting_country} ='Iran' or
              ${reporting_country} ='Maldives' or
              ${reporting_country} ='Nepal' or
              ${reporting_country} ='Pakistan' or
              ${reporting_country} ='Sri Lanka';;
      label: "Southern Asia"
    }
      when: {
        sql: ${reporting_country} ='Armenia' or
                 ${reporting_country} ='Azerbaijan' or
                 ${reporting_country} ='Bahrain' or
                 ${reporting_country} ='Cyprus' or
                 ${reporting_country} ='Georgia' or
                 ${reporting_country} ='Iraq' or
                 ${reporting_country} ='Israel' or
                 ${reporting_country} ='Jordan' or
                 ${reporting_country} ='Kuwait' or
                 ${reporting_country} ='Lebanon' or
                 ${reporting_country} ='Oman' or
                 ${reporting_country} ='Qatar' or
                 ${reporting_country} ='Saudi Arabia' or
                 ${reporting_country} ='State of Palestine' or
                 ${reporting_country} ='Palestine, State of' or
                 ${reporting_country} ='Syria' or
                 ${reporting_country} ='Turkey' or
                 ${reporting_country} ='United Arab Emirates' or
                 ${reporting_country} ='Yemen' or
                 ${reporting_country} ='Burundi' or
                 ${reporting_country} ='Comoros' or
                 ${reporting_country} ='Djibouti' or
                 ${reporting_country} ='Eritrea' or
                 ${reporting_country} ='Ethiopia' or
                 ${reporting_country} ='Kenya' or
                 ${reporting_country} ='Madagascar' or
                 ${reporting_country} ='Malawi' or
                 ${reporting_country} ='Mauritius' or
                 ${reporting_country} ='Mayotte' or
                 ${reporting_country} ='Mozambique' or
                 ${reporting_country} ='Réunion' or
                 ${reporting_country} ='Reunion' or
                 ${reporting_country} ='Rwanda' or
                 ${reporting_country} ='Seychelles' or
                 ${reporting_country} ='Somalia' or
                 ${reporting_country} ='South Sudan' or
                 ${reporting_country} ='Tanzania' or
                 ${reporting_country} ='Tanzania, United Republic of' or
                 ${reporting_country} ='Uganda' or
                 ${reporting_country} ='Zambia' or
                 ${reporting_country} ='Zimbabwe' or
                 ${reporting_country} ='Angola' or
                 ${reporting_country} ='Cameroon' or
                 ${reporting_country} ='Central African Republic' or
                 ${reporting_country} ='Chad' or
                 ${reporting_country} ='Democratic Republic of the Congo' or
                 ${reporting_country} ='Republic of the Congo' or
                 ${reporting_country} ='Congo' or
                 ${reporting_country} ='Equatorial Guinea' or
                 ${reporting_country} ='Gabon' or
                 ${reporting_country} ='São Tomé and Príncipe' or
                 ${reporting_country} ='Sao Tome and Principe' or
                 ${reporting_country} ='Algeria' or
                 ${reporting_country} ='Egypt' or
                 ${reporting_country} ='Libya' or
                 ${reporting_country} ='Morocco' or
                 ${reporting_country} ='Sudan' or
                 ${reporting_country} ='Tunisia' or
                 ${reporting_country} ='Western Sahara' or
                 ${reporting_country} ='Botswana' or
                 ${reporting_country} ='Eswatini (Swaziland)' or
                 ${reporting_country} ='Swaziland' or
                 ${reporting_country} ='Lesotho' or
                 ${reporting_country} ='Namibia' or
                 ${reporting_country} ='South Africa' or
                 ${reporting_country} ='Benin' or
                 ${reporting_country} ='Burkina Faso' or
                 ${reporting_country} ='Cabo Verde' or
                 ${reporting_country} ='Cape Verde' or
                 ${reporting_country} ='Gambia' or
                 ${reporting_country} ='Ghana' or
                 ${reporting_country} ='Guinea' or
                 ${reporting_country} ='Guinea-Bissau' or
                 ${reporting_country} ='Liberia' or
                 ${reporting_country} ='Mali' or
                 ${reporting_country} ='Mauritania' or
                 ${reporting_country} ='Niger' or
                 ${reporting_country} ='Nigeria' or
                 ${reporting_country} ='Saint Helena, Ascension and Tristan da Cunha' or
                 ${reporting_country} ='Senegal' or
                 ${reporting_country} ='Sierra Leone' or
                 ${reporting_country} ='Togo' ;;
        label: "Africa and Western Asia"
      }
      when: {
        sql:  ${reporting_country} ='Belize' or
              ${reporting_country} ='Costa Rica' or
              ${reporting_country} ='El Salvador' or
              ${reporting_country} ='Guatemala' or
              ${reporting_country} ='Honduras' or
              ${reporting_country} ='Mexico' or
              ${reporting_country} ='Nicaragua' or
              ${reporting_country} ='Panama' or
              ${reporting_country} ='Argentina' or
              ${reporting_country} ='Bolivia' or
              ${reporting_country} ='Brazil' or
              ${reporting_country} ='Chile' or
              ${reporting_country} ='Colombia' or
              ${reporting_country} ='Ecuador' or
              ${reporting_country} ='Falkland Islands' or
              ${reporting_country} ='Falkland Islands (Malvinas)' or
              ${reporting_country} ='French Guiana' or
              ${reporting_country} ='Guyana' or
              ${reporting_country} ='Paraguay' or
              ${reporting_country} ='Peru' or
              ${reporting_country} ='South Georgia and the South Sandwich Islands' or
              ${reporting_country} ='South Georgia and The S.Sandwich Is.' or
              ${reporting_country} ='Suriname' or
              ${reporting_country} ='Uruguay' or
              ${reporting_country} ='Venezuela' or
              ${reporting_country} ='Anguilla' or
              ${reporting_country} ='Antigua and Barbuda' or
              ${reporting_country} ='Aruba' or
              ${reporting_country} ='Bahamas' or
              ${reporting_country} ='Barbados' or
              ${reporting_country} ='Bonaire, Sint Eustatius and Saba' or
              ${reporting_country} ='British Virgin Islands' or
              ${reporting_country} ='Virgin Islands (British)'or
              ${reporting_country} ='Cayman Islands' or
              ${reporting_country} ='Cuba' or
              ${reporting_country} ='Curaçao' or
              ${reporting_country} ='Curacao' or
              ${reporting_country} ='Dominica' or
              ${reporting_country} ='Dominican Republic' or
              ${reporting_country} ='Grenada' or
              ${reporting_country} ='Guadeloupe' or
              ${reporting_country} ='Haiti' or
              ${reporting_country} ='Jamaica' or
              ${reporting_country} ='Martinique' or
              ${reporting_country} ='Montserrat' or
              ${reporting_country} ='Puerto Rico' or
              ${reporting_country} ='Saint Barthélemy' or
              ${reporting_country} ='Saint Barthelemy' or
              ${reporting_country} ='Saint Kitts and Nevis' or
              ${reporting_country} ='St. Kitts and Nevis' or
              ${reporting_country} ='Saint Lucia' or
              ${reporting_country} ='St. Lucia' or
              ${reporting_country} ='Saint Martin (French part)' or
              ${reporting_country} ='Saint Vincent and the Grenadines' or
              ${reporting_country} ='St. Vincent and Grenadines' or
              ${reporting_country} ='Sint Maarten (Dutch part)' or
              ${reporting_country} ='Trinidad and Tobago' or
              ${reporting_country} ='Turks and Caicos Islands' or
              ${reporting_country} ='United States Virgin Islands' or
              ${reporting_country} ='Virgin Islands (U.S.)';;
        label: "Caribbean and South-Central America"
      }

      when: {
          sql:  ${reporting_country} ='Bermuda' or
                ${reporting_country} ='Canada' or
                ${reporting_country} ='Greenland' or
                ${reporting_country} ='Saint Pierre and Miquelon' or
                ${reporting_country} ='St. Pierre and Miquelon' or
                ${reporting_country} ='United States of America' or
                ${reporting_country} ='United States';;
          label: "Northern America"
      }
      when: {
          sql:  ${reporting_country} ='Belarus' or
                ${reporting_country} ='Bulgaria' or
                ${reporting_country} ='Czechia (Czech Republic)' or
                ${reporting_country} ='Czech Republic' or
                ${reporting_country} ='Hungary' or
                ${reporting_country} ='Moldova' or
                ${reporting_country} ='Moldova, Republic of' or
                ${reporting_country} ='Poland' or
                ${reporting_country} ='Romania' or
                ${reporting_country} ='Russia' or
                ${reporting_country} ='Slovakia' or
                ${reporting_country} ='Ukraine' or
                ${reporting_country} ='Aland Islands' or
                ${reporting_country} ='Denmark' or
                ${reporting_country} ='Estonia' or
                ${reporting_country} ='Faroe Islands' or
                ${reporting_country} ='Finland' or
                ${reporting_country} ='Guernsey' or
                ${reporting_country} ='Iceland' or
                ${reporting_country} ='Ireland' or
                ${reporting_country} ='Isle of Man' or
                ${reporting_country} ='Jersey' or
                ${reporting_country} ='Latvia' or
                ${reporting_country} ='Lithuania' or
                ${reporting_country} ='Norway' or
                ${reporting_country} ='Sark' or
                ${reporting_country} ='Svalbard and Jan Mayen' or
                ${reporting_country} ='Sweden' or
                ${reporting_country} ='United Kingdom' or
                ${reporting_country} ='Albania' or
                ${reporting_country} ='Andorra' or
                ${reporting_country} ='Bosnia & Herzegovina' or
                ${reporting_country} ='Croatia' or
                ${reporting_country} ='Gibraltar' or
                ${reporting_country} ='Greece' or
                ${reporting_country} ='Italy' or
                ${reporting_country} ='Malta' or
                ${reporting_country} ='Montenegro' or
                ${reporting_country} ='North Macedonia' or
                ${reporting_country} ='Macedonia' or
                ${reporting_country} ='Portugal' or
                ${reporting_country} ='San Marino' or
                ${reporting_country} ='Serbia' or
                ${reporting_country} ='Slovenia' or
                ${reporting_country} ='Spain' or
                ${reporting_country} ='Vatican City' or
                ${reporting_country} ='Vatican City State (Holy See)' or
                ${reporting_country} ='Austria' or
                ${reporting_country} ='Belgium' or
                ${reporting_country} ='France' or
                ${reporting_country} ='Germany' or
                ${reporting_country} ='Liechtenstein' or
                ${reporting_country} ='Luxembourg' or
                ${reporting_country} ='Monaco' or
                ${reporting_country} ='Netherlands' or
                ${reporting_country} ='Switzerland' or
                ${reporting_country} ='Kazakhstan' or
                ${reporting_country} ='Kyrgyzstan' or
                ${reporting_country} ='Tajikistan' or
                ${reporting_country} ='Turkmenistan' or
                ${reporting_country} ='Uzbekistan';;
          label: "Europe and Central Asia"
      }
      else: "other"
    }
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

    dimension: profile_link {
      sql: ${TABLE}.handle ;;
      link: {
        label: "Profile"
        url: "https://www.topcoder.com/members/{{ value }}"
        icon_url: ""
      }
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

    dimension: Develop {
      type: number
      hidden: yes
      description: "1 if Member has opted for develop track , 0 if not"
      sql: CASE
                WHEN (${tracks} LIKE '%DEVELOP%') THEN 1
                ELSE 0
           END;;
    }

  dimension: Design {
    type: number
    hidden: yes
    description: "1 if Member has opted for design track , 0 if not"
    sql: CASE
                WHEN (${tracks} LIKE '%DESIGN%') THEN 1
                ELSE 0
           END;;
  }

  dimension: Data_Science{
    type: number
    hidden: yes
    description: "1 if Member has opted for data science track , 0 if not"
    sql: CASE
                WHEN (${tracks} LIKE '%DATA_SCIENCE%') THEN 1
                ELSE 0
           END;;
  }

  dimension: No_track{
    type: number
    hidden: yes
    description: "1 if Member has NOT opted for any track , 0 if yes"
    sql: CASE
                WHEN ((${tracks} is null) or ${tracks} = '' or ${tracks} = ' ') THEN 1
                ELSE 0
           END;;
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

    measure: Count_development{
      type: sum
      sql:  ${Develop};;
    }

  measure: Count_design{
    type: sum
    sql:  ${Design};;
  }

  measure: Count_data_science{
    type: sum
    sql:  ${Data_Science};;
  }

  measure: Count_None {
    type: sum
    sql: ${No_track} ;;
  }

    measure: count {
      type: count
      drill_fields: [
        profile_link,
        first_name,
        last_name,
        email,
        reporting_country
      ]
    }

  }
