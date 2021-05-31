view: connect_project {
  sql_table_name: public.projects ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    link: {
      label: "project_url"
      url: "https://connect.topcoder.com/projects/{{ value }}"
      icon_url: "https://www.topcoder.com/wp-content/media/2017/03/Topcoder-Connect-Logo.png"
    }
  }

  measure: actual_price {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.actualprice ;;
  }

  dimension: billing_account_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.billingaccountid ;;
  }

  dimension: is_deleted {
    description: "If the project has been deleted from the Db"
    type: yesno
    sql: NVL2(${TABLE}.deletedat, true, false) ;;
  }

  dimension: bookmarks {
    type: string
    sql: ${TABLE}.bookmarks ;;
  }

  dimension: cancelReason {
    label: "Cancel Reason"
    description: "The reason for project cancellation"
    type: string
    sql: ${TABLE}.cancelReason ;;
  }

  dimension: challenge_eligibility {
    type: string
    sql: ${TABLE}.challengeeligibility ;;
  }

  dimension_group: created_at {
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
    sql: ${TABLE}.createdat ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}.createdby ;;
  }

  dimension_group: deleted_at {
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

  dimension: direct_project_id {
    type: number
    sql: ${TABLE}.directprojectid ;;
  }

  measure: estimated_price {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.estimatedprice ;;
  }

  dimension: external {
    type: string
    sql: ${TABLE}.external ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: offshore_efforts {
    type: sum
    description: "Used by Topgear team, Offshore hours allocated to the project"
    sql: ${TABLE}.offshore_efforts ;;
    group_label: "Topgear"
  }

  measure: onsite_efforts {
    type: sum
    description: "Used by Topgear team, Onsite hours allocated to the project"
    sql: ${TABLE}.onsite_efforts ;;
    group_label: "Topgear"
  }

  dimension_group: planned_end {
    type: time
    description: "Used by Topgear team, planned end date for a project"
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
    sql: ${TABLE}.planned_end_date ;;
  }

  dimension_group: planned_start {
    type: time
    description: "Used by Topgear team, planned start date for a project"
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
    sql: ${TABLE}.planned_start_date ;;
  }

  dimension: project_full_text {
    type: string
    sql: ${TABLE}.projectfulltext ;;
  }

  dimension: raw_status {
    type: string
    sql: ${TABLE}.status ;;
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

  dimension: template_category {
    type: string
    sql: ${TABLE}.template_category ;;
  }

  dimension: template_id {
    type: number
    sql: ${TABLE}.template_id ;;
  }

  dimension: template_name {
    type: string
    sql: ${TABLE}.template_name ;;
  }

  dimension: terms {
    type: string
    sql: ${TABLE}.terms ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updated_at {
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
    sql: ${TABLE}.updatedat ;;
  }

  dimension: updated_by {
    type: number
    sql: ${TABLE}.updatedby ;;
  }

  dimension: utm {
    type: string
    sql: ${TABLE}.utm ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }



  dimension: business_unit {
    type: string
    description: "Kubik Business Unit Code"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'businessUnit') ;;
  }
  dimension: kubik_cost_center {
    type: string
    description: "Cost Center for Kubik Projects only"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'costCentre') ;;
  }

  dimension: ref_code {
    type: string
    description: "Marketing Reference Code"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'utm', 'code') ;;
  }

  #-----------------------------------Topgear specific fields------------------------

  dimension: wbs_code {
    type: string
    description: "Used by Topgear team, WBS code of the project"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'wbs_code') ;;
    group_label: "Topgear"
  }

  dimension: cost_center {
    type: string
    description: "Used by Topgear team, cost center allocated to the project"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'cost_center') ;;
    group_label: "Topgear"
  }

  dimension: project_code {
    type: string
    description: "Used by Topgear team, Unique identifier of the project"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'project_code') ;;
    group_label: "Topgear"
  }

  dimension: practice {
    type: string
    description: "Used by Topgear team, Practice associated with the project"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'practice') ;;
    group_label: "Topgear"
  }

  dimension: sub_practice {
    type: string
    description: "Used by Topgear team, Sub Practice associated with the project"
    sql: replace(json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'sub_practice'),'&amp;','&') ;;
    group_label: "Topgear"
  }


  dimension: group_customer_name {
    type: string
    description: "Used by Topgear team, Customer group name to which project belongs"
    sql: replace(json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'group_customer_name'),'&amp;','&');;
    group_label: "Topgear"
  }

  dimension: du {
    type: string
    description: "Used by Topgear team, Division unit of the project"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'du') ;;
    group_label: "Topgear"
  }

  dimension: project_classification_code {
    type: string
    description: "Used by Topgear team, Project classification code of the project"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'project_classification_code') ;;
    group_label: "Topgear"
  }

  dimension: invoice_type {
    type: string
    description: "Used by Topgear team, Invoice type of the project"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'invoice_type') ;;
    group_label: "Topgear"
 }

  dimension: sow_number {
    type: number
    description: "Used by Topgear team, Sow number of the project"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'sow_number') ;;
    group_label: "Topgear"
  }

  dimension: customer_project {
    type: string
    description: "Used by Topgear team, Customer name of the project"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'customer_project') ;;
    group_label: "Topgear"
  }

  dimension: part_of_ng3 {
    type: string
    description: "Used by Topgear team"
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'part_of_ng3') ;;
    group_label: "Topgear"
  }

  dimension: sub_execution_hub {
    type: string
    description: "Used by Topgear team, Sub Execution Hub  of the project"
    sql: replace((json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'sub_execution_hub')),'&amp;','&') ;;
    group_label: "Topgear"
  }

  dimension: smu {
    type: string
    description: "Used by Topgear team, SMU of the project"
    sql: replace((json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'smu')),'&amp;','&') ;;
    group_label: "Topgear"
  }

  dimension: sector {
    type: string
    description: "Used by Topgear team, Sector  of the project"
    sql: replace((json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'sector')),'&amp;','&') ;;
    group_label: "Topgear"
  }

  dimension: execution_hub {
    type: string
    description: "Used by Topgear team, Execution Hub  of the project"
    sql: replace((json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'project_data', 'execution_hub')),'&amp;','&') ;;
    group_label: "Topgear"
  }

  #-------------------------------------- End -------------------------------------#

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

 dimension : users {
   type: string
   sql:  json_extract_array_element_text(json_extract_path_text((regexp_replace(${TABLE}.details,'\\\\.','')), 'users'), 0);;
 }

