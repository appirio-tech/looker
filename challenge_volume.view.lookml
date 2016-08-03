- view: challenge_volume
  derived_table:
    sql: |
      select date(payment_date) payment_date,
             client,
             direct_project_name,
             contest_id, 
             category,
             count(*)/count(*) count
      from cost_transaction
      group by 1,2,3,4,5

  fields:
# #     Define your dimensions and measures here, like this:
     - dimension: client
       type: string
       sql: ${TABLE}.client

     - dimension: project_name
       type: string
       sql: ${TABLE}.direct_project_name

     - dimension: challenge_id
       type: number
       sql: ${TABLE}.contest_id

     - dimension: challenge_type
       type: string
       sql: ${TABLE}.category

     - dimension: transaction_date
       type: time
       timeframes: [date, week, month, year, quarter]
       sql: ${TABLE}.payment_date

     - measure: count
       type: count
