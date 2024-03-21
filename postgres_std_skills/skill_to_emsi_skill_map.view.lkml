view: skill_to_emsi_skill_map {
  sql_table_name: public.skill_to_emsi_skill_map ;;

  dimension: skill_id {
    primary_key: yes
    type: string
    hidden: no
    sql: ${TABLE}.skill_id ;;
  }


  dimension: emsi_skill_id {
    type: string
    hidden: no
    sql: ${TABLE}.emsi_skill_id ;;
  }


  dimension: emsi_id {
    type: string
    hidden: no
    sql: ${TABLE}.emsi_id ;;
  }

}
