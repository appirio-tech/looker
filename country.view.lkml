view: country {
  sql_table_name: topcoder_dw.country ;;

  dimension: country_code {
    primary_key: yes
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: country_name {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country_name ;;
  }

  dimension: comp_country_location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: participating {
    type: number
    sql: ${TABLE}.participating ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  measure: count {
    type: count
    drill_fields: [country_name]
  }
}
