- view: member_payments
  derived_table:
     sql: |
      SELECT
          p.payment_id,
          p.payment_desc,
          p.payment_type_id,
          p.payment_type_desc,
          p.reference_id,
          p.parent_payment_id,
          p.charity_ind,
          p.show_in_profile_ind,
          p.show_details_ind,
          p.payment_status_id,
          p.payment_status_desc,
          p.client,
          mod_date.date AS date_modified,
          p.modified_time_id,
          p.installment_number,
          p.jira_ticket_id,
          p.created_calendar_id,
          p.created_time_id,
          up.payment_id,
          up.user_id,
          payee.handle,
          payee.country_code,
          payee.comp_country_code,
          payee.member_since,
          due_date.date AS date_due,
          paid_date.date AS date_paid,
          up.net_amount,
          up.gross_amount,
          up.total_amount    
      FROM topcoder_dw.payment p,
           topcoder_dw.user_payment up,
           topcoder_dw.calendar mod_date,
           topcoder_dw.calendar due_date,
           topcoder_dw.calendar paid_date,
           topcoder_dw.coder payee
      WHERE p.payment_id = up.payment_id
        AND p.modified_calendar_id = mod_date.calendar_id
        AND up.due_calendar_id = due_date.calendar_id
        AND up.paid_calendar_id = paid_date.calendar_id
        AND up.user_id = payee.coder_id

  fields:

     - dimension: payment_id
       type: number
       sql: ${TABLE}.payment_id

     - dimension: payment_desc
       type: string
       sql: ${TABLE}.payment_desc

     - dimension: payment_type_desc
       type: string
       sql: ${TABLE}.payment_type_desc

     - dimension: reference_id
       type: number
       sql: ${TABLE}.reference_id

     - dimension: parent_payment_id
       type: number
       sql: ${TABLE}.parent_payment_id

     - dimension: charity_ind
       type: number
       sql: ${TABLE}.charity_ind

     - dimension: show_in_profile_ind
       type: number
       sql: ${TABLE}.show_in_profile_ind
       
     - dimension: show_details_ind
       type: number
       sql: ${TABLE}.show_details_ind
       
     - dimension: payment_status_desc
       type: string
       sql: ${TABLE}.payment_status_desc
       
     - dimension: client
       type: string
       sql: ${TABLE}.client
       
     - dimension: date_modified
       type: time
       timeframes: [time, date, week, month, year, quarter]
       sql: ${TABLE}.date_modified

     - dimension: installment_number
       type: number
       sql: ${TABLE}.installment_number

     - dimension: jira_ticket_id
       type: string
       sql: ${TABLE}.jira_ticket_id

     - dimension: created_calendar_id
       type: number
       sql: ${TABLE}.created_calendar_id

     - dimension: user_id
       type: number
       sql: ${TABLE}.user_id

     - dimension: handle
       type: string
       sql: ${TABLE}.handle

     - dimension: country_code
       type: number
       sql: ${TABLE}.country_code

     - dimension: comp_country_code
       type: number
       sql: ${TABLE}.comp_country_code

     - dimension: member_since
       type: time
       timeframes: [time, date, week, month, year, quarter]
       sql: ${TABLE}.member_since

     - dimension: date_due
       type: time
       timeframes: [time, date, week, month, year, quarter]
       sql: ${TABLE}.date_due

     - dimension: date_paid
       type: time
       timeframes: [time, date, week, month, year, quarter]
       sql: ${TABLE}.date_paid       


     - measure: net_amount
       type: sum
       value_format: '$#,##0.00;($#,##0.00)'
       sql: ${TABLE}.net_amount

     - measure: gross_amount
       type: sum
       value_format: '$#,##0.00;($#,##0.00)'
       sql: ${TABLE}.gross_amount

     - measure: total_amount
       type: sum
       value_format: '$#,##0.00;($#,##0.00)'
       sql: ${TABLE}.total_amount


