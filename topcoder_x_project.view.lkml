view: topcoder_x_project {
  sql_table_name: tcs_dw.topcoder_x_project ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: archived {
    description: "Has the project been marked as Archived ?"
    type: yesno
    sql: ${TABLE}.archived ;;
  }

  dimension: copilot {
    description: "Copilot Handle"
    type: string
    sql: ${TABLE}.copilot ;;
  }

  dimension: owner {
    description: "Owner of the Project"
    type: string
    sql: ${TABLE}.owner ;;
  }

  dimension: repo_url {
    description: "Repository Url"
    type: string
    sql: ${TABLE}.repo_url ;;
  }

  dimension: secret_webhook_key {
    type: string
    hidden: yes
    sql: ${TABLE}.secret_webhook_key ;;
  }

  dimension: tc_direct_id {
    description: "Topcoder Direct Project Associated with this X Project"
    type: number
    sql: ${TABLE}.tc_direct_id ;;
  }

  dimension: title {
    description: "Project Name"
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: [id, title, tc_direct_id, copilot, owner]
  }
}
