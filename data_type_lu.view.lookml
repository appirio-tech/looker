- view: data_type_lu
  sql_table_name: public.data_type_lu
  fields:

  - dimension: data_type_desc
    type: string
    sql: ${TABLE}.data_type_desc

  - dimension: data_type_id
    type: number
    sql: ${TABLE}.data_type_id

  - measure: count
    type: count
    drill_fields: []

