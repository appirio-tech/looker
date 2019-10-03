view: challenge_stats {
  derived_table: {
    sql: SELECT p.project_id,
       p.component_id,
       p.component_name,
       p.exclude_from_TCO,
       p.tco_track,
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
       p.complete_date as complete_date,
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
       --direct_project.billing_project_id AS billing_account_id,
       client_project.project_name as billing_account_name,
       client_project.customer_number,
       client_project.client_name,
       p.admin_fee,
       p.contest_prizes_total,
       p.client_project_id  AS billing_account_id,
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
       challenge_launcher.handle AS challenge_launcher_handle,
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
       p.effort_offshore_days,
       p.effort_onshore_days,
       member_profile.photo_url AS member_photo_url
FROM tcs_dw.project p LEFT OUTER JOIN tcs_dw.project_result pr ON p.project_id = pr.project_id
     LEFT OUTER JOIN tcs_dw.direct_project_dim direct_project ON p.tc_direct_project_id = direct_project.direct_project_id
     LEFT OUTER JOIN tcs_dw.client_project_dim client_project ON p.client_project_id = client_project.billing_project_id
     LEFT OUTER JOIN tcs_dw.coder c ON pr.user_id = c.coder_id
     LEFT OUTER JOIN tcs_dw.coder winner ON p.winner_id = winner.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_manager ON p.challenge_manager = challenge_manager.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_creator ON p.challenge_creator = challenge_creator.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_launcher ON p.challenge_launcher = challenge_launcher.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_copilot ON p.copilot = challenge_copilot.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_registrant ON pr.user_id = challenge_registrant.coder_id
     LEFT OUTER JOIN tcs_dw.member_profile member_profile ON pr.user_id = member_profile.user_id
UNION
SELECT p.project_id,
       p.component_id,
       p.component_name,
       p.exclude_from_TCO,
       p.tco_track,
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
       p.complete_date as complete_date,
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
       --direct_project.billing_project_id AS billing_account_id,
       client_project.project_name as billing_account_name,
       client_project.customer_number,
       client_project.client_name,
       p.admin_fee,
       p.contest_prizes_total,
       p.client_project_id  AS billing_account_id,
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
       challenge_launcher.handle AS challenge_launcher_handle,
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
       p.effort_offshore_days,
       p.effort_onshore_days,
       member_profile.photo_url AS member_photo_url
FROM tcs_dw.project p LEFT OUTER JOIN
     tcs_dw.design_project_result pr ON p.project_id = pr.project_id
     LEFT OUTER JOIN tcs_dw.direct_project_dim direct_project ON p.tc_direct_project_id = direct_project.direct_project_id
     LEFT OUTER JOIN tcs_dw.client_project_dim client_project ON p.client_project_id = client_project.billing_project_id
     LEFT OUTER JOIN tcs_dw.coder c ON pr.user_id = c.coder_id
     LEFT OUTER JOIN tcs_dw.coder winner ON p.winner_id = winner.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_manager ON p.challenge_manager = challenge_manager.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_creator ON p.challenge_creator = challenge_creator.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_launcher ON p.challenge_launcher = challenge_launcher.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_copilot ON p.copilot = challenge_copilot.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_registrant ON pr.user_id = challenge_registrant.coder_id
     LEFT OUTER JOIN tcs_dw.member_profile member_profile ON pr.user_id = member_profile.user_id

 ;;
    sortkeys: ["project_name", "billing_account_name", "project_id", "project_category_name", "posting_date", "complete_date"]
    distribution: "complete_date"
    persist_for: "8 hours"
  }

  #Added on 6/9. Task #29
  dimension: task_ind {
    label: "IsTask?"
    description: "Whether challenge consist of a task or not."
    type: number
    sql: ${TABLE}.task_ind ;;
  }

  measure: count_distinct_challenge {
    type: count_distinct
    sql: ${TABLE}.project_id;;
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
    link: {
      label: "Challenge Link"
      url: "https://www.topcoder.com/challenges/{{ challenge_stats.challenge_id._value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
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

  dimension: challenge_url {
    type: string
    sql: 'https://www.topcoder.com/challenges/' || ${TABLE}.project_id ;;
  }

  dimension: exclude_from_TCO {
    type: number
    hidden: yes
    description: "By default all challenges are set to 0, only specific challenges for TCO point calculation are set to 1"
    sql: ${TABLE}.exclude_from_TCO ;;
  }

  dimension: tco_track {
    type: string
    description: "specifies challenge category like Develop, Design, QA etc. specifically for TCO leaderboard"
    sql: ${TABLE}.tco_track ;;
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
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
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
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
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
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.complete_date ;;
  }

  dimension: review_phase_id {
    type: number
    description: "Unique identifier for the review phase"
    sql: ${TABLE}.review_phase_id ;;
  }

  dimension: review_phase_name {
    type: string
    description: "review stage in which the challenge currently is"
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
        sql: ${TABLE}.project_category_name IN
            (
              'First2Finish',
              'Code',
              'Assembly Competition',
              'Bug Hunt',
              'Architecture',
              'Copilot Posting',
              'Test Scenarios',
              'Test Suites',
              'Content Creation',
              'Specification',
              'Conceptualization',
              'Design',
              'Development',
              'Testing Competition'
            ) ;;
        label: "Develop"
      }

      when: {
        sql: ${TABLE}.project_category_name IN
            (
              'UI Prototype Competition',
              'Web Design',
              'Widget or Mobile Screen Design',
              'Design First2Finish',
              'Wireframes',
              'Print/Presentation',
              'Idea Generation',
              'Logo Design',
              'Application Front-End Design',
              'Banners/Icons',
              'Studio Other'
            ) ;;

        label: "Design"
      }

      when: {
        sql: ${TABLE}.project_category_name = 'Marathon Match' ;;
        label: "Data Science"
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
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
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
    description: "Type of Challenge - Design, Code, Bug Hunt, F2F etc..."
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

  #dimension: client_project_id {
  #  type: number
  #  sql: ${TABLE}.client_project_id ;;
  #}

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
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.start_date ;;
  }

  measure: duration {
    type: sum
    sql: ${TABLE}.duration ;;
  }

  measure: avg_duration {
    type: average
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
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
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
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
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
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
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
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
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
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
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


  # added on 9 april

  dimension: effort_offshore_days {
    type: number
    value_format: "#,##0.00"
    description: "Topgear field to estimate offshore efforts on a challenge"
    sql: ${TABLE}.effort_offshore_days ;;
  }

  dimension: effort_onshore_days {
    type: number
    value_format: "#,##0.00"
    description: "Topgear field to estimate onshore efforts on a challenge"
    sql: ${TABLE}.effort_onshore_days ;;
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
    description: "list the members who have registered on the challenge"
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
    description: "Score without any re-review appeals"
    sql: ${TABLE}.raw_score ;;
  }

  measure: final_score  {
    label: "score"
    type: sum
    description: "Score after any re-review appeals"
    sql: ${TABLE}.final_score ;;
  }

#Added Temporary field to display score in regional Leaderboards
  measure : srm_tco19.score {
    label: "Total Score"
    type: sum
    description: "Temporary Field for regional leaderboards"
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
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
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
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
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
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.review_complete_timestamp ;;
  }

  measure: Blockchain_tco_points {
    type: sum
    description: "TCO Points computed for Blockchain / Cognitive technology products. 1st - 3rd 500 points, 4th to 10th 350 points, 11+ 100 points"
    value_format: "#,##0"
    label: "TCO Points - Blockchain/Cognitive"
    sql: CASE
                   WHEN ${TABLE}.placed <= 3 THEN 500
                   WHEN ${TABLE}.placed <= 10 THEN 350
                   WHEN ${TABLE}.placed <= 1000 THEN 100
                   ELSE 0
            END ;;
  }

  measure: Dev_tco_points {
    type: sum
    description: "TCO Points computed for the standard dev, QA and design tracks"
    value_format: "#,##0"
    label: "TCO Points - Dev/Design/QA"
    sql: CASE
                   WHEN ${TABLE}.placed = 1 and ${TABLE}.num_submissions_passed_review = 1 THEN (${TABLE}.total_prize-(${TABLE}.checkpoint_prize_amount*${TABLE}.checkpoint_prize_number))*1

                   WHEN ${TABLE}.placed = 1 and ${TABLE}.num_submissions_passed_review = 2 THEN (${TABLE}.total_prize-(${TABLE}.checkpoint_prize_amount*${TABLE}.checkpoint_prize_number))*.70
                   WHEN ${TABLE}.placed = 2 and ${TABLE}.num_submissions_passed_review = 2 THEN (${TABLE}.total_prize-(${TABLE}.checkpoint_prize_amount*${TABLE}.checkpoint_prize_number))*.30

                   WHEN ${TABLE}.placed = 1 and ${TABLE}.num_submissions_passed_review = 3 THEN (${TABLE}.total_prize-(${TABLE}.checkpoint_prize_amount*${TABLE}.checkpoint_prize_number))*.65
                   WHEN ${TABLE}.placed = 2 and ${TABLE}.num_submissions_passed_review = 3 THEN (${TABLE}.total_prize-(${TABLE}.checkpoint_prize_amount*${TABLE}.checkpoint_prize_number))*.25
                   WHEN ${TABLE}.placed = 3 and ${TABLE}.num_submissions_passed_review = 3 THEN (${TABLE}.total_prize-(${TABLE}.checkpoint_prize_amount*${TABLE}.checkpoint_prize_number))*.10

                   WHEN ${TABLE}.placed = 1 and ${TABLE}.num_submissions_passed_review = 4 THEN (${TABLE}.total_prize-(${TABLE}.checkpoint_prize_amount*${TABLE}.checkpoint_prize_number))*.60
                   WHEN ${TABLE}.placed = 2 and ${TABLE}.num_submissions_passed_review = 4 THEN (${TABLE}.total_prize-(${TABLE}.checkpoint_prize_amount*${TABLE}.checkpoint_prize_number))*.22
                   WHEN ${TABLE}.placed = 3 and ${TABLE}.num_submissions_passed_review = 4 THEN (${TABLE}.total_prize-(${TABLE}.checkpoint_prize_amount*${TABLE}.checkpoint_prize_number))*.10
                   WHEN ${TABLE}.placed = 4 and ${TABLE}.num_submissions_passed_review = 4 THEN (${TABLE}.total_prize-(${TABLE}.checkpoint_prize_amount*${TABLE}.checkpoint_prize_number))*.08

                   WHEN ${TABLE}.placed = 1 and ${TABLE}.num_submissions_passed_review >= 5 THEN (${TABLE}.total_prize-(${TABLE}.checkpoint_prize_amount*${TABLE}.checkpoint_prize_number))*.56
                   WHEN ${TABLE}.placed = 2 and ${TABLE}.num_submissions_passed_review >= 5 THEN (${TABLE}.total_prize-(${TABLE}.checkpoint_prize_amount*${TABLE}.checkpoint_prize_number))*.20
                   WHEN ${TABLE}.placed = 3 and ${TABLE}.num_submissions_passed_review >= 5 THEN (${TABLE}.total_prize-(${TABLE}.checkpoint_prize_amount*${TABLE}.checkpoint_prize_number))*.10
                   WHEN ${TABLE}.placed = 4 and ${TABLE}.num_submissions_passed_review >= 5 THEN (${TABLE}.total_prize-(${TABLE}.checkpoint_prize_amount*${TABLE}.checkpoint_prize_number))*.08
                   WHEN ${TABLE}.placed = 5 and ${TABLE}.num_submissions_passed_review >= 5 THEN (${TABLE}.total_prize-(${TABLE}.checkpoint_prize_amount*${TABLE}.checkpoint_prize_number))*.06
                   ELSE 0
            END ;;
  }

  measure: tco_points_mm {
    type: sum
    description: "TCO Points computed for the marathon match"
    value_format: "#,##0"
    label: "TCO Points - Marathon Match"
    sql: CASE
                   WHEN ${TABLE}.placed = 1 THEN 100
                   WHEN ${TABLE}.placed = 2 THEN 75
                   WHEN ${TABLE}.placed = 3 THEN 60
                   WHEN ${TABLE}.placed = 4 THEN 50
                   WHEN ${TABLE}.placed = 5 THEN 45
                   WHEN ${TABLE}.placed = 6 THEN 40
                   WHEN ${TABLE}.placed = 7 THEN 36
                   WHEN ${TABLE}.placed = 8 THEN 32
                   WHEN ${TABLE}.placed = 9 THEN 29
                   WHEN ${TABLE}.placed = 10 THEN 26
                   WHEN ${TABLE}.placed = 11 THEN 24
                   WHEN ${TABLE}.placed = 12 THEN 22
                   WHEN ${TABLE}.placed = 13 THEN 20
                   WHEN ${TABLE}.placed = 14 THEN 18
                   WHEN ${TABLE}.placed = 15 THEN 16
                   WHEN ${TABLE}.placed = 16 THEN 15
                   WHEN ${TABLE}.placed = 17 THEN 14
                   WHEN ${TABLE}.placed = 18 THEN 13
                   WHEN ${TABLE}.placed = 19 THEN 12
                   WHEN ${TABLE}.placed = 20 THEN 11
                   WHEN ${TABLE}.placed = 21 THEN 10
                   WHEN ${TABLE}.placed = 22 THEN 9
                   WHEN ${TABLE}.placed = 23 THEN 8
                   WHEN ${TABLE}.placed = 24 THEN 7
                   WHEN ${TABLE}.placed = 25 THEN 6
                   WHEN ${TABLE}.placed = 26 THEN 5
                   WHEN ${TABLE}.placed = 27 THEN 4
                   WHEN ${TABLE}.placed = 28 THEN 3
                   WHEN ${TABLE}.placed = 29 THEN 2
                   WHEN ${TABLE}.placed >= 30 and  ${TABLE}.placed <= 50 THEN 1
                   ELSE 0
            END ;;
  }

  measure: tco_points_algorithm {
    type: sum
    description: "TCO Points computed for the Algorithm track"
    value_format: "#,##0"
    label: "TCO Points - Algorithm"
    sql: CASE
                   WHEN ${TABLE}.placed = 1 THEN 5
                   WHEN ${TABLE}.placed <= 10 and ${TABLE}.placed >= 2 THEN 4
                   WHEN ${TABLE}.placed <= 25 and ${TABLE}.placed >= 11 THEN 3
                   WHEN ${TABLE}.placed > 25 and ${TABLE}.final_score > 0 THEN 2
                   ELSE 0
            END ;;
  }


  measure: tco_points_F2F {
    type: sum
    description: "TCO Points computed for the F2F track"
    value_format: "#,##0"
    label: "TCO Points - F2F"
    sql: least(${TABLE}.actual_total_prize,800) ;;

#Updated on 3rd Oct 2019
#previous logic :
# CASE
# WHEN ${TABLE}.placed = 1 and ${TABLE}.actual_total_prize >= 1200 THEN 800
#                  ELSE least(${TABLE}.actual_total_prize,800)
# END ;;
  }



  measure: payment {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.payment ;;
  }

  measure: wins {
    type: sum
    sql: CASE WHEN (${TABLE}.placed != NULL or ${TABLE}.placed > 0) THEN 1
         else 0
         end;;
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
    description: "Rank scored by the submitter on the challenge"
    sql: ${TABLE}.placed ;;
  }

  dimension: rating_ind {
    type: number
    sql: ${TABLE}.rating_ind ;;
  }

  dimension: passed_review_ind {
    type: number
    description: "Indicator that submission has passed review"
    sql: ${TABLE}.passed_review_ind ;;
  }

  measure: points_awarded {
    type: sum
    description: "Placement points awarded to the submitter based on challenge category and place secured"
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

  dimension: member_photo_url {
    type:  string
    sql: ${TABLE}.member_photo_url ;;
  }

  measure: num_appeals {
    type: sum
    description: "Numbers of re-review request by submitter"
    sql: ${TABLE}.num_appeals ;;
  }

  measure: num_successful_appeals {
    type: sum
    description: "Number of successful re-review request resulting in change of score "
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
    description: "Unique count of registrants "
    sql: ${TABLE}.registrant_handle ;;
  }

  measure: count_distinct_submitter {
    type: count_distinct
    description: "Unique count of submitters"
    sql: DECODE(${submit_ind},1, ${TABLE}.registrant_handle,null) ;;
  }

  measure: count_distinct_winner {
    type: count_distinct
    description: "Unique count of winners"
    sql: ${TABLE}.winner_handle ;;
  }

# measure: Challenge_Rank {
   # type: number
    #description: "Ranked according to the ascending order of challenge posting date"
    #sql: rank() over (partition by challenge_stats.registrant_handle order by challenge_stats.posting_date asc) ;;
  #}

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
