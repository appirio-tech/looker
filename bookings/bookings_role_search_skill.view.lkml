view: bookings_role_search_skill {

  label: "Bookings Role Search Skill (Connect)"

  sql_table_name: public.bookings_role_search_skill_xref ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    description: "unique identifier"
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: role_search_id {
    type: string
    hidden: yes
    sql: ${TABLE}.role_search_id ;;
  }

  dimension: skill_id {
    type: string
    description: "Skill GUID"
    sql: ${TABLE}.skill_id ;;
  }

  dimension: skill_name {
    type: string
    description: "Skill Name for the Skill GUID"
    sql: ${TABLE}.skill_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
