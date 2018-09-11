view: connect_project_1 {
  sql_table_name: public.projects ;;

  dimension: directprojectid {
    primary_key: yes
    type: number
    sql: ${TABLE}.directprojectid ;;
  }

  measure: actualprice {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.actualprice ;;
  }

  dimension: billingaccountid {
    type: number
    value_format_name: id
    sql: ${TABLE}.billingaccountid ;;
  }

  dimension: bookmarks {
    type: string
    sql: ${TABLE}.bookmarks ;;
  }

  dimension: challengeeligibility {
    type: string
    sql: ${TABLE}.challengeeligibility ;;
  }

  dimension_group: createdat {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.createdat ;;
  }

  dimension: createdby {
    type: number
    sql: ${TABLE}.createdby ;;
  }

  dimension_group: deletedat {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.deletedat ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: details {
    type: string
    sql: ${TABLE}.details ;;
  }

#Added on 7/18 for connect project
#  dimension: refcode {
#    label: "Ref Code"
#    description: "Promo code applied to project"
#    sql: json_extract_path_text(${TABLE}.details, 'utm', 'code') ;;

#  }

#Added on 7/18 for connect project
  dimension: cancelReason {
    label: "Cancel Reason"
    description: "The reason for project cancellation"
    type: string
    sql: ${TABLE}.cancelReason ;;
  }

  measure: estimatedprice {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.estimatedprice ;;
  }

  dimension: external {
    type: string
    sql: ${TABLE}.external ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    link: {
      label: "project_url"
      url: "https://connect.topcoder.com/projects/{{ value }}"
      icon_url: "https://www.topcoder.com/wp-content/media/2017/03/Topcoder-Connect-Logo.png"
    }
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: raw_status {
    type: string
    sql: ${TABLE}.status;;
  }

  dimension: status {
    case: {
      when: {
        sql: ${TABLE}.status = 'draft' ;;
        label: "1: Draft"
      }
      when: {
        sql: ${TABLE}.status = 'in_review' ;;
        label: "2: In Review"
      }
      when: {
        sql: ${TABLE}.status = 'reviewed' ;;
        label: "3: Reviewed"
      }
      when: {
        sql: ${TABLE}.status = 'active' ;;
        label: "4: Active"
      }
      when: {
        sql: ${TABLE}.status = 'completed' ;;
        label: "5: Completed"
      }
      when: {
        sql: ${TABLE}.status = 'cancelled' ;;
        label: "6: Cancelled"
      }
      when: {
        sql: ${TABLE}.status = 'paused' ;;
        label: "7: Paused"
      }
      else: "8: Unknown"
    }
  }

    dimension: type {
      type: string
      sql: ${TABLE}.type ;;
    }

  dimension_group: updatedat {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updatedat ;;
  }

  dimension: updatedby {
    type: number
    sql: ${TABLE}.updatedby ;;
  }

  dimension: utm {
    type: string
    sql: ${TABLE}.utm ;;
  }

  dimension: onsite_efforts {
    type: number
    description: "Used by Topgear team, Onsite hours allocated to the project"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'onsite_efforts') ;;
  }

  dimension: offshore_efforts {
    type: number
    description: "Used by Topgear team, Offshore hours allocated to the project"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'offshore_efforts') ;;
  }


  dimension: wbs_code {
    type: string
    description: "Used by Topgear team, WBS code of the project"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'wbs_code') ;;
  }

  dimension: cost_center {
    type: string
    description: "Used by Topgear team, cost center allocated to the project"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'cost_center') ;;
  }

  dimension: project_code {
    type: string
    description: "Used by Topgear team, Unique identifier of the project"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'project_code') ;;
  }

  dimension: group_customer_name {
    type: string
    description: "Used by Topgear team, Customer group name to which project belongs"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'group_customer_name') ;;
  }

  dimension: du {
    type: string
    description: "Used by Topgear team, Division unit of the project"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'du') ;;
  }

  dimension: customer_project {
    type: string
    description: "Used by Topgear team, Customer name of the project"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'customer_project') ;;
  }

  dimension: part_of_ng3 {
    type: string
    description: "Used by Topgear team"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'part_of_ng3') ;;
  }

  dimension_group: planned_end_date_1 {
    type: time
    hidden: yes
    description: "Used by Topgear team, planned end date for a project"
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql:DATEADD(second,CAST(json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'planned_end_date') AS BigInt),
      '1970-01-01 00:00:00');;
  }

  dimension_group: planned_start_date_1 {
    type: time
    hidden: yes
    description: "Used by Topgear team, planned start date for a project"
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql:CASE WHEN ${TABLE}.planned_start_date = ' ' THEN '1970-01-01' ELSE DATEADD(second,CAST(json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'planned_start_date') AS BigInt),
      '1970-01-01 00:00:00') END;;
  }

  dimension: planned_start_date_test {
    type: string
    hidden: yes
    description: "Used by Topgear team, planned start date for a project"
    sql:CASE WHEN (json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'planned_start_date')) = ' '
        THEN '1970-01-01 00:00:00'
           ELSE DATEADD(second,CAST(json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'planned_start_date') AS BigInt),
          '1970-01-01 00:00:00') END;;
  }

  dimension: planned_start_date {
    type: string
    description: "Used by Topgear team, planned start date for a project"
    sql:json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'planned_start_date');;
  }


  dimension: planned_end_date {
    type: string
    description: "Used by Topgear team, planned end date for a project"
    sql:json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'planned_end_date');;
  }

  dimension: product {
    type: string
    sql: json_extract_array_element_text(json_extract_path_text((regexp_replace(${TABLE}.details,'\\\\.','')), 'products'), 0) ;;
  }

  dimension: notes {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'appDefinition', 'notes') ;;
    }

  dimension: primary_target {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'appDefinition', 'primaryTarget') ;;
  }

  dimension: budget {
    type: number
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'appDefinition', 'budget') ;;
  }

  measure: count {
    type: count
    drill_fields: [directprojectid, id, name, project_members.count]
  }

  measure: submitted_count {
    type: count
    description: "Count of submitted projects. Includes in_review, reviewed, active, completed, cancelled, paused."
    filters: {
      field: raw_status
      value: "in_review, reviewed, active, completed, cancelled, paused"
    }
  }

  measure: activated_count {
    type: count
    description: "Count of activated projects. Includes active and completed."
    filters: {
      field: raw_status
      value: "active, completed"
    }
  }

  measure: submitted_percentage {
    type: number
    value_format_name: percent_0
    description: "Projects submitted as a percent of created projects."
    sql: 1.0 * ${submitted_count} / NULLIF(${count}, 0);;
  }

  measure: activated_percentage {
  type: number
  value_format_name: percent_0
  description: "Projects activated as a percent of submitted projects."
  sql: 1.0 * ${activated_count} / NULLIF(${submitted_count}, 0)  ;;
  }

}
