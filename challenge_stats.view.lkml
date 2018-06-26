view: challenge_stats {
  derived_table: {
    sql: SELECT p.project_id,
       p.component_id,
       p.component_name,
       p.num_registrations,
       p.num_submissions,
       p.num_valid_submissions,
       p.avg_raw_score,
       p.avg_final_score,
       p.phase_id,
       p.phase_desc,
       p.category_id,
       p.category_desc,
       p.posting_date,
       p.submitby_date,
       p.complete_date,
       p.review_phase_id,
       p.review_phase_name,
       p.status_id,
       p.status_desc,
       CASE
          WHEN p.status_desc = 'Cancelled - Requirements Infeasible' THEN 'Dismissed'
          WHEN p.status_desc = 'Cancelled - Client Request' THEN 'Dismissed'
          WHEN p.status_desc = 'Cancelled - Failed Review' THEN 'Cancelled'
          WHEN p.status_desc = 'Cancelled - Failed Screening' THEN 'Cancelled'
          WHEN p.status_desc = 'Cancelled - Zero Submissions' THEN 'Cancelled'
          ELSE 'Completed'
       END AS Fulfilled,
       p.level_id,
       p.rating_date,
       p.viewable_category_ind,
       p.num_submissions_passed_review,
       p.winner_id,
       winner.handle AS winner_handle,
       p.stage_id,
       p.digital_run_ind,
       p.suspended_ind,
       p.project_category_id,
       p.project_category_name,
       p.tc_direct_project_id,
       direct_project.name AS project_name,
       direct_project.billing_project_id AS billing_account_id,
       client_project.project_name as billing_account_name,
       client_project.customer_number,
       client_project.client_name,
       p.admin_fee,
       p.contest_prizes_total,
       p.client_project_id,
       p.start_date_calendar_id,
       p.duration,
       p.fulfillment,
       p.last_modification_date,
       p.first_place_prize,
       p.num_checkpoint_submissions,
       p.num_valid_checkpoint_submissions,
       p.total_prize,
       p.checkpoint_start_date,
       p.checkpoint_end_date,
       p.challenge_manager AS challenge_manager_id,
       challenge_manager.handle AS challenge_manager,
       p.challenge_creator AS challenge_creator_id,
       challenge_creator.handle AS challenge_creator,
       p.copilot AS copilot_id,
       challenge_copilot.handle AS challenge_copilot,
       p.challenge_launcher AS challenge_launcher_id,
       challenge_launcher.handle AS challenge_launcher,
       p.registration_end_date,
       p.scheduled_end_date,
       p.checkpoint_prize_amount,
       p.checkpoint_prize_number,
       p.dr_points,
       p.reliability_cost,
       p.review_cost,
       p.forum_id,
       p.submission_viewable,
       p.is_private,
       p.actual_total_prize,
       p.copilot_cost,
       p.estimated_reliability_cost,
       p.estimated_review_cost,
       p.estimated_copilot_cost,
       p.estimated_admin_fee,
       pr.user_id AS registrant_id,
       challenge_registrant.handle AS registrant_handle,
       pr.submit_ind,
       pr.valid_submission_ind,
       pr.raw_score,
       pr.final_score,
       pr.inquire_timestamp,
       pr.submit_timestamp,
       pr.review_complete_timestamp,
       pr.payment,
       pr.old_rating,
       pr.new_rating,
       pr.old_reliability,
       pr.new_reliability,
       pr.placed,
       pr.rating_ind,
       pr.passed_review_ind,
       pr.points_awarded,
       pr.final_points,
       pr.potential_points,
       pr.reliable_submission_ind,
       pr.num_appeals,
       pr.num_successful_appeals,
       pr.old_rating_id,
       pr.new_rating_id,
       pr.num_ratings,
       pr.rating_order,
       c.photo_url,
       p.task_ind,
       p.effort_hours_estimate
FROM tcs_dw.project p LEFT OUTER JOIN tcs_dw.project_result pr ON p.project_id = pr.project_id
     LEFT OUTER JOIN tcs_dw.direct_project_dim direct_project ON p.tc_direct_project_id = direct_project.direct_project_id
     LEFT OUTER JOIN tcs_dw.client_project_dim client_project ON direct_project.billing_project_id = client_project.billing_project_id
     LEFT OUTER JOIN tcs_dw.coder c ON pr.user_id = c.coder_id
     LEFT OUTER JOIN tcs_dw.coder winner ON p.winner_id = winner.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_manager ON p.challenge_manager = challenge_manager.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_creator ON p.challenge_creator = challenge_creator.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_launcher ON p.challenge_launcher = challenge_launcher.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_copilot ON p.copilot = challenge_copilot.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_registrant ON pr.user_id = challenge_registrant.coder_id
UNION
SELECT p.project_id,
       p.component_id,
       p.component_name,
       p.num_registrations,
       p.num_submissions,
       p.num_valid_submissions,
       p.avg_raw_score,
       p.avg_final_score,
       p.phase_id,
       p.phase_desc,
       p.category_id,
       p.category_desc,
       p.posting_date,
       p.submitby_date,
       p.complete_date,
       p.review_phase_id,
       p.review_phase_name,
       p.status_id,
       p.status_desc,
       CASE
          WHEN p.status_desc = 'Completed' THEN 'Completed'
          WHEN p.status_desc = 'Cancelled - Failed Review' THEN 'Cancelled'
          WHEN p.status_desc = 'Cancelled - Failed Screening' THEN 'Cancelled'
          WHEN p.status_desc = 'Cancelled - Zero Submissions' THEN 'Cancelled'
          ELSE 'Cancelled-Client Request'
       END AS Fulfilled,
       p.level_id,
       p.rating_date,
       p.viewable_category_ind,
       p.num_submissions_passed_review,
       p.winner_id,
       winner.handle AS winner_handle,
       p.stage_id,
       p.digital_run_ind,
       p.suspended_ind,
       p.project_category_id,
       p.project_category_name,
       p.tc_direct_project_id,
       direct_project.name AS project_name,
       direct_project.billing_project_id AS billing_account_id,
       client_project.project_name as billing_account_name,
       client_project.customer_number,
       client_project.client_name,
       p.admin_fee,
       p.contest_prizes_total,
       p.client_project_id,
       p.start_date_calendar_id,
       p.duration,
       p.fulfillment,
       p.last_modification_date,
       p.first_place_prize,
       p.num_checkpoint_submissions,
       p.num_valid_checkpoint_submissions,
       p.total_prize,
       p.checkpoint_start_date,
       p.checkpoint_end_date,
       p.challenge_manager AS challenge_manager_id,
       challenge_manager.handle AS challenge_manager,
       p.challenge_creator AS challenge_creator_id,
       challenge_creator.handle AS challenge_creator,
       p.copilot AS copilot_id,
       challenge_copilot.handle AS challenge_copilot,
       p.challenge_launcher AS challenge_launcher_id,
       challenge_launcher.handle AS challenge_launcher,
       p.registration_end_date,
       p.scheduled_end_date,
       p.checkpoint_prize_amount,
       p.checkpoint_prize_number,
       p.dr_points,
       p.reliability_cost,
       p.review_cost,
       p.forum_id,
       p.submission_viewable,
       p.is_private,
       p.actual_total_prize,
       p.copilot_cost,
       p.estimated_reliability_cost,
       p.estimated_review_cost,
       p.estimated_copilot_cost,
       p.estimated_admin_fee,
       pr.user_id AS registrant_id,
       challenge_registrant.handle AS registrant_handle,
       pr.submit_ind,
       pr.valid_submission_ind,
       null AS raw_score,
       null AS final_score,
       pr.inquire_timestamp,
       pr.submit_timestamp,
       pr.review_complete_timestamp,
       pr.prize_amount AS payment,
       null AS old_rating,
       null AS new_rating,
       null AS old_reliability,
       null AS new_reliability,
       pr.placement AS placed,
       null AS rating_ind,
       null AS passed_review_ind,
       null AS points_awarded,
       null AS final_points,
       null AS potential_points,
       null AS reliable_submission_ind,
       null AS num_appeals,
       null AS num_successful_appeals,
       null AS old_rating_id,
       null AS new_rating_id,
       null AS num_ratings,
       null AS rating_order,
       c.photo_url,
       p.task_ind,
       p.effort_hours_estimate
FROM tcs_dw.project p LEFT OUTER JOIN
     tcs_dw.design_project_result pr ON p.project_id = pr.project_id
     LEFT OUTER JOIN tcs_dw.direct_project_dim direct_project ON p.tc_direct_project_id = direct_project.direct_project_id
     LEFT OUTER JOIN tcs_dw.client_project_dim client_project ON direct_project.billing_project_id = client_project.billing_project_id
     LEFT OUTER JOIN tcs_dw.coder c ON pr.user_id = c.coder_id
     LEFT OUTER JOIN tcs_dw.coder winner ON p.winner_id = winner.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_manager ON p.challenge_manager = challenge_manager.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_creator ON p.challenge_creator = challenge_creator.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_launcher ON p.challenge_launcher = challenge_launcher.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_copilot ON p.copilot = challenge_copilot.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_registrant ON pr.user_id = challenge_registrant.coder_id

 ;;
    sortkeys: ["project_name", "billing_account_name", "project_id", "project_category_name", "posting_date"]
    distribution: "billing_account_name"
    persist_for: "8 hours"
  }

  #Added on 6/9. Task #29
  dimension: task_ind {
    label: "IsTask?"
    description: "Whether challenge consist of a task or not."
    type: number
    sql: ${TABLE}.task_ind ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: project_id {
    primary_key: yes
    description: "Challenge ID Alias"
    type: number
    hidden: yes
    sql: ${TABLE}.project_id ;;
  }

  dimension: challenge_id {
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension: component_id {
    type: number
    sql: ${TABLE}.component_id ;;
  }

  dimension: component_name {
    type: string
    label: "Challenge Name"
    link: {
      label: "Challenge Link"
      url: "https://www.topcoder.com/challenges/{{ challenge_stats.project_id._value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
    sql: ${TABLE}.component_name ;;
  }

  measure: num_registrations {
    type: sum
    sql: ${TABLE}.num_registrations ;;
  }

  measure: num_submissions {
    type: sum
    sql: ${TABLE}.num_submissions ;;
  }

  measure: num_valid_submissions {
    type: sum
    sql: ${TABLE}.num_valid_submissions ;;
  }

  measure: avg_raw_score {
    type: sum
    sql: ${TABLE}.avg_raw_score ;;
  }

  measure: avg_final_score {
    type: sum
    sql: ${TABLE}.avg_final_score ;;
  }

  dimension: phase_id {
    type: number
    sql: ${TABLE}.phase_id ;;
  }

  dimension: phase_desc {
    type: string
    sql: ${TABLE}.phase_desc ;;
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }

  dimension: category_desc {
    type: string
    sql: ${TABLE}.category_desc ;;
  }

  dimension_group: posting_date {
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

  dimension_group: submitby_date {
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

  dimension_group: complete_date {
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

  dimension: review_phase_id {
    type: number
    sql: ${TABLE}.review_phase_id ;;
  }

  dimension: review_phase_name {
    type: string
    sql: ${TABLE}.review_phase_name ;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}.status_id ;;
  }

  dimension: status_desc {
    type: string
    sql: ${TABLE}.status_desc ;;
  }

  dimension: fulfilled {
    type: string
    sql: ${TABLE}.fulfilled ;;
  }

  dimension: Track {
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

  dimension: level_id {
    type: number
    sql: ${TABLE}.level_id ;;
  }

  dimension_group: rating_date {
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

  dimension: viewable_category_ind {
    type: number
    sql: ${TABLE}.viewable_category_ind ;;
  }

  measure: num_submissions_passed_review {
    type: sum
    sql: ${TABLE}.num_submissions_passed_review ;;
  }

  dimension: winner_id {
    type: number
    sql: ${TABLE}.winner_id ;;
  }

  dimension: winner_handle {
    type: string
    sql: ${TABLE}.winner_handle ;;
  }

  dimension: stage_id {
    type: number
    sql: ${TABLE}.stage_id ;;
  }

  dimension: digital_run_ind {
    type: number
    sql: ${TABLE}.digital_run_ind ;;
  }

  dimension: suspended_ind {
    type: number
    sql: ${TABLE}.suspended_ind ;;
  }

  dimension: project_category_id {
    type: number
    sql: ${TABLE}.project_category_id ;;
  }

  dimension: project_category_name {
    type: string
    sql: ${TABLE}.project_category_name ;;
  }

  dimension: tc_direct_project_id {
    type: number
    sql: ${TABLE}.tc_direct_project_id ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }

  dimension: billing_account_id {
    type: number
    sql: ${TABLE}.billing_account_id ;;
  }

  dimension: billing_account_name {
    type: string
    sql: ${TABLE}.billing_account_name ;;
  }

  dimension: customer_number {
    type: string
    sql: ${TABLE}.customer_number ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  measure: admin_fee {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.admin_fee ;;
  }

  measure: contest_prizes_total {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.contest_prizes_total ;;
  }

  dimension: client_project_id {
    type: number
    sql: ${TABLE}.client_project_id ;;
  }

  dimension: start_date_calendar_id {
    type: number
    sql: ${TABLE}.start_date_calendar_id ;;
  }

  dimension_group: start_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.start_date ;;
  }

  measure: duration {
    type: sum
    sql: ${TABLE}.duration ;;
  }

  measure: fulfillment {
    type: sum
    sql: ${TABLE}.fulfillment ;;
  }

  dimension_group: last_modification_date {
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

  measure: first_place_prize {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.first_place_prize ;;
  }

  measure: num_checkpoint_submissions {
    type: sum
    sql: ${TABLE}.num_checkpoint_submissions ;;
  }

  measure: num_valid_checkpoint_submissions {
    type: sum
    sql: ${TABLE}.num_valid_checkpoint_submissions ;;
  }

  measure: total_prize {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.total_prize ;;
  }

  dimension_group: checkpoint_start_date {
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    type: time
    sql: ${TABLE}.checkpoint_start_date ;;
  }

  dimension_group: checkpoint_end_date {
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    type: time
    sql: ${TABLE}.checkpoint_end_date ;;
  }

  dimension: challenge_manager_id {
    type: number
    sql: ${TABLE}.challenge_manager_id ;;
  }

  dimension: challenge_manager {
    type: string
    sql: ${TABLE}.challenge_manager ;;
  }

  dimension: challenge_creator_id {
    type: number
    sql: ${TABLE}.challenge_creator_id ;;
  }

  dimension: challenge_creator {
    type: string
    sql: ${TABLE}.challenge_creator ;;
  }

  dimension: copilot_id {
    type: number
    sql: ${TABLE}.copilot_id ;;
  }

  dimension: challenge_copilot {
    type: string
    sql: ${TABLE}.challenge_copilot ;;
  }

  dimension: challenge_launcher_id {
    type: number
    sql: ${TABLE}.challenge_launcher_id ;;
  }

  dimension: challenge_launcher_handle {
    type: string
    sql: ${TABLE}.challenge_launcher_handle ;;
  }

  dimension_group: registration_end_date {
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

  dimension_group: scheduled_end_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
  }

  measure: checkpoint_prize_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.checkpoint_prize_amount ;;
  }

  measure: checkpoint_prize_number {
    type: sum
    sql: ${TABLE}.checkpoint_prize_number ;;
  }

  measure: dr_points {
    type: sum
    sql: ${TABLE}.dr_points ;;
  }

  measure: reliability_cost {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.reliability_cost ;;
  }

  measure: review_cost {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.review_cost ;;
  }

  dimension: forum_id {
    type: number
    sql: ${TABLE}.forum_id ;;
  }

  dimension: submission_viewable {
    type: number
    sql: ${TABLE}.submission_viewable ;;
  }

  dimension: is_private {
    type: number
    sql: ${TABLE}.is_private ;;
  }

  measure: actual_total_prize {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.actual_total_prize ;;
  }

  measure: copilot_cost {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.copilot_cost ;;
  }

  measure: estimated_reliability_cost {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.estimated_reliability_cost ;;
  }

  measure: effort_hours_estimate {
    type: sum
    value_format: "#,##0.00"
    description: "Topgear field to estimate efforts on a challenge"
    sql: ${TABLE}.effort_hours_estimate ;;
  }

  measure: estimated_review_cost {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.estimated_review_cost ;;
  }

  measure: estimated_copilot_cost {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.estimated_copilot_cost ;;
  }

  measure: estimated_admin_fee {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.estimated_admin_fee ;;
  }

  dimension: registrant_id {
    type: number
    sql: ${TABLE}.registrant_id ;;
  }

  dimension: registrant_handle {
    type: string
    sql: ${TABLE}.registrant_handle ;;
  }

  dimension: submit_ind {
    type: number
    sql: ${TABLE}.submit_ind ;;
  }

  dimension: valid_submission_ind {
    type: number
    sql: ${TABLE}.valid_submission_ind ;;
  }

  measure: raw_score {
    type: sum
    sql: ${TABLE}.raw_score ;;
  }

  measure: final_score {
    type: sum
    sql: ${TABLE}.final_score ;;
  }

  dimension_group: inquire_timestamp {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.inquire_timestamp ;;
  }

  dimension_group: submit_timestamp {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.submit_timestamp ;;
  }

  dimension_group: review_complete_timestamp {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter
    ]
    sql: ${TABLE}.review_complete_timestamp ;;
  }

  measure: payment {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.payment ;;
  }

  measure: old_rating {
    type: sum
    sql: ${TABLE}.old_rating ;;
  }

  measure: new_rating {
    type: sum
    sql: ${TABLE}.new_rating ;;
  }

  measure: old_reliability {
    type: sum
    sql: ${TABLE}.old_reliability ;;
  }

  measure: new_reliability {
    type: sum
    sql: ${TABLE}.new_reliability ;;
  }

  dimension: placed {
    type: number
    sql: ${TABLE}.placed ;;
  }

  dimension: rating_ind {
    type: number
    sql: ${TABLE}.rating_ind ;;
  }

  dimension: passed_review_ind {
    type: number
    sql: ${TABLE}.passed_review_ind ;;
  }

  measure: points_awarded {
    type: sum
    sql: ${TABLE}.points_awarded ;;
  }

  measure: final_points {
    type: sum
    sql: ${TABLE}.final_points ;;
  }

  measure: potential_points {
    type: sum
    sql: ${TABLE}.potential_points ;;
  }

  dimension: reliable_submission_ind {
    type: number
    sql: ${TABLE}.reliable_submission_ind ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  measure: num_appeals {
    type: sum
    sql: ${TABLE}.num_appeals ;;
  }

  measure: num_successful_appeals {
    type: sum
    sql: ${TABLE}.num_successful_appeals ;;
  }

  measure: old_rating_id {
    type: sum
    sql: ${TABLE}.old_rating_id ;;
  }

  measure: new_rating_id {
    type: sum
    sql: ${TABLE}.new_rating_id ;;
  }

  measure: num_ratings {
    type: sum
    sql: ${TABLE}.num_ratings ;;
  }

  dimension: rating_order {
    type: number
    sql: ${TABLE}.rating_order ;;
  }

  measure: count_distinct_registrant {
    type: count_distinct
    sql: ${TABLE}.registrant_handle ;;
  }

  measure: count_distinct_submitter {
    type: count_distinct
    sql: DECODE(${submit_ind},1, ${TABLE}.registrant_handle,null) ;;
  }

  set: detail {
    fields: [
      project_id,
      component_id,
      component_name,
      num_registrations,
      num_submissions,
      num_valid_submissions,
      avg_raw_score,
      avg_final_score,
      phase_id,
      phase_desc,
      category_id,
      category_desc,
      posting_date_time,
      submitby_date_time,
      complete_date_time,
      review_phase_id,
      review_phase_name,
      status_id,
      status_desc,
      level_id,
      rating_date_time,
      viewable_category_ind,
      num_submissions_passed_review,
      winner_id,
      winner_handle,
      stage_id,
      digital_run_ind,
      suspended_ind,
      project_category_id,
      project_category_name,
      tc_direct_project_id,
      project_name,
      billing_account_id,
      billing_account_name,
      customer_number,
      client_name,
      admin_fee,
      contest_prizes_total,
      client_project_id,
      start_date_calendar_id,
      start_date_time,
      duration,
      fulfillment,
      last_modification_date_time,
      first_place_prize,
      num_checkpoint_submissions,
      num_valid_checkpoint_submissions,
      total_prize,
      checkpoint_start_date_time,
      checkpoint_end_date_time,
      challenge_manager_id,
      challenge_manager,
      challenge_creator_id,
      challenge_creator,
      copilot_id,
      challenge_copilot,
      challenge_launcher_id,
      challenge_launcher_handle,
      registration_end_date_time,
      scheduled_end_date_time,
      checkpoint_prize_amount,
      checkpoint_prize_number,
      dr_points,
      reliability_cost,
      review_cost,
      forum_id,
      submission_viewable,
      is_private,
      actual_total_prize,
      copilot_cost,
      estimated_reliability_cost,
      estimated_review_cost,
      estimated_copilot_cost,
      estimated_admin_fee,
      registrant_id,
      registrant_handle,
      submit_ind,
      valid_submission_ind,
      raw_score,
      final_score,
      inquire_timestamp_time,
      submit_timestamp_time,
      review_complete_timestamp_time,
      payment,
      old_rating,
      new_rating,
      old_reliability,
      new_reliability,
      placed,
      rating_ind,
      passed_review_ind,
      points_awarded,
      final_points,
      potential_points,
      reliable_submission_ind,
      num_appeals,
      num_successful_appeals,
      old_rating_id,
      new_rating_id,
      num_ratings,
      rating_order
    ]
  }
}