# added on 19th Aug DesignGoal , AppType and DesignType

 dimension: designType {
  description: "Progressive or Responsive"
   type :  string
  sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'appDefinition', 'progressiveResponsive') ;;
  group_label: "Scope"
 }

  dimension: AppType {
    description: "Hybrid or Native"
    type :  string
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'appDefinition', 'nativeHybrid') ;;
    group_label: "Scope"
  }

  dimension: designGoal {
    description: "Goal of the design"
    type :  string
    sql: json_extract_path_text((regexp_replace(connect_project.details,'\\\\.')), 'appDefinition', 'designGoal') ;;
    group_label: "Scope"
  }

# added on 20th Aug numberscreen , devicetype , ostype , deliverables

dimension: number_of_screen {
  type :  string
  sql: ${TABLE}.numberscreens ;;
  group_label: "Scope"
}

  dimension: device {
    type :  string
    sql: ${TABLE}.devicetype ;;
    group_label: "Scope"
  }

  dimension: operating_system {
    type: string
    sql: ${TABLE}.ostype ;;
    group_label: "Scope"
  }

  dimension: deliverables {
    type:  string
    sql: ${TABLE}.deliverables ;;
    group_label: "Scope"
  }

  dimension: objective {
    type: string
    description: "Purpose of creating the project"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'intakePurpose') ;;
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

  measure: count {
    type: count
    drill_fields: [direct_project_id, id, template_name, name, project_members.count]
  }
}
