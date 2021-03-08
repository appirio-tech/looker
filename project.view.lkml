view: challenge {
  sql_table_name: tcs_dw.project ;;

  dimension: client_project_id {
    description: "Project's unique identifier."
    type: number
    sql: ${TABLE}.client_project_id ;;
  }

  dimension: parent_category_desc {
    description: "technology name"
    label: "Legacy Technology Name"
    type: string
    sql: ${TABLE}.category_desc ;;
    group_label: "Deprecated"
  }

  dimension: confidentiality_type {
    description: "Contains 2 values: Public (No NDA) and Standard CCA (Generic NDA), If there are any specific billing agreements they will override this field"
    type: string
    sql: ${TABLE}.confidentiality_type ;;
  }

  dimension: parent_category_id {
    description: "Technology's unique identifier."
    type: number
    label: "Category Id"
    hidden: yes
    sql: ${TABLE}.category_id ;;
  }

  dimension: challenge_creator_id {
    description: "Community member's unique identifier who created the challenge."
    type: number
    sql: ${TABLE}.challenge_creator ;;
  }

  dimension: challenge_launcher_id {
    type: number
    description: "Community Member unique Identifier who launched the challenge"
    sql: ${TABLE}.challenge_launcher ;;
  }

  dimension: challenge_manager_id {
    type: number
    description: "Community Member unique Identifier who manages the challenge"
    sql: ${TABLE}.challenge_manager ;;
  }

  dimension_group: checkpoint_end {
    type: time
    description: "Every challenge has checkpoints which acts as milestones, checkpoint end date is end date for every milestone"
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
    sql: ${TABLE}.checkpoint_end_date ;;
  }

  measure: checkpoint_prize_amount {
    type: sum
    description: "Prize money for the milestone achievement"
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.checkpoint_prize_amount ;;
  }

  dimension: checkpoint_prize_number {
    type: number
    description: "Every challenge has checkpoints which acts as milestones, checkpoint prize number are the prize places associated with every milestone"
    sql: ${TABLE}.checkpoint_prize_number ;;
  }

  dimension_group: checkpoint_start {
    type: time
    description: "Every challenge has checkpoints which acts as milestones, checkpoint start date is start date for every milestone"
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
    sql: ${TABLE}.checkpoint_start_date ;;
  }

  dimension_group: complete {
    type: time
    description: "Challenge Completion Date"
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

  dimension: component_id {
    type: number
    sql: ${TABLE}.component_id ;;
  }

  dimension: challenge_name {
    type: string
    sql: ${TABLE}.component_name ;;
    link: {
      label: "Challenge Link"
      url: "https://www.topcoder.com/challenges/{{ challenge.project_id._value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
  }

  dimension: Challenge_url {
    type: string
    sql: 'https://www.topcoder.com/challenges/' || ${TABLE}.project_id ;;
  }

  measure: contest_prizes_total {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    drill_fields: [detail*]
    sql: ${TABLE}.contest_prizes_total ;;
  }

  dimension: copilot_id {
    type: number
    description: "Community Member unique Identifier who copilots the challenge"
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

  dimension: tco_track {
    type: string
    description: "specifies challenge category like Develop, Design, QA etc. specifically for TCO leaderboard"
    sql: ${TABLE}.tco_track ;;
  }

  measure: dr_points {
    type: sum
    sql: ${TABLE}.dr_points ;;
  }

  measure: duration {
    type: sum
    description: "Challenge duration"
    drill_fields: [detail*]
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

  # Added on 10th Jan, 2019
  dimension: tco_flag {
    type: number
    description: "Used in TCO Leaderboards for various purposes to include / exclude certain challenges e.g. copilot submitter etc"
    sql: ${TABLE}.tco_flag;;
  }

  #Added on 4 april, 2019
  measure: effort_offshore_days {
    type: sum
    value_format: "#,##0.00"
    description: "Topgear field to estimate offshore efforts on a challenge"
    sql: ${TABLE}.effort_offshore_days ;;
  }

  #Added on 4 april, 2019
  measure: effort_onshore_days {
    type: sum
    value_format: "#,##0.00"
    description: "Topgear field to estimate onshore efforts on a challenge"
    sql: ${TABLE}.effort_onshore_days ;;
  }


  measure: estimated_review_cost {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.estimated_review_cost ;;
  }

  measure: first_place_prize {
    type: sum
    description: "Prize money for the first place"
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.first_place_prize ;;
  }

  measure: average_first_place_prize {
    type: average
    description: "Average prize money for first place"
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.first_place_prize ;;
  }

  dimension: average_first_place_prize_tier {
    type: tier
#    tiers: [0,250,500,750,1000,1250,1500,1750,2000]
    tiers: [0,100,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000]
    style: integer
    sql: ${TABLE}.first_place_prize ;;
  }

  dimension: forum_id {
    type: number
    sql: ${TABLE}.forum_id ;;
  }

  measure: fulfillment {
    type: average
    value_format: "#,##0.00"
    drill_fields: [detail*]
    sql: ${TABLE}.fulfillment ;;
  }

  dimension: is_private {
    type: number
    description: "Indicates whether the challenge is open for all or specifically assigned to a particular community member"
    sql: ${TABLE}.is_private ;;
  }

  dimension: task_ind {
    type: number
    description: "Indicates if a particular challenge is task, tasks are not public and do not have prize money associated with them"
    drill_fields: [detail*]
    sql: NVL(${TABLE}.task_ind, 0) ;;
  }

  dimension_group: last_modification {
    type: time
    description: "Date on which the challenge is last modified"
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

  #  - dimension: level_id
  #    type: string
  #    sql: ${TABLE}.level_id

  measure: num_checkpoint_submissions {
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.num_checkpoint_submissions ;;
  }

  measure: num_registrations {
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.num_registrations ;;
  }

  measure: num_submissions {
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.num_submissions ;;
  }

  measure: num_submissions_passed_review {
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.num_submissions_passed_review ;;
  }

  measure: num_valid_checkpoint_submissions {
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.num_valid_checkpoint_submissions ;;
  }

  measure: num_valid_submissions {
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.num_valid_submissions ;;
  }

  #  - dimension: phase_desc
  #    type: string
  #    sql: ${TABLE}.phase_desc

  #  - dimension: phase_id
  #    type: number
  #    sql: ${TABLE}.phase_id

 measure: max_posting_date {
    type: date
    label: "Max Posting Date"
    description: "Maximum Posting Date for a group of challenges. Useful to determine when the latest challenge was posted"
    drill_fields: [detail*]
    sql: MAX(${TABLE}.posting_date) ;;
  }

  measure: min_posting_date {
    type: date
    label: "Min Posting Date"
    description: "Minumum Posting Date for a group of challenges. Useful to determine when the first challenge was posted"
    drill_fields: [detail*]
    sql: MIN(${TABLE}.posting_date) ;;
  }

  measure: max_complete_date {
    type: date
    label: "Max Complete Date"
    description: "Maximum Completion Date for a group of challenges. Useful to determine when the latest challenge was completed"
    drill_fields: [detail*]
    sql: MAX(${TABLE}.complete_date) ;;

 }

  measure: actual_project_duration{
    type: number
    label: "Actual Project Duration"
    description: "Project duration based on the time between the start of the first challenge and end of the last challenge."
    drill_fields: [detail*]
    sql:  ${max_complete_date} - ${min_posting_date} ;;

  }

  dimension_group: posting {
    description: "Start of registration. If challenge is draft, then uses scheduled start date."
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      day_of_week,
      day_of_month,
      hour_of_day,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.posting_date ;;
  }

  dimension: challenge_category_id {
    type: number
    hidden: yes
    sql: ${TABLE}.project_category_id ;;
  }

  dimension: challenge_category_name {
    type: string
    label: "Project Category Name"
    description: "Type of Challenge - Design, Code, Bug Hunt, F2F etc..."
    sql: ${TABLE}.project_category_name ;;
  }

  dimension: track {
    type: string
    label: "Legacy Track"
    description: "Original Challenge Track - Design, Develop or Data Science. (Use Track field to better classify the Challenge in DS and QA )"
    group_label: "Deprecated"
    sql: CASE
                   WHEN ${TABLE}.project_category_name = 'First2Finish ' THEN 'Develop'
                   WHEN ${TABLE}.project_category_name = 'Code' THEN 'Develop'
                   WHEN ${TABLE}.project_category_name = 'Assembly Competition' THEN 'Develop'
                   WHEN ${TABLE}.project_category_name = 'UI Prototype Competition' THEN 'Develop'
                   WHEN ${TABLE}.project_category_name = 'Web Design' THEN 'Design'
                   WHEN ${TABLE}.project_category_name = 'Widget or Mobile Screen Design' THEN 'Design'
                   WHEN ${TABLE}.project_category_name = 'Design First2Finish' THEN 'Design'
                   WHEN ${TABLE}.project_category_name = 'Wireframes' THEN 'Design'
                   WHEN ${TABLE}.project_category_name = 'Architecture' THEN 'Develop'
                   WHEN ${TABLE}.project_category_name = 'Print/Presentation' THEN 'Design'
                   WHEN ${TABLE}.project_category_name = 'Copilot Posting' THEN 'Develop'
                   WHEN ${TABLE}.project_category_name = 'Idea Generation' THEN 'Design'
                   WHEN ${TABLE}.project_category_name = 'Logo Design' THEN 'Design'
                   WHEN ${TABLE}.project_category_name = 'Application Front-End Design' THEN 'Design'
                   WHEN ${TABLE}.project_category_name = 'Banners/Icons' THEN 'Design'
                   WHEN ${TABLE}.project_category_name = 'Test Scenarios' THEN 'Develop'
                   WHEN ${TABLE}.project_category_name = 'Content Creation' THEN 'Develop'
                   WHEN ${TABLE}.project_category_name = 'Test Suites' THEN 'Develop'
                   WHEN ${TABLE}.project_category_name = 'Specification' THEN 'Develop'
                   WHEN ${TABLE}.project_category_name = 'Marathon Match' THEN 'Data Science'
                   WHEN ${TABLE}.project_category_name = 'Conceptualization' THEN 'Develop'
                   WHEN ${TABLE}.project_category_name = 'Studio Other' THEN 'Design'
                   WHEN ${TABLE}.project_category_name = 'Design' THEN 'Develop'
                   WHEN ${TABLE}.project_category_name = 'Development' THEN 'Develop'
                   WHEN ${TABLE}.project_category_name = 'Bug Hunt' THEN 'Develop'
                   ELSE 'Other'
            END ;;
  }

  dimension: new_track {
    type: string
    label: "Track"
    description: "Challenge Track - Design, Develop, Data Science or QA"
    sql: CASE

                    WHEN ((${TABLE}.project_category_name = 'Marathon Match') or (${TABLE}.technology_list like '%Data Science%'))  THEN 'Data Science'
                    WHEN ((${TABLE}.project_category_name = 'Test Scenarios') or (${TABLE}.project_category_name = 'Test Suites') or
                         (${TABLE}.project_category_name = 'Bug Hunt') or (${TABLE}.project_category_name = 'Testing Competition') or
                         (${TABLE}.technology_list like '%QA%')) THEN 'QA'
                    WHEN ((${TABLE}.project_category_name = 'First2Finish') or (${TABLE}.project_category_name = 'Code') or
                         (${TABLE}.project_category_name = 'Assembly Competition') or (${TABLE}.project_category_name = 'UI Prototype Competition') or
                         (${TABLE}.project_category_name = 'Architecture') or (${TABLE}.project_category_name = 'Copilot Posting') or
                         (${TABLE}.project_category_name = 'Specification') or (${TABLE}.project_category_name = 'Conceptualization') or
                         (${TABLE}.project_category_name = 'Development') or (${TABLE}.project_category_name = 'Content Creation') or
                         (${TABLE}.project_category_name = 'Design')) THEN 'Develop'
                    WHEN ((${TABLE}.project_category_name = 'Web Design') or (${TABLE}.project_category_name = 'Widget or Mobile Screen Design') or
                         (${TABLE}.project_category_name = 'Design First2Finish') or (${TABLE}.project_category_name = 'Wireframes') or
                         (${TABLE}.project_category_name = 'Print/Presentation') or (${TABLE}.project_category_name = 'Idea Generation') or
                         (${TABLE}.project_category_name = 'Logo Design') or (${TABLE}.project_category_name = 'Application Front-End Design') or
                         (${TABLE}.project_category_name = 'Banners/Icons') or (${TABLE}.project_category_name = 'Studio Other')) THEN 'Design'
                    ELSE 'Other'
              END ;;
  }

  # ------------------------------------Challenge IDs ------------------------------- #
  dimension: challenge_id {
    type: number
    description: "Challenge unique numeric legacy identifier"
    sql: ${TABLE}.project_id ;;
    link: {
      label: "Challenge Link"
      url: "https://www.topcoder.com/challenges/{{ challenge.project_id._value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
  }

  dimension: project_id {
    primary_key: yes
    type: number
    # hidden: true
    description: "Challenge ID Alias"
    sql: ${TABLE}.project_id ;;
    link: {
      label: "Challenge Link"
      url: "https://www.topcoder.com/challenges/{{ challenge.project_id._value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
  }

  dimension: challenge_GUID
  {
    label: "Challenge GUID"
    type: string
    description: "Challenge 36 character globally unique idenitifier appears in the URL"
    sql: ${TABLE}.challenge_guid ;;
    link: {
      label: "Community Challenge Link"
      url: "https://www.topcoder.com/challenges/{{challenge.challenge_GUID._value}}"
      icon_url: "https://looker.com/favicon.ico"
    }
    link: {
      label: "Work Manager Link"
      url: "https://challenges.topcoder.com/challenges/{{challenge.challenge_GUID._value}}"
      icon_url: "https://topcoder.com/favicon.ico"
    }
  }

  #-----------------------------------------------------------------------------#

  dimension_group: rating {
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

  dimension_group: registration_end {
    type: time
    description: "Last date for inviting entries for a particular challenge"
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
    description: "Date on which the challenge is scheduled to end"
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
    sql: ${TABLE}.scheduled_end_date ;;
  }

 #added on 10th July 2019

  dimension_group: create {
    type: time
    description: "Date on which the challenge is created"
    timeframes: [
      time,
      date,
      week,
      month,
      month_name,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.create_date ;;
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
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: NVL(${TABLE}.complete_date, ${TABLE}.scheduled_end_date) ;;
  }

  dimension: stage_id {
    type: number
    sql: ${TABLE}.stage_id ;;
  }

  dimension: status_desc {
    type: string
    description: "Challenge Status like Draft, Cancelled - Client Request, Cancelled - Zero submissions etc..."
    drill_fields: [detail*]
    sql: ${TABLE}.status_desc ;;
  }

  dimension: status_buckets {
  type: string
  description: "Challenge status categorised into buckets like Draft, Cancelled, Active etc..."
  sql: CASE
  WHEN ${TABLE}.status_desc like 'Cancelled%' THEN 'Cancelled'
  WHEN ${TABLE}.status_desc = 'Completed' THEN 'Completed'
  WHEN ${TABLE}.status_desc = 'Active' THEN 'Active'
  WHEN ${TABLE}.status_desc = 'Draft' THEN 'Draft'
  ELSE null END;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}.status_id ;;
  }

  dimension: submission_viewable {
    type: number
    description: "indicated whether community member has made the submission on challenge or not"
    sql: ${TABLE}.submission_viewable ;;
  }

  dimension_group: submitby {
    type: time
    description: "Last date by which submissions will be closed"
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      day_of_week,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.submitby_date ;;
  }

  dimension: suspended_ind {
    type: number
    description: "Indicates whether a challenge has been suspended or not"
    sql: ${TABLE}.suspended_ind ;;
  }

  dimension: tc_direct_project_id {
    type: number
    description: "Direct Project (unique identifier) to which the challenge is linked to; a project can have multiple challenges "
    sql: ${TABLE}.tc_direct_project_id ;;
    link: {
      label: "Direct Project Link"
      url: "https://www.topcoder.com/direct/projectOverview.action?formData.projectId={{ challenge.tc_direct_project_id._value }}"
      icon_url: "https://looker.com/favicon.ico"
    }

  }

  measure: total_prize {
    type: sum
    description: "Total Prize money on the challenge"
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
    description: "First Place prize winner unique identifier for a particular challenge"
    sql: ${TABLE}.winner_id ;;
  }

  dimension: technology_list {
    type: string
    description: "A comma separated list of technolgies used in the challenge. More details are available in Challenge Technology view"
    sql: ${TABLE}.technology_list;;
  }

  dimension: challenge_fee_percent {
    type: number
    description: "Challenge Fee %"
    value_format: "0.00%"
    sql:  ${TABLE}.challenge_fee_percentage ;;
  }

  measure: review_process_duration {
    type: sum
    description: "Time taken by reviewer to review the submissions"
    sql: (${complete_date} - ${submitby_date}) ;;
  }


  measure: count {
    type: count
    description: "Total no of challenges"
    drill_fields: [detail*]
  }

 measure: count_launched {
    type: sum
    description: "Total no. of challenges launched (active)"
    sql: CASE
  WHEN ${TABLE}.status_desc = 'Completed' OR ${TABLE}.status_desc = 'Active'
  THEN 1
  ELSE 0 END ;;
  }

  measure: count_draft {
    type: sum
    description: "Total no. of challenges in draft"
    sql: CASE
        WHEN ${TABLE}.status_desc = 'Draft'
        THEN 1
        ELSE 0 END ;;
  }

  measure: count_scheduled {
    type: sum
    description: "Total no. of challenges launched with posting date in future"
    sql: CASE
        WHEN ${TABLE}.status_desc = 'Active' AND ${TABLE}.posting_date>getdate()
        THEN 1
        ELSE 0 END ;;
  }

  measure: estimated_member_payments {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    drill_fields: [detail*]
    sql: ${TABLE}.estimated_copilot_cost + ${TABLE}.estimated_reliability_cost + ${TABLE}.estimated_review_cost + ${TABLE}.total_prize ;;
  }

  measure: actual_total_prize {
    type: sum
    description: "Total prize money given"
    value_format: "$#,##0.00;($#,##0.00)"
    drill_fields: [detail*]
    sql: ${TABLE}.actual_total_prize ;;
  }

  measure: min_actual_total_prize {
    type: min
    value_format: "$#,##0.00;($#,##0.00)"
    description: "Minimum Actual prize for a challenge"
    drill_fields: [detail*]
    sql: ${TABLE}.actual_total_prize ;;
  }

  measure: max_actual_total_prize {
    type: max
    value_format: "$#,##0.00;($#,##0.00)"
    description: "Maximum Actual prize for a challenge"
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

  measure: average_total_prize {
    type: average
    value_format: "$#,##0.00;($#,##0.00)"
    drill_fields: [detail*]
    sql: ${TABLE}.total_prize ;;
  }

  measure: max_total_prize {
    type: max
    value_format: "$#,##0.00;($#,##0.00)"
    drill_fields: [detail*]
    sql: ${TABLE}.total_prize ;;
  }

  measure: min_total_prize {
    type: min
    value_format: "$#,##0.00;($#,##0.00)"
    drill_fields: [detail*]
    sql: ${TABLE}.total_prize ;;
  }

  dimension: Is_zero_total_prize {
  type: string
  description: "Indicates whether the prize money on the challenge is zero or not"
    sql: CASE WHEN ${TABLE}.total_prize = 0 THEN 'Yes'
              ELSE 'No'
         END ;;
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
    description: "Cost incurred for reviewer"
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
    drill_fields: [detail*]
    sql: ${num_submissions}/ NULLIF(${count},0) ;;
  }

  measure: average_registrants {
    type: number
    value_format: "#,##0.0"
    drill_fields: [detail*]
    sql: ${num_registrations}/ NULLIF(${count}, 0) ;;
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      project_id,
      challenge_name,
      track,
      challenge_category_name,
      total_prize,
      actual_total_prize,
      projected_end_date,
      posting_date,
      contest_prizes_total,
      status_desc,
      task_ind

    ]
  }
}
