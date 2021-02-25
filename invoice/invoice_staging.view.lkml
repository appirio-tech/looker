view: invoice_staging {

  derived_table: {

    sql:
      SELECT
          payment_date,
          contest_id,
          client,
          billing_project_name,
          direct_project_name,
          launch_date,
          completion_date,
          category,
          contest_name,
          contest_status,
          actual_total_member_costs,
          payment_type_desc,
          line_item_category,
          reference_id,
          line_item_amount,
          client_id,
          billing_project_id,
          direct_project_id,
          project_category_id,
          payment_detail_id,
          is_studio,
          payment_id,
          payment_desc,
          invoice_amount,
          processed,
          process_date,
          invoice_number,
          invoice_id,
          invoice_record_id,
          'Credit' as source
      FROM
          invoice.credit
    UNION ALL
      SELECT
          payment_date,
          contest_id,
          client,
          billing_project_name,
          direct_project_name,
          launch_date,
          completion_date,
          category,
          contest_name,
          contest_status,
          actual_total_member_costs,
          payment_type_desc,
          line_item_category,
          reference_id,
          line_item_amount,
          client_id,
          billing_project_id,
          direct_project_id,
          project_category_id,
          payment_detail_id,
          is_studio,
          payment_id,
          payment_desc,
          invoice_amount,
          processed,
          process_date,
          invoice_number,
          invoice_id,
          invoice_record_id,
          'DR' as source
      FROM
          invoice.dr
    UNION ALL
      SELECT
          payment_date,
          contest_id,
          client,
          billing_project_name,
          direct_project_name,
          launch_date,
          completion_date,
          category,
          contest_name,
          contest_status,
          actual_total_member_costs,
          payment_type_desc,
          line_item_category,
          reference_id,
          line_item_amount,
          client_id,
          billing_project_id,
          direct_project_id,
          project_category_id,
          payment_detail_id,
          is_studio,
          payment_id,
          payment_desc,
          invoice_amount,
          processed,
          process_date,
          invoice_number,
          invoice_id,
          invoice_record_id,
          'Fixed Bug Fee' as source
      FROM
          invoice.fixed_bug_fee
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: payment_date {
    description: "Date on which the payment has been made"
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.payment_date ;;
  }

  dimension: contest_id {
    description: "Unique identifier for contests"
    type: number
    sql: ${TABLE}.contest_id ;;
  }

  dimension: client {
    description: "Name of the client"
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension: billing_project_name {
    description: "Name of the Billing project"
    type: string
    sql: ${TABLE}.billing_project_name ;;
  }

  dimension: direct_project_name {
    description: "Name of the direct project"
    type: string
    sql: ${TABLE}.direct_project_name ;;
  }

  dimension_group: launch_date {
    description: "Date on which the contest was launched"
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.launch_date ;;
  }

  dimension_group: completion_date {
    description: "Date on which the contest got completed"
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.completion_date ;;
  }

  dimension: category {
    description: "Cateogry of the contest like Bug hunt, code , marathon , Design etc"
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: contest_name {
    description: "Name of the contest"
    type: string
    sql: ${TABLE}.contest_name ;;
  }

  dimension: contest_status {
    description: "Status of the contest like Failed , Completed, Draft"
    type: string
    sql: ${TABLE}.contest_status ;;
  }

  dimension: actual_total_member_costs {
    description: "Total Prize given to members on the contest"
    type: number
    sql: ${TABLE}.actual_total_member_costs ;;
  }

  dimension: payment_type_desc {
    description: "Type of the payment like contest payment , bonus payment etc"
    type: string
    sql: ${TABLE}.payment_type_desc ;;
  }

  dimension: line_item_category {
    type: string
    sql: ${TABLE}.line_item_category ;;
  }

  dimension: reference_id {
    type: string
    sql: ${TABLE}.reference_id ;;
  }

  dimension: line_item_amount {
    type: number
    sql: ${TABLE}.line_item_amount ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: billing_project_id {
    description: "Unique Id of the billing account associated"
    type: number
    sql: ${TABLE}.billing_project_id ;;
  }

  dimension: direct_project_id {
    type: number
    sql: ${TABLE}.direct_project_id ;;
  }

  dimension: project_category_id {
    type: number
    sql: ${TABLE}.project_category_id ;;
  }

  dimension: payment_detail_id {
    type: number
    sql: ${TABLE}.payment_detail_id ;;
  }

  dimension: is_studio {
    type: string
    sql: ${TABLE}.is_studio ;;
  }

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension: payment_desc {
    type: string
    sql: ${TABLE}.payment_desc ;;
  }

  dimension: invoice_amount {
    type: number
    sql: ${TABLE}.invoice_amount ;;
  }

  dimension: processed {
    type: string
    sql: ${TABLE}.processed ;;
  }

  dimension_group: process_date {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      quarter,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.process_date ;;
  }

  dimension: invoice_number {
    type: string
    sql: ${TABLE}.invoice_number ;;
  }

  dimension: invoice_id {
    type: number
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: invoice_record_id {
    type: number
    sql: ${TABLE}.invoice_record_id ;;
  }

  dimension: source {
    description: "Source of the data"
    type: string
    sql: ${TABLE}.source ;;
  }

  set: detail {
    fields: [
      client,
      billing_project_name,
      direct_project_name,
      contest_name
    ]
  }
}
