view: gig_weekly_survey {
  sql_table_name: tcs_dw.gig_weekly_survey ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: collector_name {
    type: string
    label: "Week Name"
    sql: ${TABLE}.collector_name ;;
  }

  dimension_group: collector {
    type: time
    label: "Survey"
    description: "Survey Week Ending Date"
    sql: ${TABLE}.collector_date ;;
  }

  dimension: respondent_id {
    type: string
    description: "Primary Key identifying a survey response"
    primary_key: yes
    sql: ${TABLE}.respondent_id ;;
  }

  dimension: collector_id {
    type: number
    hidden: yes
    sql: ${TABLE}.collector_id ;;
  }

  dimension_group: start {
    description: "When did the user start taking the survey"
    type: time
    sql: ${TABLE}.start_date ;;
  }

  dimension_group: end {
    description: "When did the user end the survey"
    type: time
    sql: ${TABLE}.end_date ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: handle {
    type: string
    sql: ${TABLE}.handle ;;
  }

  dimension: work_notes {
    type: string
    description: "Survey Question: Please provide a very brief overview of what you worked on this week."
    sql: ${TABLE}.work_notes ;;
  }

  dimension: workload {
    type: string
    description: "Survey Question: Workoad this week [as expected, less or more]"
    sql: ${TABLE}.workload ;;
  }

  dimension: workload_comments {
    type: string
    description: "Survey Question: If the workload is less or more, please provide details"
    sql: ${TABLE}.workload_comments ;;
  }

  dimension: feedback {
    type: string
    description: "Survey Question: Is there anything you would like to talk to us about this week?"
    sql: ${TABLE}.feedback ;;
  }

  set: detail {
    fields: [
      id,
      collector_name,
      collector_date,
      respondent_id,
      collector_id,
      start_date,
      end_date,
      ip_address,
      email,
      handle,
      work_notes,
      workload,
      workload_comments,
      feedback
    ]
  }
}
