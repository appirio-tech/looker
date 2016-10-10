- connection: prod_-_topcoder_redshift

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- explore: project_result

- explore: country

- explore: calendar

- explore: challenge