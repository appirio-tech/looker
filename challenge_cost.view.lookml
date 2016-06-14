- view: challenge_cost

# # You can specify the table name if it's different from the view name:
#   sql_table_name: my_schema_name.challenge_cost
#
#  fields:
# #     Define your dimensions and measures here, like this:
#     - dimension: id
#       type: number
#       sql: ${TABLE}.id
#
#     - dimension: created
#       type: time
#       timeframes: [date, week, month, year]
#       sql: ${TABLE}.created_at
#
#     - measure: count
#       type: count


# # Or, you could make this view a derived table, like this:
  derived_table:
     sql: |
      select MAX(payment_date) payment_date,
             contest_id,
             contest_name,
             client_id,
             client,
             billing_project_id,
             billing_project_name,
             direct_project_id,
             direct_project_name,
             project_category_id,
             category,
             completion_date,
             contest_status,
             reference_id,
             SUM(line_item_amount) as amount
      from cost_transaction
      group by 
             contest_id,
             contest_name,
             client_id,
             client,
             billing_project_id,
             billing_project_name,
             direct_project_id,
             direct_project_name,
             project_category_id,
             category,
             completion_date,
             contest_status,
             reference_id


  fields:

  - dimension: billing_project_id
    type: number
    sql: ${TABLE}.billing_project_id
  
  - dimension: billing_project_name
    type: string
    sql: ${TABLE}.billing_project_name
  
  - dimension: category
    type: string
    sql: ${TABLE}.category
  
  - dimension: client
    type: string
    sql: ${TABLE}.client
  
  - dimension: client_id
    type: number
    sql: ${TABLE}.client_id
  
  - dimension_group: completion
    type: time
    timeframes: [time, date, week, month, year, quarter]
    sql: ${TABLE}.completion_date
  
  - dimension: contest_id
    type: number
    # hidden: true
    sql: ${TABLE}.contest_id
  
  - dimension: contest_name
    type: string
    sql: ${TABLE}.contest_name
  
  - dimension: contest_status
    type: string
    sql: ${TABLE}.contest_status
  
  - dimension: direct_project_id
    type: number
    sql: ${TABLE}.direct_project_id
  
  - dimension: direct_project_name
    type: string
    sql: ${TABLE}.direct_project_name
  
  - measure: amount
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.amount
    
  - dimension_group: payment_date
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.payment_date
  
  
  - dimension: project_category_id
    type: number
    sql: ${TABLE}.project_category_id
  
  - dimension: reference_id
    type: string
    sql: ${TABLE}.reference_id
  
  
  - measure: count
    type: count
    drill_fields: detail*


# ----- Sets of fields for drilling ------
  sets:
    detail:
    - billing_project_name
    - direct_project_name
    - contest_name
    - contest.contest_id
    - contest.contest_name
    - contest.project_category_name

