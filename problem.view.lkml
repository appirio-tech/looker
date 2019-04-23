view: problem {
  sql_table_name: tcs_dw.problem ;;

  dimension: problem_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.problem_id ;;

    link: {
      label: "Visit Problem In TC Website"
       url: "https://community.topcoder.com/stat?c=problem_statement&pm={{ problem.problem_id._value }}&rd={{ problem.round_id._value }}&random=1"
      icon_url: "https://looker.com/favicon.ico"
    }
  }

  dimension: class_name {
    type: string
    sql: ${TABLE}.class_name ;;
  }

  dimension: data_type_desc {
    type: string
    sql: ${TABLE}.data_type_desc ;;
  }

  dimension: default_solution {
    type: string
    sql: ${TABLE}.default_solution ;;
  }

  dimension: division_id {
    type: number
    sql: ${TABLE}.division_id ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: language_id {
    type: number
    sql: ${TABLE}.language_id ;;
  }

  dimension: level_desc {
    type: string
    sql: ${TABLE}.level_desc ;;
  }

  dimension: level_id {
    type: number
    sql: ${TABLE}.level_id ;;
  }

  dimension: method_name {
    type: string
    sql: ${TABLE}.method_name ;;
  }

  dimension_group: modify {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.modify_date ;;
  }

  measure: points {
    type: number
    sql: ${TABLE}.points ;;
  }

  dimension: problem_text {
    type: string
    sql: ${TABLE}.problem_text ;;
  }

  dimension: result_type_desc {
    type: string
    sql: ${TABLE}.result_type_desc ;;
  }

  dimension: result_type_id {
    type: number
    sql: ${TABLE}.result_type_id ;;
  }

  dimension: round_id {
    type: number
    sql: ${TABLE}.round_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}.status_id ;;
  }

  dimension: viewable {
    type: number
    sql: ${TABLE}.viewable ;;
  }

  measure: count {
    type: count
    drill_fields: [problem_id, class_name, method_name]
  }
}
