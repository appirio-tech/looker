- view: review_resp
  sql_table_name: public.review_resp
  fields:

  - dimension: review_resp_id
    primary_key: true
    type: number
    sql: ${TABLE}.review_resp_id

  - dimension: review_resp_desc
    type: string
    sql: ${TABLE}.review_resp_desc

  - measure: count
    type: count
    drill_fields: [review_resp_id]

