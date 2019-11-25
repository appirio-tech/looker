view: connect_intake_form {
  sql_table_name: public.projects ;;

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
    }

  dimension: background {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.background') ;;
    group_label: "Computer Vision Intake Form"
  }

  dimension: data_types {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.dataVariety') ;;
    group_label: "Computer Vision Intake Form"
  }

  dimension: data_type {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.solutionAim') ;;
    group_label: "Computer Vision Intake Form"
  }

  dimension: data_format {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.dataFormat') ;;
    group_label: "Computer Vision Intake Form"
  }

  dimension: data_size {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.dataSize') ;;
    group_label: "Computer Vision Intake Form"
 }

  dimension: images_count {
    type: number
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.imagesCount') ;;
    group_label: "Computer Vision Intake Form"
  }

  dimension: patent_or_licenses {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.hasDataRestrictions') ;;
    group_label: "Computer Vision Intake Form"
  }

  dimension: expected_outcomes {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.expectedOutcomes') ;;
    group_label: "Computer Vision Intake Form"
  }

  dimension: scoring_systems {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.scoringSystems') ;;
    group_label: "Computer Vision Intake Form"
  }

  dimension: is_data_labled {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.isDataLabeled') ;;
    group_label: "Computer Vision Intake Form"
  }

  dimension: labling_required {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.isDataLabelingRequired') ;;
    group_label: "Computer Vision Intake Form"
  }

  dimension: need_production_preparation {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.productionPrepRequired') ;;
    group_label: "Computer Vision Intake Form"
  }

  dimension: additional_context {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.notes') ;;
    group_label: "Computer Vision Intake Form"
  }

  dimension: other_data_type {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.otherSolutionAims') ;;
    group_label: "Computer Vision Intake Form"
  }

  dimension: data_location {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.dataLocation') ;;
    group_label: "Computer Vision Intake Form"
  }

  dimension: other_data_types{
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'compVisDefinition.otherDataVariety') ;;
    group_label: "Computer Vision Intake Form"
  }

  dimension: deliverables {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.deliverables') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: design_work {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.designWork') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: existing_platforms {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.platforms') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: licensed_features {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.licensedFeatures') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: visualization_platforms {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.platformsRequired') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: other_platforms {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.otherPlatformsRequired') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: target_devices {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.targetDevices') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: functionalities {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.functionalities') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: tabs_count {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.tabsCount') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: data_description {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.dataDetails') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: is_data_accessible {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.isDataRefreshedDaily') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: need_obfuscation {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.needObfuscation') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: data_access {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.isDataAccessible') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: sample_data {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.sampleData') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: user_roles {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.userRoles') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: intended_usage {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.intendedDataUsage') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: data_usage {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.currentDataUsage') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: performance_indicators {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.performanceIndicators') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: success_indicators {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dataVizDefinition.successIndicators') ;;
    group_label: "Data Visualization Intake Form"
  }

  dimension: problem_concept {
    type: string
    description: "Free Text"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.problemStatement') ;;
    group_label: "Data Science Sprint Intake Form"
  }

  dimension: project_goals {
    type: string
    description: "Free Text"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.goals') ;;
    group_label: "Data Science Sprint Intake Form"
  }

  dimension: problem_description {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.problemDesc') ;;
    group_label: "Data Science Sprint Intake Form"
  }

  dimension: academic_papers {
    type: string
    description: "Is academic papers applicable here(yes, no) "
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.academicPapers') ;;
    group_label: "Data Science Sprint Intake Form"
  }

  dimension: preferred_tech {
    type: string
    description: "Is there a preferred technology ?"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.preferredTech') ;;
    group_label: "Data Science Sprint Intake Form"
  }

  dimension: preferred_technology {
    type: string
    description: "Preferred technology for scoring system eg Python, Java, C++, R and derivatives, Jupyter Notebook "
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.preferredTechnologies') ;;
    group_label: "Data Science Sprint Intake Form"
  }

  dimension: technologies_required {
    type: string
    description: "Is any technology required ? "
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.selectedTechRequired') ;;
    group_label: "Data Science Sprint Intake Form"
  }

  dimension: other_technology {
    type: string
    description: "Exhaustive list of other technologies, if any "
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.techPlatforms') ;;
    group_label: "Data Science Sprint Intake Form"
  }

  dimension: open_source {
    type: string
    description: "Is open source acceptable ? "
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.openSourceLibraries') ;;
    group_label: "Data Science Sprint Intake Form"
  }

  dimension: outcome {
    type: string
    description: "Outcome focus on concepts, Implementation or Both "
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.outcome') ;;
    group_label: "Data Science Sprint Intake Form"
  }

  dimension: data_available {
    type: string
    description: "Is there any existing data available ? "
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.dataAvailable') ;;
    group_label: "Data Science Sprint Intake Form"
  }

  dimension: winning_criteria {
    type: string
    description: "Differentiate between first and second place solution"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.criteria') ;;
    group_label: "Data Science Sprint Intake Form"
  }

  dimension: piidata {
    type: string
    label: "PII Data"
    description: "Does the data contains PII information ?"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.pIIData') ;;
    group_label: "Data Science Sprint Intake Form"
  }

  dimension: data_formats {
    type: string
    description: "Free Text"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.dataFormat') ;;
    group_label: "Data Science Sprint Intake Form"
  }

  dimension: data_privatized {
    type: string
    description: "Is the data already obfuscated or privatized ?"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.dataModifications') ;;
    group_label: "Data Science Sprint Intake Form"
  }

  dimension: dssprint_notes {
    type: string
    description: "Additional notes in the intake form"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsSprint.notes') ;;
    group_label: "Data Science Sprint Intake Form"
  }


  dimension: problem_statement {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.problemStatement') ;;
    group_label: "Data Science Ideation Intake Form"
  }

  dimension: project_output {
    type: string
    description: "Project output can be White Paper, POC or Both "
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.output') ;;
    group_label: "Data Science Ideation Intake Form"
  }

  dimension: prefer_tech {
    type: string
    description: "Is there a Preferred Technology ? "
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.preferredTech') ;;
    group_label: "Data Science Ideation Intake Form"
  }

  dimension: preferred_technoloy {
    type: string
    description: "Preferred technology for scoring system eg Python, Java, C++, R and derivatives, Jupyter Notebook "
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.preferredTechnologies') ;;
    group_label: "Data Science Ideation Intake Form"
  }

  dimension: other_technologies {
    type: string
    description: "Exhaustive list of other technologies, if any "
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.techPlatforms') ;;
    group_label: "Data Science Ideation Intake Form"
  }

  dimension: problem_background {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.backgroundDesc') ;;
    group_label: "Data Science Ideation Intake Form"
  }

  dimension: academic_paper {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.academicPapers') ;;
    group_label: "Data Science Ideation Intake Form"
  }

  dimension: new_ideas_or_filter {
    type: string
    description: "Sourcing new ideas or filtering out options"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.solutionOptimizationApproach') ;;
    group_label: "Data Science Ideation Intake Form"
  }

  dimension: data_availablity {
    type: string
    description: "Is there data available(yes, no)"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.dataAvailable') ;;
    group_label: "Data Science Ideation Intake Form"
  }

  dimension: win_criteria {
    type: string
    description: "Differentiate between first and second place solution"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.criteria') ;;
    group_label: "Data Science Ideation Intake Form"
  }

  dimension: data_format_and_other_details {
    type: string
    description: "Free text"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.dataFormat') ;;
    group_label: "Data Science Ideation Intake Form"
  }

  dimension: pii_data {
    type: string
    label: "PII Data"
    description: "Does the data contains PII information ?"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.pIIData') ;;
    group_label: "Data Science Ideation Intake Form"
  }

  dimension: data_obfuscated {
    type: string
    description: "Is the data already obfuscated or privatized ?"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.dataModifications') ;;
    group_label: "Data Science Ideation Intake Form"
  }

  dimension: dsideation_notes {
    type: string
    description: "Additional Notes provided in the intake form"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'dsIdeation.notes') ;;
    group_label: "Data Science Ideation Intake Form"
  }

  dimension: data_science_units {
    type: number
    description: "1 data science unit is valued as 10K, 2 data science units means 20K budget of data science"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'budgetDetails.dataScience.qty') ;;
    group_label: "Buy Budget Capacity Intake Form"
  }

  dimension: development_units {
    type: number
    description: "1 dev unit is valued as 10K, 2 dev units means 20K budget of dev"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'budgetDetails.development.qty') ;;
    group_label: "Buy Budget Capacity Intake Form"
  }

  dimension: design_units {
    type: number
    description: "1 design unit is valued as 10K, 2 design units means 20K budget of design"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'budgetDetails.design.qty') ;;
    group_label: "Buy Budget Capacity Intake Form"
  }

  dimension: qa_units {
    type: number
    label: "QA Units"
    description: "1 QA unit is valued as 10K, 2 QA units means 20K budget of QA"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'budgetDetails.qa.qty') ;;
    group_label: "Buy Budget Capacity Intake Form"
  }

  dimension: type_of_budget {
    type: string
    description: "Budget options are Design, Dev, Data Science or QA"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'budgetDetails.deliverables') ;;
    group_label: "Buy Budget Capacity Intake Form"
  }

  dimension: screen_count {
    type: string
    description: "Test Case/Screen Count"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'appDefinition.unstructuredTestsScreenCount') ;;
    group_label: "QA Service Intake Form"
  }

  dimension: qa_service {
    type: string
    label: "QA Service"
    description: "Type of testing eg Performance Testing, Regression Testing, Functional Testing"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'appDefinition.qaType') ;;
    group_label: "QA Service Intake Form"
  }

  dimension: work_required {
    type: string
    description: "Test case creation, Test case execution or Both"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'appDefinition.structuredTestWorkType') ;;
    group_label: "QA Service Intake Form"
  }

  dimension: is_additional_test_case_required {
    type: string
    description: "Will test coverage require more than 150 test cases ?"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'appDefinition.needAdditionalStructTests') ;;
    group_label: "QA Service Intake Form"
  }


  dimension: talent_area {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.deliverables') ;;
    group_label: "Taas Intake Form"
  }

  dimension: others_description {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.otherBrief') ;;
    group_label: "Taas Intake Form"
  }

  dimension: design_description {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.design.brief') ;;
    group_label: "Taas Intake Form"
  }

  dimension: design_skills {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.skills.design.name') ;;
    group_label: "Taas Intake Form"
  }

  dimension: design_skills_id {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.skills.design.id') ;;
    group_label: "Taas Intake Form"
  }

  dimension: dev_description {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.dev.brief') ;;
    group_label: "Taas Intake Form"
  }

  dimension: dev_skills {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.skills.dev.name') ;;
    group_label: "Taas Intake Form"
  }

  dimension: dev_skills_id {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.skills.dev.id') ;;
    group_label: "Taas Intake Form"
  }

  dimension: data_science_description {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.dataScience.brief') ;;
    group_label: "Taas Intake Form"
  }

  dimension: data_science_skills {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'appDefinition.skills.dataScience.name') ;;
    group_label: "Taas Intake Form"
  }

  dimension: data_science_skills_id {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'appDefinition.skills.dataScience.id') ;;
    group_label: "Taas Intake Form"
  }

  dimension: qa_description {
    type: string
    label: "QA Description"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.qa') ;;
    group_label: "Taas Intake Form"
  }

  dimension: qa_skills {
    type: string
    label: "QA Skills"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.skills.qa.name') ;;
    group_label: "Taas Intake Form"
  }

  dimension: full_time_talent {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.fullTimeTalentEstimate') ;;
    group_label: "Taas Intake Form"
  }

  dimension: talent_retention {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.talentRetentionDuration') ;;
    group_label: "Taas Intake Form"
  }

  dimension: priviled_access {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.needPrivilegedAccess') ;;
    group_label: "Taas Intake Form"
  }

  dimension: is_background_checks_required_for_talent {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.needBackgroundChecks') ;;
    group_label: "Taas Intake Form"
  }

  dimension: is_custom_nda_required {
    type: string
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'taasDefinition.needCustomNdas') ;;
    group_label: "Taas Intake Form"
  }

  dimension: objective {
    type: string
    description: "Purpose of creating the project"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'intakePurpose') ;;
  }

  dimension: notes {
    type: string
    description: "Additional notes provided in the intake form"
    sql: json_extract_path_text((regexp_replace(connect_project.intake_form,'\\\\.')), 'appDefinition.notes') ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
}
