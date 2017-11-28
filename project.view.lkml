view: challenge {
  sql_table_name: tcs_dw.project ;;

  dimension: client_project_id {
    type: number
    sql: ${TABLE}.client_project_id ;;
  }

  dimension: parent_category_desc {
    type: string
    sql: ${TABLE}.category_desc ;;
  }

  dimension: parent_category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }

  dimension: challenge_creator_id {
    type: number
    sql: ${TABLE}.challenge_creator ;;
  }

  dimension: challenge_launcher_id {
    type: number
    sql: ${TABLE}.challenge_launcher ;;
  }

  dimension: challenge_manager_id {
    type: number
    sql: ${TABLE}.challenge_manager ;;
  }

  dimension_group: checkpoint_end {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.checkpoint_end_date ;;
  }

  measure: checkpoint_prize_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.checkpoint_prize_amount ;;
  }

  dimension: checkpoint_prize_number {
    type: number
    sql: ${TABLE}.checkpoint_prize_number ;;
  }

  dimension_group: checkpoint_start {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.checkpoint_start_date ;;
  }

  dimension_group: complete {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.complete_date ;;
  }

  dimension: component_id {
    type: number
    sql: ${TABLE}.component_id ;;
  }

  dimension: challenge_name {
    type: string
    sql: ${TABLE}.component_name ;;
  }

  measure: contest_prizes_total {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.contest_prizes_total ;;
  }

  dimension: copilot_id {
    type: number
    sql: ${TABLE}.copilot ;;
  }

  measure: copilot_cost {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.copilot_cost ;;
  }

  dimension: digital_run_ind {
    type: number
    sql: ${TABLE}.digital_run_ind ;;
  }

  measure: dr_points {
    type: sum
    sql: ${TABLE}.dr_points ;;
  }

  measure: duration {
    type: sum
    sql: ${TABLE}.duration ;;
  }

  measure: estimated_admin_fee {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.estimated_admin_fee ;;
  }

  measure: estimated_copilot_cost {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.estimated_copilot_cost ;;
  }

  measure: estimated_reliability_cost {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.estimated_reliability_cost ;;
  }

  measure: estimated_review_cost {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.estimated_review_cost ;;
  }

  measure: first_place_prize {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.first_place_prize ;;
  }

  dimension: forum_id {
    type: number
    sql: ${TABLE}.forum_id ;;
  }

  measure: fulfillment {
    type: average
    value_format: "#,##0.00"
    sql: ${TABLE}.fulfillment ;;
  }

  dimension: is_private {
    type: number
    sql: ${TABLE}.is_private ;;
  }

  dimension: task_ind {
    type: number
    sql: NVL(${TABLE}.task_ind, 0) ;;
  }

  dimension_group: last_modification {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.last_modification_date ;;
  }

  #  - dimension: level_id
  #    type: string
  #    sql: ${TABLE}.level_id

  measure: num_checkpoint_submissions {
    type: sum
    sql: ${TABLE}.num_checkpoint_submissions ;;
  }

  measure: num_registrations {
    type: sum
    sql: ${TABLE}.num_registrations ;;
  }

  measure: num_submissions {
    type: sum
    sql: ${TABLE}.num_submissions ;;
  }

  measure: num_submissions_passed_review {
    type: sum
    sql: ${TABLE}.num_submissions_passed_review ;;
  }

  measure: num_valid_checkpoint_submissions {
    type: sum
    sql: ${TABLE}.num_valid_checkpoint_submissions ;;
  }

  measure: num_valid_submissions {
    type: sum
    sql: ${TABLE}.num_valid_submissions ;;
  }

  #  - dimension: phase_desc
  #    type: string
  #    sql: ${TABLE}.phase_desc

  #  - dimension: phase_id
  #    type: number
  #    sql: ${TABLE}.phase_id

  dimension_group: posting {
    description: "Start of registration. If challenge is draft, then uses scheduled start date."
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.posting_date ;;
  }

  dimension: challenge_category_id {
    type: number
    sql: ${TABLE}.project_category_id ;;
  }

  dimension: challenge_category_name {
    type: string
    sql: ${TABLE}.project_category_name ;;
  }

  dimension: track {
    type: string
    case: {
      when: {
        sql: ${TABLE}.project_category_name = 'First2Finish' ;;
        label: "Develop"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Code' ;;
        label: "Develop"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Assembly Competition' ;;
        label: "Develop"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'UI Prototype Competition' ;;
        label: "Design"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Web Design' ;;
        label: "Design"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Widget or Mobile Screen Design' ;;
        label: "Design"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Bug Hunt' ;;
        label: "Develop"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Design First2Finish' ;;
        label: "Design"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Wireframes' ;;
        label: "Design"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Architecture' ;;
        label: "Develop"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Print/Presentation' ;;
        label: "Design"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Copilot Posting' ;;
        label: "Develop"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Idea Generation' ;;
        label: "Design"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Logo Design' ;;
        label: "Design"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Application Front-End Design' ;;
        label: "Design"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Banners/Icons' ;;
        label: "Design"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Test Scenarios' ;;
        label: "Develop"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Content Creation' ;;
        label: "Develop"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Test Suites' ;;
        label: "Develop"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Specification' ;;
        label: "Develop"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Marathon Match' ;;
        label: "Data Science"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Conceptualization' ;;
        label: "Develop"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Studio Other' ;;
        label: "Design"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Design' ;;
        label: "Develop"
      }
      when: {
        sql: ${TABLE}.project_category_name = 'Development' ;;
        label: "Develop"
      }
      else: "Other"
    }
  }

  dimension: project_id {
    primary_key: yes
    type: number
    # hidden: true
    sql: ${TABLE}.project_id ;;
  }

  dimension_group: rating {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.rating_date ;;
  }

  dimension_group: registration_end {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.registration_end_date ;;
  }

  dimension: review_phase_id {
    type: number
    sql: ${TABLE}.review_phase_id ;;
  }

  dimension: review_phase_name {
    type: string
    sql: ${TABLE}.review_phase_name ;;
  }

  dimension_group: scheduled_end {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.scheduled_end_date ;;
  }

  # If the completed date is null (challenge not completed), then use the scheduled end date.
  dimension_group: projected_end {
    description: "If the completed date is null (challenge not completed), then use the scheduled end date."
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: NVL(${TABLE}.complete_date, ${TABLE}.scheduled_end_date) ;;
  }

  dimension: stage_id {
    type: number
    sql: ${TABLE}.stage_id ;;
  }

  dimension: start_date_calendar_id {
    type: number
    sql: ${TABLE}.start_date_calendar_id ;;
  }

  dimension: status_desc {
    type: string
    sql: ${TABLE}.status_desc ;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}.status_id ;;
  }

  dimension: submission_viewable {
    type: number
    sql: ${TABLE}.submission_viewable ;;
  }

  dimension_group: submitby {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.submitby_date ;;
  }

  dimension: suspended_ind {
    type: number
    sql: ${TABLE}.suspended_ind ;;
  }

  dimension: tc_direct_project_id {
    type: number
    sql: ${TABLE}.tc_direct_project_id ;;
  }

  measure: total_prize {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    drill_fields: [detail*]
    sql: ${TABLE}.total_prize ;;
  }

  dimension: version_id {
    type: string
    sql: ${TABLE}.version_id ;;
  }

  dimension: version_text {
    type: string
    sql: ${TABLE}.version_text ;;
  }

  dimension: viewable_category_ind {
    type: number
    sql: ${TABLE}.viewable_category_ind ;;
  }

  dimension: winner_id {
    type: number
    sql: ${TABLE}.winner_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: estimated_member_payments {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    drill_fields: [detail*]
    sql: ${TABLE}.estimated_copilot_cost + ${TABLE}.estimated_reliability_cost + ${TABLE}.estimated_review_cost + ${TABLE}.total_prize ;;
  }

  measure: actual_total_prize {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    drill_fields: [detail*]
    sql: ${TABLE}.actual_total_prize ;;
  }

  measure: average_actual_total_prize {
    type: average
    value_format: "$#,##0.00;($#,##0.00)"
    drill_fields: [detail*]
    sql: ${TABLE}.actual_total_prize ;;
  }

  measure: admin_fee {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    drill_fields: [detail*]
    sql: ${TABLE}.admin_fee ;;
  }

  measure: average_admin_fee {
    type: average
    value_format: "$#,##0.00;($#,##0.00)"
    drill_fields: [detail*]
    sql: ${TABLE}.admin_fee ;;
  }

  measure: avg_final_score {
    type: average
    drill_fields: [detail*]
    sql: ${TABLE}.avg_final_score ;;
  }

  measure: avg_raw_score {
    type: average
    sql: ${TABLE}.avg_raw_score ;;
  }

  measure: reliability_cost {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    drill_fields: [detail*]
    sql: ${TABLE}.reliability_cost ;;
  }

  measure: average_reliability_cost {
    type: average
    value_format: "$#,##0.00;($#,##0.00)"
    drill_fields: [detail*]
    sql: ${TABLE}.reliability_cost ;;
  }

  measure: review_cost {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    drill_fields: [detail*]
    sql: ${TABLE}.review_cost ;;
  }

  measure: average_review_cost {
    type: average
    value_format: "$#,##0.00;($#,##0.00)"
    drill_fields: [detail*]
    sql: ${TABLE}.review_cost ;;
  }

  measure: average_submissions {
    type: number
    value_format: "#,##0.0"
    sql: ${num_submissions}/${count} ;;
  }

  measure: average_registrants {
    type: number
    value_format: "#,##0.0"
    sql: ${num_registrations}/${count} ;;
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      project_id,
      challenge_name,
      challenge_category_name,
      total_prize,
      actual_total_prize,
      projected_end_date

    ]
  }
}
