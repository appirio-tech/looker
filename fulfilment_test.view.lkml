view: fulfilment_test {
  derived_table: {
    sql: select  challenge.copilot as copilot,
        challenge.project_id as challenge_id,
        challenge.status_desc as status,
        challenge.posting_date as posting_date,
        CASE

                    WHEN ((challenge.project_category_name = 'Marathon Match') or (challenge.technology_list like '%Data Science%'))  THEN 'Data Science'
                    WHEN ((challenge.project_category_name = 'Test Scenarios') or (challenge.project_category_name = 'Test Suites') or
                         (challenge.project_category_name = 'Bug Hunt') or (challenge.project_category_name = 'Testing Competition') or
                         (challenge.technology_list like '%QA%')) THEN 'QA'
                    WHEN ((challenge.project_category_name = 'First2Finish') or (challenge.project_category_name = 'Code') or
                         (challenge.project_category_name = 'Assembly Competition') or (challenge.project_category_name = 'UI Prototype Competition') or
                         (challenge.project_category_name = 'Architecture') or (challenge.project_category_name = 'Copilot Posting') or
                         (challenge.project_category_name = 'Specification') or (challenge.project_category_name = 'Conceptualization') or
                         (challenge.project_category_name = 'Development') or (challenge.project_category_name = 'Content Creation') or
                         (challenge.project_category_name = 'Design')) THEN 'Develop'
                    WHEN ((challenge.project_category_name = 'Web Design') or (challenge.project_category_name = 'Widget or Mobile Screen Design') or
                         (challenge.project_category_name = 'Design First2Finish') or (challenge.project_category_name = 'Wireframes') or
                         (challenge.project_category_name = 'Print/Presentation') or (challenge.project_category_name = 'Idea Generation') or
                         (challenge.project_category_name = 'Logo Design') or (challenge.project_category_name = 'Application Front-End Design') or
                         (challenge.project_category_name = 'Banners/Icons') or (challenge.project_category_name = 'Studio Other')) THEN 'Design'
                    ELSE 'Other'
              END  AS "track"
from tcs_dw.project AS challenge
where challenge.copilot is not null
group by 1,2,3,4,5
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_sucess {
    type: sum
    sql: CASE WHEN ${TABLE}.status = 'Completed' THEN 1 ELSE 0 END ;;

  }

  measure : count_failure {
    type: sum
    sql:  CASE WHEN  ${TABLE}.status = 'Cancelled - Failed Review' OR
                     ${TABLE}.status = 'Cancelled - Failed Screening' OR
                     ${TABLE}.status = 'Cancelled - Requirements Infeasible' OR
                     ${TABLE}.status = 'Cancelled - Winner Unresponsive' OR
                     ${TABLE}.status = 'Cancelled - Zero Registrations' OR
                     ${TABLE}.status = 'Cancelled - Zero Submissions' THEN 1 ELSE 0 END ;;
  }

  measure: fulfillment {
    type: number
    sql: ${count_sucess}/(${count_failure}+${count_sucess}) ;;
    value_format_name: decimal_2
  }

  dimension: copilot {
    type: number
    sql: ${TABLE}.copilot ;;
  }

  dimension: challenge_id {
    type: number
    sql: ${TABLE}.challenge_id ;;
    primary_key: yes
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: posting_date {
    type: time
    sql: ${TABLE}.posting_date ;;
  }

  dimension: track {
    type: string
    sql: ${TABLE}.track ;;
  }

  set: detail {
    fields: [copilot, challenge_id, status, posting_date_time,count_sucess,count_failure,count,track]
  }
}
