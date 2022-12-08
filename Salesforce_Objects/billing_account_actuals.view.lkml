# The name of this view in Looker is "Billing Account Actuals"
view: billing_account_actuals {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: segment_tc_salesforce.billing_account_actuals ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ba Type C" in Explore.

  dimension: ba_type_c {
    type: string
    sql: ${TABLE}.ba_type_c ;;
  }

  dimension: billing_account_id_c {
    type: string
    sql: ${TABLE}.billing_account_id_c ;;
  }

  dimension: challenge_id_c {
    type: string
    sql: ${TABLE}.challenge_id_c ;;
  }

  dimension: challenge_manager_c {
    type: string
    sql: ${TABLE}.challenge_manager_c ;;
  }

  dimension: challenge_name_c {
    type: string
    sql: ${TABLE}.challenge_name_c ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: completion_date_c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.completion_date_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_date ;;
  }

  dimension: currency_iso_code {
    type: string
    sql: ${TABLE}.currency_iso_code ;;
  }

  dimension: fee_c {
    type: number
    sql: ${TABLE}.fee_c ;;
  }




  dimension: is_deleted {
    type: string
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: manager_handle_c {
    type: string
    sql: ${TABLE}.manager_handle_c ;;
  }

  dimension: markup_difference_c {
    type: string
    sql: ${TABLE}.markup_difference_c ;;
  }

  dimension: member_payment_c {
    type: number
    sql: ${TABLE}.member_payment_c ;;
  }



  dimension: month_of_quarter_c {
    type: number
    sql: ${TABLE}.month_of_quarter_c ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_month_of_quarter_c {
    type: sum
    sql: ${month_of_quarter_c} ;;
  }

  measure: average_month_of_quarter_c {
    type: average
    sql: ${month_of_quarter_c} ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: payment_date_c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.payment_date_c ;;
  }

  dimension_group: received {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.received_at ;;
  }

  dimension: status_c {
    type: string
    sql: ${TABLE}.status_c ;;
  }

  dimension_group: system_modstamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: topcoder_billing_account_c {
    type: string
    sql: ${TABLE}.topcoder_billing_account_c ;;
  }

  dimension: total_c {
    type: number
    sql: ${TABLE}.total_c ;;
  }

  dimension: transaction_id_c {
    type: string
    sql: ${TABLE}.transaction_id_c ;;
  }

  dimension: use_in_calculation_c {
    type: string
    sql: ${TABLE}.use_in_calculation_c ;;
  }

  dimension_group: uuid_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.uuid_ts ;;
  }

  measure: count {
    type: count
    drill_fields: [challenge_id_c, challenge_name_c,completion_date_c_date,fee_c,member_payment_c,payment_date_c_date]
  }
}
