# The name of this view in Looker is "Historical Financials" This data is reports historical financials on a net accounting basis. The data is hard-coded from Wipro Financial team.
view: historical_financials {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: tcs_dw.historical_financials ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fiscal_year {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fiscal_year_date ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Metric" in Explore.

  dimension: metric {
    type: string
    sql: ${TABLE}.metric ;;
  }

  dimension: metric_type {
    type: string
    sql: ${TABLE}.metric_type ;;
  }

  dimension_group: quarter {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.quarter_date ;;
  }

 dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_value {
    type: sum
    sql: ${TABLE}.value ;;
  }

  measure: amount {
    type: sum
    sql: ${TABLE}.value ;;
  }

  measure: average_value {
    type: average
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
