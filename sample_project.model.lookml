- connection: tcdw_qa

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: coder

- explore: country

- explore: project

- explore: project_result
  joins:
    - join: project
      type: left_outer 
      sql_on: ${project_result.project_id} = ${project.client_project_id}
      relationship: many_to_one


