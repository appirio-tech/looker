view: challenge_groups {
  derived_table: {
    sql: select g.id as group_id,
                g.name as group_name,
                cg.challenge_id as challenge_id,
                cg.challenge_blended_id as challenge_blended_id
           from challenge_groups cg,
                "authorization"."group" g
          where cg.group_id = g.id
       ;;
    sortkeys: ["group_name", "challenge_id", "challenge_blended_id"]
    distribution: "challenge_blended_id"
    persist_for: "30 minutes"
  }

  dimension: group_name {
    description: ""
    type: string
    sql: ${TABLE}.group_name ;;
  }

  dimension: group_id {
    description: ""
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: challenge_id {
    description: ""
    type: number
    sql: ${TABLE}.challenge_id ;;
    #primary_key: yes
  }

  dimension: challenge_blended_id {
    hidden: yes
    type: string
    sql: ${TABLE}.challenge_blended_id ;;
    primary_key: yes
  }
  measure: count {
    type: count
  }
}
