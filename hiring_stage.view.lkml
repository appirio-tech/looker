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

  dimension: status_buckets {
    alpha_sort: no
    case: {
      when: {
        sql: ${status} in ('Client Rejected - Interview') ;;
        label: "Proposed"
      }
      else:"Applied"
    }
  }

  measure: count {
    type: count
    drill_fields: [candidate_slug,job_slug,stage_date,status]
  }

  measure: count_placed {
    type: sum
    sql: CASE WHEN (hiring_stage.status = 'Placed') THEN 1  ELSE 0 END ;;
  }

  measure: count_applied {
    type: sum
    sql: CASE WHEN (hiring_stage.status = 'Applied') THEN 1  ELSE 0 END ;;
  }

  measure: count_assigned {
    type: sum
    sql: CASE WHEN (hiring_stage.status = 'Assigned') THEN 1  ELSE 0 END ;;
  }

  measure: count_ops_rejected {
    type: sum
    sql: CASE WHEN (hiring_stage.status = 'Rejected- Ops Rejected') THEN 1  ELSE 0 END ;;
  }

}
