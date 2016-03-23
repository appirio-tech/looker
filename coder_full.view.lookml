
- view: coder_full
  derived_table:
    sql: |
      SELECT coder.*,
             country.country_name,
             country.participating,
             country.longitude,
             country.latitude,
             country.region
      FROM public.coder, public.country
      WHERE public.coder.country_code = public.country.country_code


  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: coder_id
    type: number
    sql: ${TABLE}.coder_id

  - dimension: state_code
    type: string
    sql: ${TABLE}.state_code

  - dimension: country_code
    type: string
    sql: ${TABLE}.country_code

  - dimension: first_name
    type: string
    sql: ${TABLE}.first_name

  - dimension: last_name
    type: string
    sql: ${TABLE}.last_name

  - dimension: home_phone
    type: string
    sql: ${TABLE}.home_phone

  - dimension: work_phone
    type: string
    sql: ${TABLE}.work_phone

  - dimension: "address1"
    type: string
    sql: ${TABLE}.address1

  - dimension: "address2"
    type: string
    sql: ${TABLE}.address2

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: zip
    type: string
    sql: ${TABLE}.zip

  - dimension: middle_name
    type: string
    sql: ${TABLE}.middle_name

  - dimension: activation_code
    type: string
    sql: ${TABLE}.activation_code

  - dimension_group: member_since
    type: time
    sql: ${TABLE}.member_since

  - dimension: notify
    type: string
    sql: ${TABLE}.notify

  - dimension: quote
    type: string
    sql: ${TABLE}.quote

  - dimension: employer_search
    type: string
    sql: ${TABLE}.employer_search

  - dimension: relocate
    type: string
    sql: ${TABLE}.relocate

  - dimension_group: modify_date
    type: time
    sql: ${TABLE}.modify_date

  - dimension: editor_id
    type: number
    sql: ${TABLE}.editor_id

  - dimension: notify_inquiry
    type: string
    sql: ${TABLE}.notify_inquiry

  - dimension: language_id
    type: number
    sql: ${TABLE}.language_id

  - dimension: coder_type_id
    type: number
    sql: ${TABLE}.coder_type_id

  - dimension: handle
    type: string
    sql: ${TABLE}.handle

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: email
    type: string
    sql: ${TABLE}.email

  - dimension_group: last_login
    type: time
    sql: ${TABLE}.last_login

  - dimension: image
    type: number
    sql: ${TABLE}.image

  - dimension: comp_country_code
    type: string
    sql: ${TABLE}.comp_country_code

  - dimension: handle_lower
    type: string
    sql: ${TABLE}.handle_lower

  - dimension_group: last_site_hit_date
    type: time
    sql: ${TABLE}.last_site_hit_date

  - dimension: reg_source
    type: string
    sql: ${TABLE}.reg_source

  - dimension: utm_source
    type: string
    sql: ${TABLE}.utm_source

  - dimension: utm_medium
    type: string
    sql: ${TABLE}.utm_medium

  - dimension: utm_campaign
    type: string
    sql: ${TABLE}.utm_campaign

  - dimension_group: create_date
    type: time
    sql: ${TABLE}.create_date

  - dimension_group: dw_stats_updated_time
    type: time
    sql: ${TABLE}.dw_stats_updated_time

  - dimension: country_name
    type: string
    sql: ${TABLE}.country_name

  - dimension: participating
    type: number
    sql: ${TABLE}.participating

  - dimension: longitude
    type: number
    sql: ${TABLE}.longitude

  - dimension: latitude
    type: number
    sql: ${TABLE}.latitude

  - dimension: region
    type: string
    sql: ${TABLE}.region

  - dimension: location
    type: location
    sql_latitude: ${TABLE}.latitude
    sql_longitude: ${TABLE}.longitude

  sets:
    detail:
      - coder_id
      - state_code
      - country_code
      - first_name
      - last_name
      - home_phone
      - work_phone
      - address1
      - address2
      - city
      - zip
      - middle_name
      - activation_code
      - member_since_time
      - notify
      - quote
      - employer_search
      - relocate
      - modify_date_time
      - editor_id
      - notify_inquiry
      - language_id
      - coder_type_id
      - handle
      - status
      - email
      - last_login_time
      - image
      - comp_country_code
      - handle_lower
      - last_site_hit_date_time
      - reg_source
      - utm_source
      - utm_medium
      - utm_campaign
      - create_date_time
      - dw_stats_updated_time_time
      - country_name
      - participating
      - longitude
      - latitude
      - region
      - location

