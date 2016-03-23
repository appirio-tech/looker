- connection: tcdw_qa

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: coder
- explore: coder_full

- explore: country
  joins:
    - join: coder
      type: left_outer
      sql_on: ${coder.country_code} = ${country.country_code}
      relationship: one_to_many

- explore: calendar

- explore: project

- explore: project_result
  joins:
    - join: project
      type: left_outer 
      sql_on: ${project_result.project_id} = ${project.project_id}
      relationship: many_to_one

- explore: design_project_result
  joins:
    - join: project
      type: left_outer 
      sql_on: ${design_project_result.project_id} = ${project.project_id}
      relationship: many_to_one
      
- explore: payment

- explore: user_payment
  joins:
    - join: payment
      type: left_outer
      sql_on: ${user_payment.payment_id} = ${payment.payment_id}
      relationship: many_to_one
      
    - join: calendar
      type: inner
      sql_on: ${user_payment.due_calendar_id} = ${calendar.calendar_id}
      relationship: many_to_one
      



