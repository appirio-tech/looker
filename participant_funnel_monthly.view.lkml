view: participant_funnel_monthly {
  derived_table: {
    sql: select calendar.date as member_since_date
      , sum((select max(1) from project_result, project
                          where user_id = c.coder_id
                        and project_result.project_id = project.project_id
                          and inquire_timestamp is not null))
         as new_dev_participants
      , sum((select max(1) from project_result, project
                          where user_id = c.coder_id
                        and project_result.project_id = project.project_id
                          and submit_timestamp is not null))
         as new_dev_submitters
      , sum((select max(1) from design_project_result, project
                          where user_id = c.coder_id
                        and design_project_result.project_id = project.project_id
                          and inquire_timestamp is not null))
         as new_design_participants
      , sum((select max(1) from design_project_result, project
                          where user_id = c.coder_id
                        and design_project_result.project_id = project.project_id
                          and submit_timestamp is not null))
         as new_design_submitters
      ,count(*) as new_signups
      from coder c
      , calendar
      where calendar.date = date(c.member_since)
      group by 1
      order by 1 desc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: member_since_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.member_since_date ;;
  }

  measure: new_dev_participants {
    type: sum
    sql: ${TABLE}.new_dev_participants ;;
  }

  measure: new_dev_submitters {
    type: sum
    sql: ${TABLE}.new_dev_submitters ;;
  }

  measure: new_design_participants {
    type: sum
    sql: ${TABLE}.new_design_participants ;;
  }

  measure: new_design_submitters {
    type: sum
    sql: ${TABLE}.new_design_submitters ;;
  }

  measure: new_signups {
    type: sum
    sql: ${TABLE}.new_signups ;;
  }

  set: detail {
    fields: [
      member_since_date_time,
      new_dev_participants,
      new_dev_submitters,
      new_design_participants,
      new_design_submitters,
      new_signups
    ]
  }
}
