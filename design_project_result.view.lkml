view: design_project_result {
  sql_table_name: tcs_dw.design_project_result ;;

  dimension: client_selection {
    type: number
    sql: ${TABLE}.client_selection ;;
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

  dimension: is_checkpoint {
    type: number
    sql: ${TABLE}.is_checkpoint ;;
  }

  dimension: placement {
    type: number
    sql: ${TABLE}.placement ;;
  }

  dimension: prize_id {
    type: number
    sql: ${TABLE}.prize_id ;;
  }

  dimension: project_id {
    type: number
    # hidden: true
    sql: ${TABLE}.project_id ;;
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

  dimension: submission_id {
    type: number
    sql: ${TABLE}.submission_id ;;
  }

  dimension: submit_ind {
    type: number
    sql: ${TABLE}.submit_ind ;;
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

  dimension: upload_id {
    type: number
    sql: ${TABLE}.upload_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: valid_submission_ind {
    type: number
    sql: ${TABLE}.valid_submission_ind ;;
  }

  dimension: total_placements {
    type: number
    sql: ${TABLE}.total_placements ;;
    description: "Number of members who have received a prize"
  }

  measure: count {
    type: count
    drill_fields: [project.component_name, project.review_phase_name, project.project_category_name, project.client_project_id]
  }

  measure: dr_points {
    type: sum
    sql: ${TABLE}.dr_points ;;
  }

  measure: prize_amount {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.prize_amount ;;
  }

  measure: count_distinct_user {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }

  measure: count_challenges {
    type: number
    sql: COUNT(${project_id}) ;;
  }

  measure: count_register_no_submission {
    type: number
    sql: COUNT(CASE WHEN ${submit_ind} = 0
          THEN 1
          ELSE NULL
          END)
          ;;

    }
  measure: count_valid_submissions {
    type: number
    sql: SUM(${valid_submission_ind}) ;;
  }

  measure: count_valid_checkpoint_submissions {
    type: number
    sql: COUNT(CASE WHEN (${valid_submission_ind} = 1 AND ${is_checkpoint} = 1)
    THEN 1
    ELSE NULL
    END)
    ;;

  }

  measure: count_failed_submissions {
    type: number
    sql: COUNT(CASE WHEN ${valid_submission_ind} = 0
      THEN 1
      ELSE NULL
      END)
       ;;
  }

  measure: count_failed_checkpoint_submissions {
    type: number
    sql: COUNT(CASE WHEN (${valid_submission_ind} = 0 AND ${is_checkpoint} = 1)
      THEN 1
      ELSE NULL
      END)
       ;;
  }

  measure: count_first_place_wins {
    type: number
    sql: COUNT(CASE WHEN ${placement} = 1
      THEN 1
      ELSE NULL
      END)
       ;;
  }

  measure: count_second_place_wins {
    type: number
    sql: COUNT(CASE WHEN ${placement} = 2
      THEN 1
      ELSE NULL
      END)
       ;;
  }

  measure: count_third_place_wins {
    type: number
    sql: COUNT(CASE WHEN ${placement} = 3
      THEN 1
      ELSE NULL
      END)
       ;;
  }

  measure: count_fourth_place_wins {
    type: number
    sql: COUNT(CASE WHEN ${placement} = 4
      THEN 1
      ELSE NULL
      END)
       ;;
  }

  measure: count_fifth_place_wins {
    type: number
    sql: COUNT(CASE WHEN ${placement} = 5
      THEN 1
      ELSE NULL
      END)
       ;;
  }

  measure: count_sixth_place_wins {
    type: number
    sql: COUNT(CASE WHEN ${placement} = 6
      THEN 1
      ELSE NULL
      END)
       ;;
  }

  measure: count_seventh_place_wins {
    type: number
    sql: COUNT(CASE WHEN ${placement} = 7
      THEN 1
      ELSE NULL
      END)
       ;;
  }

  measure: count_eigth_place_wins {
    type: number
    sql: COUNT(CASE WHEN ${placement} = 8
      THEN 1
      ELSE NULL
      END)
       ;;
  }

  measure: count_ninth_place_wins {
    type: number
    sql: COUNT(CASE WHEN ${placement} = 9
      THEN 1
      ELSE NULL
      END)
       ;;
  }

  measure: count_tenth_place_wins {
    type: number
    sql: COUNT(CASE WHEN ${placement} = 10
      THEN 1
      ELSE NULL
      END)
       ;;
  }

  measure: count_checkpoint_submissions {
    type: number
    sql: COUNT(CASE WHEN ${is_checkpoint} = 1
      THEN 1
      ELSE NULL
      END)
       ;;
  }
}
