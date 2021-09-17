view: referral {
  derived_table: {
    sql: select
      participant.id AS id,
      participant.first_name AS first_name,
      participant.last_name AS last_name,
      participant.referral_count AS referral_count ,
      participant.created_at AS created_at,
      participant.rank AS rank,
      participant.email AS email,
      participant.referral_source AS source,
      participant.invite_count AS invite_count,
      participant.metadata AS metadata,

      growsurf_referral.id AS referral_id,
      growsurf_referral.referral_status AS did_referrer_receive_credit ,
      growsurf_referral.updated_at AS updated_at,
      growsurf_referral.referred_by AS referred_by_id,
      growsurf_referral.created_at AS referred_on,

      referred_by.first_name AS referred_by_first_name,
      referred_by.first_name AS referred_by_last_name,
      referred_by.email AS referred_by_email,


      json_extract_path_text(participant.metadata,'gigId') as gig_id,
      json_extract_path_text(participant.metadata,'tcHandle') as handle

      FROM growsurf_participant AS participant
      LEFT JOIN growsurf_referral ON participant.id = growsurf_referral.id
      LEFT JOIN growsurf_participant AS referred_by ON growsurf_referral.referred_by = referred_by.id
      ;;
    persist_for: "24 hours"
    distribution_style: "even"
    indexes: ["id"]
  }

  #------------------------------------Metadata extracts -------------------#
  dimension: gig_id {
    type: string
    description: "Gig Job ID, that has been referred"
  }

  dimension: handle {
    type: string
    description: "Topcoder Handle"
  }


  #-----------------------------------------------------------------------#
  dimension: id {
    primary_key: yes
    type: string
    description: "Participant alpha numeric GrowSurf Id"
  }

  dimension_group: joined {
    type: time
    description: "When did they join the referral program ?"
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

  dimension_group: updated {
    type: time
    description: "Referral Status updated could be Credit pending, Paid etc"
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


  dimension: first_name {
    type: string
    description: "Participant First Name"
  }

  dimension: last_name {
    type: string
    description: "Participant Last Name"
  }

  dimension: referrals {
    type: number
    description: "How many people has this person referred to (all time) ?"
    sql: ${TABLE}.referral_count ;;
  }

  dimension: rank {
    type: number
    hidden: yes
  }

  dimension: email {
    type: string
    description: "Participant Email"
    tags: ["email"]
  }

  dimension: source {
    type: string
    description: "If the source is Direct the member is the root level member, else they have been referred"
  }


  dimension: invite_count {
    type: number
    description: "Number of invitation sent by the participant"
  }

  dimension: metadata {
    type: string
    hidden: yes
  }


  dimension: did_referrer_receive_credit {
    type: string
    description: "Did referrer receive credit ?"
  }

  dimension: referred_by_id {
    type: string
    hidden: no
    description: "Growsurf alphanumeric id of the person who referred"
  }

  dimension: referred_by_first_name {
    type: string
  }

  dimension: referred_by_last_name {
    type: string
  }

  dimension: referred_by_email {
    type: string
  }

  dimension_group: referral_created {
    type: time
    description: "When did they join the referral record was created ?"
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


  dimension_group: system_modified_timestamp {
    hidden: yes
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
  }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name]
  }
}
