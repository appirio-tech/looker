view: connect_form_reporting {
  sql_table_name: public.projects ;;

  dimension: background {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.background') ;;
    group_label: "Computer Vision"
  }

  dimension: data_type {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.dataVariety') ;;
    group_label: "Computer Vision"
  }

  dimension: data_technology {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.solutionAim') ;;
    group_label: "Computer Vision"
  }

  dimension: data_format {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.dataFormat') ;;
    group_label: "Computer Vision"
  }

  dimension: data_size {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.dataSize') ;;
    group_label: "Computer Vision"
 }

  dimension: images_count {
    type: number
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.imagesCount') ;;
    group_label: "Computer Vision"
  }

  dimension: patent_licenses {
    type: string
    label: "Patent/Licenses"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.hasDataRestrictions') ;;
    group_label: "Computer Vision"
  }

  dimension: expected_outcomes {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.expectedOutcomes') ;;
    group_label: "Computer Vision"
  }

  dimension: scoring_systems {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.scoringSystems') ;;
    group_label: "Computer Vision"
  }

  dimension: is_data_labled {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.isDataLabeled') ;;
    group_label: "Computer Vision"
  }

  dimension: labling_required {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.isDataLabelingRequired') ;;
    group_label: "Computer Vision"
  }

  dimension: need_production_preparation {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.productionPrepRequired') ;;
    group_label: "Computer Vision"
  }

  dimension: deliverables {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.deliverables') ;;
    group_label: "Data Visualization"
  }

  dimension: design_work {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.designWork') ;;
    group_label: "Data Visualization"
  }

  dimension: existing_platforms {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.existing.platforms') ;;
    group_label: "Data Visualization"
  }

  dimension: licensed_features {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.existing.licensedFeatures') ;;
    group_label: "Data Visualization"
  }

  dimension: visualization_platforms {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.existing.platformsRequired') ;;
    group_label: "Data Visualization"
  }

  dimension: target_devices {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.targetDevices') ;;
    group_label: "Data Visualization"
  }

  dimension: data_description {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.dataDetails') ;;
    group_label: "Data Visualization"
  }

  dimension: is_data_accessible {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.isDataRefreshedDaily') ;;
    group_label: "Data Visualization"
  }

  dimension: need_obfuscation {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.dataVizDefinition.needObfuscation') ;;
    group_label: "Data Visualization"
  }

  dimension: data_access {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.isDataAccessible') ;;
    group_label: "Data Visualization"
  }

  dimension: sample_data {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.sampleData') ;;
    group_label: "Data Visualization"
  }

  dimension: user_roles {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.userRoles') ;;
    group_label: "Data Visualization"
  }

  dimension: intended_usage {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.intendedDataUsage') ;;
    group_label: "Data Visualization"
  }

  dimension: data_usage {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.currentDataUsage') ;;
    group_label: "Data Visualization"
  }

  dimension: performance_indicators {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.performanceIndicators') ;;
    group_label: "Data Visualization"
  }

  dimension: success_indicators {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.successIndicators') ;;
    group_label: "Data Visualization"
  }

  dimension: problem_concept {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.problemStatement') ;;
    group_label: "Data Science Sprint"
  }

  dimension: project_goals {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.goals') ;;
    group_label: "Data Science Sprint"
  }

  dimension: problem_description {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.problemDesc') ;;
    group_label: "Data Science Sprint"
  }

  dimension: academic_papers {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.academicPapers') ;;
    group_label: "Data Science Sprint"
  }

  dimension: preferred_tech {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.preferredTech') ;;
    group_label: "Data Science Sprint"
  }

  dimension: preferred_technology {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.preferredTechnologies') ;;
    group_label: "Data Science Sprint"
  }

  dimension: technologies_required {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.selectedTechRequired') ;;
    group_label: "Data Science Sprint"
  }

  dimension: open_source {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.openSourceLibraries') ;;
    group_label: "Data Science Sprint"
  }

  dimension: outcome {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.outcome') ;;
    group_label: "Data Science Sprint"
  }

  dimension: data_available {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.dataAvailable') ;;
    group_label: "Data Science Sprint"
  }

  dimension: winning_criteria {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.criteria') ;;
    group_label: "Data Science Sprint"
  }

  dimension: problem_statement {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.problemStatement') ;;
    group_label: "Data Science Ideation"
  }

  dimension: project_output {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.output') ;;
    group_label: "Data Science Ideation"
  }

  dimension: prefer_tech {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.preferredTech') ;;
    group_label: "Data Science Ideation"
  }

  dimension: preferred_technoloy {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.preferredTechnologies') ;;
    group_label: "Data Science Ideation"
  }

  dimension: problem_background {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.backgroundDesc') ;;
    group_label: "Data Science Ideation"
  }

  dimension: academic_paper {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.academicPapers') ;;
    group_label: "Data Science Ideation"
  }

  dimension: new_ideas {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.solutionOptimizationApproach') ;;
    group_label: "Data Science Ideation"
  }

  dimension: data_availablity {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.dataAvailable') ;;
    group_label: "Data Science Ideation"
  }

  dimension: win_criteria {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.criteria') ;;
    group_label: "Data Science Ideation"
  }

  dimension: data_science_units {
    type: number
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'budgetDetails.dataScience.qty') ;;
    group_label: "Buy Budget Capacity"
  }

  dimension: development_units {
    type: number
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'budgetDetails.development.qty') ;;
    group_label: "Buy Budget Capacity"
  }

  dimension: design_units {
    type: number
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'budgetDetails.design.qty') ;;
    group_label: "Buy Budget Capacity"
  }

  dimension: qa_units {
    type: number
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'budgetDetails.qa.qty') ;;
    group_label: "Buy Budget Capacity"
  }

  dimension: type_of_budget {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'budgetDetails.deliverables') ;;
    group_label: "Buy Budget Capacity"
  }

  dimension: screen_count {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'appDefinition.unstructuredTestsScreenCount') ;;
    group_label: "QA Service"
  }

  dimension: qa_service {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'appDefinition.qaType') ;;
    group_label: "QA Service"
  }

  dimension: work_required {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'appDefinition.structuredTestWorkType') ;;
    group_label: "QA Service"
  }

  dimension: talent_area {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.deliverables') ;;
    group_label: "Taas"
  }

  dimension: others_description {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.otherBrief') ;;
    group_label: "Taas"
  }

  dimension: design_description {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.design') ;;
    group_label: "Taas"
  }

  dimension: design_skills {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.skills.design.name') ;;
    group_label: "Taas"
  }

  dimension: design_skills_id {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.skills.design.id') ;;
    group_label: "Taas"
  }

  dimension: dev_description {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.dev.brief') ;;
    group_label: "Taas"
  }

  dimension: dev_skills {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.skills.dev.name') ;;
    group_label: "Taas"
  }

  dimension: dev_skills_id {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.skills.dev.id') ;;
    group_label: "Taas"
  }

  dimension: data_science_description {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.dataScience.brief') ;;
    group_label: "Taas"
  }

  dimension: data_science_skills {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'appDefinition.skills.dataScience.name') ;;
    group_label: "Taas"
  }

  dimension: data_science_skills_id {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'appDefinition.skills.dataScience.id') ;;
    group_label: "Taas"
  }

  dimension: qa_description {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.qa') ;;
    group_label: "Taas"
  }

  dimension: qa_skills {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.skills.qa.name') ;;
    group_label: "Taas"
  }

  dimension: full_time_talent {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.fullTimeTalentEstimate') ;;
    group_label: "Taas"
  }

  dimension: talent_retention {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.talentRetentionDuration') ;;
    group_label: "Taas"
  }

  dimension: priviled_access {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.needPrivilegedAccess') ;;
    group_label: "Taas"
  }

  dimension: is_background_checks_required_for_talent {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.needBackgroundChecks') ;;
    group_label: "Taas"
  }

  dimension: is_custom_nda_required {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.needCustomNdas') ;;
    group_label: "Taas"
  }
}
