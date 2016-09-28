- view: cost_transaction
  sql_table_name: public.cost_transaction
  fields:

  - measure: actual_total_member_costs
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.actual_total_member_costs

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

  - measure: invoice_amount
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.invoice_amount

  - dimension: invoice_id
    type: number
    sql: ${TABLE}.invoice_id

  - dimension: invoice_number
    type: string
    sql: ${TABLE}.invoice_number

  - dimension: invoice_record_id
    type: number
    sql: ${TABLE}.invoice_record_id

  - dimension: is_studio
    type: string
    sql: ${TABLE}.is_studio

  - dimension_group: launch 
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.launch_date

  - measure: line_item_amount
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: ${TABLE}.line_item_amount

  - dimension: line_item_category
    type: string
    sql: ${TABLE}.line_item_category

  - dimension_group: payment_date
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.payment_date

  - dimension: payment_desc
    type: string
    sql: ${TABLE}.payment_desc

  - dimension: payment_detail_id
    type: number
    sql: ${TABLE}.payment_detail_id

  - dimension: payment_id
    type: number
    # hidden: true
    sql: ${TABLE}.payment_id

  - dimension: payment_type_desc
    type: string
    sql: ${TABLE}.payment_type_desc

  - dimension_group: process_date
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.process_date

  - dimension: processed
    type: string
    sql: ${TABLE}.processed

  - dimension: project_category_id
    type: number
    sql: ${TABLE}.project_category_id

  - dimension: reference_id
    type: string
    sql: ${TABLE}.reference_id

  - dimension: transation_id
    type: number
    primary_key: true
    sql: ${TABLE}.transation_id

  - measure: count
    type: count
    drill_fields: detail*
    
  - measure: fee
    type: sum
    value_format: '$#,##0.00;($#,##0.00)'
    sql: DECODE(${TABLE}.line_item_category, 'Contest Fee', ${TABLE}.line_item_amount, 0)
    

  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - billing_project_name
    - direct_project_name
    - contest_name
    - contest.contest_id
    - contest.contest_name
    - contest.project_category_name
    - payment.parent_payment_id

