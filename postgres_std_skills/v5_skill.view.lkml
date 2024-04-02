view: v5_skill {
  sql_table_name: public.skill ;;

  dimension: skill_id {
    primary_key: yes
    type: string
    hidden: no
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    description: "Technology / Skill Name"
    sql: ${TABLE}.name ;;
  }

  dimension: description {
    type: string
    description: "Skill description"
    sql: ${TABLE}.description ;;
  }

  dimension: category_id {
    type: string
    description: "category id of the skill"
    sql: ${TABLE}.category_id ;;
  }

  dimension: dev_id {
    type: string
    description: "category id of the skill"
    sql: ${TABLE}.dev_id ;;
  }

  dimension_group: created_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_year,
      fiscal_quarter,
      fiscal_month_num,
      fiscal_quarter_of_year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_year,
      fiscal_quarter,
      fiscal_month_num,
      fiscal_quarter_of_year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension_group: deleted_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_year,
      fiscal_quarter,
      fiscal_month_num,
      fiscal_quarter_of_year
    ]
    sql: ${TABLE}.deleted_at ;;
  }

  measure: count {
    type: count
    drill_fields: [skill_id, name, member_skill.count]
  }

}
