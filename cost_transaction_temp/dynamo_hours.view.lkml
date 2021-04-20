view: dynamo_hours {
  derived_table: {
    sql: select id,eventid,
      dynamodb,
      JSON_EXTRACT_PATH_TEXT(dynamodb, 'ApproximateCreationDateTime', true) as ApproxTime,
      JSON_EXTRACT_PATH_TEXT(dynamodb, 'Keys','id','S', true) as challenge_guid,
      JSON_EXTRACT_PATH_TEXT(dynamodb, 'NewImage','metadata','SS', true) as New_Metadata,
      JSON_EXTRACT_PATH_TEXT(dynamodb, 'OldImage','metadata','SS', true) As Old_Metadata,

      json_extract_array_element_text(New_Metadata, 0, true) as New_Array_0,
      json_extract_array_element_text(New_Metadata, 1, true) as New_Array_1,
      json_extract_array_element_text(New_Metadata, 2, true) as New_Array_2,
      json_extract_array_element_text(New_Metadata, 3, true) as New_Array_3,


      JSON_EXTRACT_PATH_TEXT(replace(New_Array_0,'\\',''),'name', true) as New_Name_0,
      JSON_EXTRACT_PATH_TEXT(replace(New_Array_0,'\\',''),'value', true) as New_Value_0,

      JSON_EXTRACT_PATH_TEXT(replace(New_Array_1,'\\',''),'name', true) as New_Name_1,
      JSON_EXTRACT_PATH_TEXT(replace(New_Array_1,'\\',''),'value', true) as New_Value_1,

      JSON_EXTRACT_PATH_TEXT(replace(New_Array_2,'\\',''),'name', true) as New_Name_2,
      JSON_EXTRACT_PATH_TEXT(replace(New_Array_2,'\\',''),'value', true) as New_Value_2,

      JSON_EXTRACT_PATH_TEXT(replace(New_Array_3,'\\',''),'name', true) as New_Name_3,
      JSON_EXTRACT_PATH_TEXT(replace(New_Array_3,'\\',''),'value', true) as New_Value_3,

      json_extract_array_element_text(Old_Metadata, 0, true) as Old_Array_0,
      json_extract_array_element_text(Old_Metadata, 1, true) as Old_Array_1,
      json_extract_array_element_text(Old_Metadata, 2, true) as Old_Array_2,
      json_extract_array_element_text(Old_Metadata, 3, true) as Old_Array_3,

      JSON_EXTRACT_PATH_TEXT(replace(Old_Array_0,'\\',''),'name', true) as Old_Name_0,
      JSON_EXTRACT_PATH_TEXT(replace(Old_Array_0,'\\',''),'value', true) as Old_Value_0,

      JSON_EXTRACT_PATH_TEXT(replace(Old_Array_1,'\\',''),'name', true) as Old_Name_1,
      JSON_EXTRACT_PATH_TEXT(replace(Old_Array_1,'\\',''),'value', true) as Old_Value_1,

      JSON_EXTRACT_PATH_TEXT(replace(Old_Array_2,'\\',''),'name', true) as Old_Name_2,
      JSON_EXTRACT_PATH_TEXT(replace(Old_Array_2,'\\',''),'value', true) as Old_Value_2,

      JSON_EXTRACT_PATH_TEXT(replace(Old_Array_3,'\\',''),'name', true) as Old_Name_3,
      JSON_EXTRACT_PATH_TEXT(replace(Old_Array_3,'\\',''),'value', true) as Old_Value_3


      from dynamoevents_challenge_bkp_9th_April
      order by creationdatetime desc
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: timestamp {
    type: number
    sql: ${TABLE}.ApproxTime ;;
  }

  dimension: eventid {
    type: number
    sql:  ${TABLE}.eventid;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: dynamo_json {
    type: string
    sql:  ${TABLE}.dynamodb;;
  }

  dimension: challenge_guid {
    type: string
    sql: ${TABLE}.challenge_guid ;;
  }

  dimension: new_metadata {
    type: string
    sql: ${TABLE}.new_metadata ;;
  }

  dimension: old_metadata {
    type: string
    sql: ${TABLE}.old_metadata ;;
  }

  dimension: new_array_0 {
    type: string
    sql: ${TABLE}.new_array_0 ;;
  }

  dimension: new_array_1 {
    type: string
    sql: ${TABLE}.new_array_1 ;;
  }

  dimension: new_array_2 {
    type: string
    sql: ${TABLE}.new_array_2 ;;
  }

  dimension: new_array_3 {
    type: string
    sql: ${TABLE}.new_array_3 ;;
  }

  dimension: new_name_0 {
    type: string
    sql: ${TABLE}.new_name_0 ;;
  }

  dimension: new_value_0 {
    type: string
    sql: ${TABLE}.new_value_0 ;;
  }

  dimension: new_name_1 {
    type: string
    sql: ${TABLE}.new_name_1 ;;
  }

  dimension: new_value_1 {
    type: string
    sql: ${TABLE}.new_value_1 ;;
  }

  dimension: new_name_2 {
    type: string
    sql: ${TABLE}.new_name_2 ;;
  }

  dimension: new_value_2 {
    type: string
    sql: ${TABLE}.new_value_2 ;;
  }

  dimension: new_name_3 {
    type: string
    sql: ${TABLE}.new_name_3 ;;
  }

  dimension: new_value_3 {
    type: string
    sql: ${TABLE}.new_value_3 ;;
  }

  dimension: old_array_0 {
    type: string
    sql: ${TABLE}.old_array_0 ;;
  }

  dimension: old_array_1 {
    type: string
    sql: ${TABLE}.old_array_1 ;;
  }

  dimension: old_array_2 {
    type: string
    sql: ${TABLE}.old_array_2 ;;
  }

  dimension: old_array_3 {
    type: string
    sql: ${TABLE}.old_array_3 ;;
  }

  dimension: old_name_0 {
    type: string
    sql: ${TABLE}.old_name_0 ;;
  }

  dimension: old_value_0 {
    type: string
    sql: ${TABLE}.old_value_0 ;;
  }

  dimension: old_name_1 {
    type: string
    sql: ${TABLE}.old_name_1 ;;
  }

  dimension: old_value_1 {
    type: string
    sql: ${TABLE}.old_value_1 ;;
  }

  dimension: old_name_2 {
    type: string
    sql: ${TABLE}.old_name_2 ;;
  }

  dimension: old_value_2 {
    type: string
    sql: ${TABLE}.old_value_2 ;;
  }

  dimension: old_name_3 {
    type: string
    sql: ${TABLE}.old_name_3 ;;
  }

  dimension: old_value_3 {
    type: string
    sql: ${TABLE}.old_value_3 ;;
  }

  set: detail {
    fields: [
      id,
      challenge_guid,
      new_metadata,
      old_metadata,
      new_array_0,
      new_array_1,
      new_array_2,
      new_array_3,
      new_name_0,
      new_value_0,
      new_name_1,
      new_value_1,
      new_name_2,
      new_value_2,
      new_name_3,
      new_value_3,
      old_array_0,
      old_array_1,
      old_array_2,
      old_array_3,
      old_name_0,
      old_value_0,
      old_name_1,
      old_value_1,
      old_name_2,
      old_value_2,
      old_name_3,
      old_value_3
    ]
  }
}
