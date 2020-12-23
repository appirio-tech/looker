view: gig_skills_requested {
  derived_table: {
    sql: SELECT
              row_number() OVER(order by 1) AS skill_tag_id
              , recruit_crm_job.id as job_id
              , split_part(recruit_crm_job.technologies_required, ',', calendar.calendar_id) AS skill_name
            FROM recruit_crm_job JOIN calendar
              ON calendar.calendar_id <= regexp_count(recruit_crm_job.technologies_required, ',') + 1 ;;
    }

   dimension: skill_tag_id {
     primary_key: yes
     description: "Unique Generated ID for each skill that is parsed from the gig request"
     type: number
     sql: ${TABLE}.skill_tag_id ;;
   }

  dimension: job_id {
    description: "Recruitcrm Job ID"
    type: number
    sql: ${TABLE}.job_id ;;
  }

  dimension: skill_name {
    description: "Name of the skill that is parsed from the gig request"
    type: number
    sql: ${TABLE}.skill_name ;;
  }

  measure: count {
    type: count
  }

}
