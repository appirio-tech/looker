view: hiring_stage {

  sql_table_name: tcs_dw.recruit_crm_hiring_stage ;;

  dimension: candidate_slug {
    type: number
    sql: ${TABLE}.candidate_slug ;;
  }

  dimension: job_slug {
    type: number
    sql: ${TABLE}.job_slug ;;
  }

  dimension: remark {
    type: string
    sql: ${TABLE}.remark ;;
  }

  dimension: job_candidate {
    primary_key: yes
    sql:CONCAT(${TABLE}.candidate_slug, ${TABLE}.job_slug) ;;
  }

  dimension_group: stage {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.stage_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [candidate_slug,job_slug,stage_date,status]
  }

}
