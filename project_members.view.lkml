view: connect_project_members {
  sql_table_name: public.project_members ;;

 dimension: id {
  primary_key: yes
  description: "Unique Database identifier, Project Member Id"
  type: number
  sql: ${TABLE}.id ;;
}

   dimension_group: created_at {
    type: time
    description: "Date when the Member was added to the project"
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.createdat ;;
  }

  dimension: created_by {
    type: number
    description: "User who added the member to the project"
    sql: ${TABLE}.createdby ;;
  }

   dimension_group: deleted_at {
    type: time
    description: "Date when the Member was deleted from the project"
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.deletedat ;;
  }
  dimension: owner {
    type: yesno
    description: "The first customer who created the project is considered the owner of the project"
    sql: ${TABLE}.isprimary = 1;;
  }

  dimension: project_id {
    type: number
    value_format_name: id
    description: "Connect Project Id"
    # hidden: true
    sql: ${TABLE}.projectid ;;
  }

  dimension: role {
    type: string
    description: "Role of the user in the project ie. copilot, customer, manager etc"
    sql: ${TABLE}.role ;;
  }

  dimension_group: updated_at {
    type: time
    description: "Date when the Member updated on the project"
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.updatedat ;;
  }

  dimension: updated_by {
    type: number
    sql: ${TABLE}.updatedby ;;
  }

  dimension: user_id {
    type: number
    value_format_name: id
    description: "User Id for the member in Database"
    sql: ${TABLE}.userid ;;
  }

  measure: count {
    type: count
    drill_fields: [id, projects.directprojectid, projects.name]
  }

  measure: count_distinct_members {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id]
  }
}
