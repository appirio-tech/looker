view: challenge_resources {
  derived_table: {
    sql: select
              r.id,
              r.challenge_id,
              r.member_handle,
              r.created_by,
              r.role_id,
              role.name AS role_name,
              r.member_id,
              r.created_date,
              r.updated_by,
              r.updated_date,
              r.is_deleted
      from tcs_dw.resource r
      inner join tcs_dw.dynamo_ResourceRole role ON r.role_id = role.id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: role {
    type: string
    description: "Resource Role on the Challenge. A person can have multiple roles on the same challenge"
    sql: ${TABLE}.role_name ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: challenge_id {
    description: "Challenge identifier"
    type: string
    sql: ${TABLE}.challenge_id ;;
  }

  dimension: member_handle {
    description: "Handle of the member"
    type: string
    sql: ${TABLE}.member_handle ;;
  }

  dimension: created_by {
    description: "Created by user"
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: role_id {
    description: "Role id associated with the role on the challenge"
    type: string
    sql: ${TABLE}.role_id ;;
  }

  dimension: member_id {
    description: "Unique id of the member"
    type: number
    sql: ${TABLE}.member_id ;;
  }

  dimension_group: created {
    description: ""
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: updated_by {
    description: ""
    type: string
    sql: ${TABLE}.updated_by ;;
  }

  dimension_group: updated {
    description: ""
    type: time
    sql: ${TABLE}.updated_date ;;
  }

  dimension: is_deleted {
    description: ""
    type: string
    sql: ${TABLE}.is_deleted ;;
  }

  set: detail {
    fields: [
      id,
      challenge_id,
      member_handle,
      created_by,
      role_id,
      member_id,
      created_date,
      updated_by,
      updated_date,
      is_deleted
    ]
  }
}
