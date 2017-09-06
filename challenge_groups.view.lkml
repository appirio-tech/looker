view: challenge_groups {
  derived_table: {
    sql: select g.id as group_id,
                g.name as group_name,
                cg.challenge_id as challenge_id
           from challenge_groups cg,
                "authorization"."group" g
          where cg.group_id = g.id
       ;;
    sortkeys: ["group_name", "challenge_id"]
    distribution: "group_name"
    persist_for: "2 hours"
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
  }

  measure: count {
    type: count
  }
}
