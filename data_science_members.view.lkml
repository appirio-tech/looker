view: data_science_members {
  derived_table: {
    sql: select calendar.date as member_since_date
      , sum((select max(1) from project_result, project,member_stats
                          where project_result.user_id = c.coder_id
                        and project_result.project_id = project.project_id
                        and project_result.user_id=member_stats.user_id
            and (member_stats.sub_track='SRM' or project.project_category_name = 'Marathon Match')
                          and inquire_timestamp is not null))
         as new_data_science_participants
         , sum((select max(1) from project_result, project,member_stats
                          where project_result.user_id = c.coder_id
                        and project_result.project_id = project.project_id
                        and project_result.user_id=member_stats.user_id
            and (member_stats.sub_track='SRM' or project.project_category_name = 'Marathon Match')
                          and submit_timestamp is not null))
        as new_data_science_submitters
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
    sql: ${TABLE}.member_since_date ;;
  }

  measure: new_data_science_participants {
    type: sum
    sql: ${TABLE}.new_data_science_participants ;;
  }

  measure: new_data_science_submitters {
    type: sum
    sql: ${TABLE}.new_data_science_submitters ;;
  }

  set: detail {
    fields: [member_since_date_time, new_data_science_participants, new_data_science_submitters]
  }
}
