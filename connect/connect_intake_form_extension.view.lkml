view: connect_intake_form_extension {
  sql_table_name: public.connect_intake_form_extension ;;

  dimension: connect_project_id {
    type: number
    sql: ${TABLE}.connect_project_id ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  measure: duration {
    type: sum
    sql: json_extract_path_text((regexp_replace(connect_intake_form_extension.details,'\\\\.')), 'duration') ;;
    description: "Duration in months"
  }

  dimension: role {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_intake_form_extension.details,'\\\\.')), 'role') ;;
    description: " Type of role like QA, frontend-dev, backend-dev, designer or full stack-dev etc."
  }

  dimension: skill_name {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_intake_form_extension.details,'\\\\.')), 'skills.name') ;;
    description: "Technology/skill name like java, node.js, xcode or mobile design etc."
  }

  measure: people {
    type: sum
    sql: json_extract_path_text((regexp_replace(connect_intake_form_extension.details,'\\\\.')), 'people') ;;
    description: "Number of users for a specific role in project"
  }
}
