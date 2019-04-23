connection: "prod_-_topcoder_redshift"

# include all views in this project
include: "*.view"

# include all dashboards in this project
# include: "*.dashboard"

#for fiscal year
fiscal_month_offset: 3

explore: project_result {}

explore: country {}

explore: calendar {}

explore: challenge {}
