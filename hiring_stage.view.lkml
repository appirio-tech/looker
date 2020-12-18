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

  dimension: status_sorted {
    label: "Status (Custom Sort)"
    case: {
      when: {
        sql: ${status} = 'Applied' ;;
        label: "Applied"
      }
      when: {
        sql: ${status} = 'Reviewed' ;;
        label: "Reviewed"
      }
      when: {
        sql: ${status} = 'Low Experience - Go Compete' ;;
        label: "Low Experience - Go Compete"
      }
      when: {
        sql: ${status} = 'Wipro - No TaaS' ;;
        label: "Wipro - No TaaS"
      }
      when: {
        sql: ${status} = 'Rejected - Topcoder Rejected' ;;
        label: "Rejected - Topcoder Rejected"
      }
      when: {
        sql: ${status} = 'Ops Check Pass' ;;
        label: "Ops Check Pass"
      }
      when: {
        sql: ${status} = 'Resume Handoff to Client' ;;
        label: "Resume Handoff to Client"
      }
      when: {
        sql: ${status} = 'Schedule Interview' ;;
        label: "Schedule Interview"
      }
      when: {
        sql: ${status} = 'Interview Scheduled' ;;
        label: "Interview Scheduled"
      }
      when: {
        sql: ${status} = 'Interview not Attended' ;;
        label: "Interview not Attended"
      }
      when: {
        sql: ${status} = 'Client Rejected - Screening' ;;
        label: "Client Rejected - Screening"
      }
      when: {
        sql: ${status} = 'Client Rejected - Interview' ;;
        label: "Client Rejected - Interview"
      }
      when: {
        sql: ${status} = 'Client Rejected - Interview No Show' ;;
        label: "Client Rejected - Interview No Show"
      }
      when: {
        sql: ${status} = 'Client Closed Opportunity' ;;
        label: "Client Closed Opportunity"
      }
      when: {
        sql: ${status} = 'Selected' ;;
        label: "Selected"
      }
      when: {
        sql: ${status} = 'Offered' ;;
        label: "Offered"
      }
      when: {
        sql: ${status} = 'Offered - Did Not Join' ;;
        label: "Offered - Did Not Join"
      }
      when: {
        sql: ${status} = 'Placed' ;;
        label: "Placed"
      }
    }
  }

  dimension: status_buckets {
    alpha_sort: no
    case: {
      when: {
        sql: ${status} in ('Applied', 'Reviewed', 'Ops Check Pass', 'Resume Handoff to Client', 'Schedule Interview', 'Interview Scheduled', 'Interview not Attended', 'Client Closed Opportunity' ) ;;
        label: "Applied"
      }
      when: {
        sql: ${status} in ('Selected', 'Offered', 'Offered - Did Not Join') ;;
        label: "Assigned"
      }
      when: {
        sql: ${status} in ('Placed') ;;
        label: "Placed"
      }
      when: {
        sql: ${status} in ('Low Experience - Go Compete', 'Wipro - No TaaS', 'Rejected - Topcoder Rejected', 'Client Rejected - Screening', 'Client Rejected - Interview', 'Client Rejected - Interview No Show'  ) ;;
        label: "Rejected"
      }
      else:"Unknown"
    }
  }

  measure: count {
    type: count
    drill_fields: [candidate_slug,job_slug,stage_date,status]
  }

  measure: count_applied {
    type: sum
    sql: CASE WHEN (hiring_stage.status IN ('Applied', 'Reviewed', 'Ops Check Pass', 'Resume Handoff to Client', 'Schedule Interview', 'Interview Scheduled', 'Interview not Attended', 'Client Closed Opportunity')) THEN 1  ELSE 0 END ;;
  }

  measure: count_assigned {
    type: sum
    sql: CASE WHEN (hiring_stage.status IN ('Selected', 'Offered', 'Offered - Did Not Join')) THEN 1  ELSE 0 END ;;
  }

  measure: count_placed {
    type: sum
    sql: CASE WHEN (hiring_stage.status = 'Placed') THEN 1  ELSE 0 END ;;
  }

  measure: count_rejected {
    type: sum
    sql: CASE WHEN (hiring_stage.status IN ('Low Experience - Go Compete', 'Wipro - No TaaS', 'Rejected - Topcoder Rejected', 'Client Rejected - Screening', 'Client Rejected - Interview', 'Client Rejected - Interview No Show')) THEN 1  ELSE 0 END ;;
  }

}
