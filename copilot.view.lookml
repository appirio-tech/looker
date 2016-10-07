- view: copilot

  derived_table:
     sql: |
      SELECT 
        copilot.handle AS "handle",
        copilot.first_name AS "first_name",
        copilot.last_name AS "last_name",
        copilot.email AS "email",
        count(case when challenge.category_id = 27202915 or challenge.category_id = 26887152 then 1 end) as design_challenge_count,
        count(case when challenge.category_id <> 27202915 and challenge.category_id <> 26887152 then 1 end) as dev_challenge_count
      FROM tcs_dw.project AS challenge
      LEFT JOIN topcoder_dw.coder AS copilot ON challenge.copilot = copilot.coder_id
      GROUP BY 1,2,3,4
      ORDER BY 1

  fields:
    - dimension: handle
      type: string
      sql: ${TABLE}.handle
  
    - dimension: first_name
      type: string
      sql: ${TABLE}.first_name
    
    - dimension: last_name
      type: string
      sql: ${TABLE}.last_name
    
    - dimension: email
      type: string
      sql: ${TABLE}.email
    
    - measure: count
      type: count
      drill_fields: detail*

    - measure: design_challenge_count
      type: sum
      sql: ${TABLE}.design_challenge_count

    - measure: dev_challenge_count
      type: sum
      sql: ${TABLE}.dev_challenge_count
