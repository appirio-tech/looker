view: taas_payment {
    sql_table_name: tcs_dw.taas_payment ;;

    dimension: id {
      primary_key: yes
      type: string
      sql: ${TABLE}.id ;;
    }

    dimension: amount {
      type: number
      sql: ${TABLE}.amount__c ;;
    }

    dimension: challenge_id {
      type: number
      value_format_name: id
      sql: ${TABLE}.challenge_id__c ;;
    }

    dimension: challenge_link {
      type: string
      sql: ${TABLE}.challenge_link__c ;;
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
        year,
        fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
      ]
      sql: ${TABLE}.createddate ;;
    }

    dimension: is_editable {
      type: yesno
      sql: ${TABLE}.is_editable__c ;;
    }

    dimension: is_error {
      type: yesno
      sql: ${TABLE}.is_error__c ;;
    }

    dimension: key {
      type: string
      sql: ${TABLE}.key__c ;;
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
        year,
        fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
      ]
      sql: ${TABLE}.lastmodifieddate ;;
    }

    dimension: log {
      type: string
      sql: ${TABLE}.log__c ;;
    }

    dimension: name {
      type: string
      sql: ${TABLE}.name ;;
    }

    dimension_group: payment {
      type: time
      timeframes: [
        raw,
        time,
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
      sql: ${TABLE}.payment_date__c ;;
    }

    dimension: payment_type {
      type: string
      sql: ${TABLE}.payment_type__c ;;
    }

    dimension: is_read_only {
      type: yesno
      sql: ${TABLE}.read_only__c ;;
    }

    dimension: retry_count {
      type: number
      sql: ${TABLE}.retry_count__c ;;
    }

    dimension: status {
      type: string
      sql: ${TABLE}.status__c ;;
    }

    dimension: survey_log {
      type: string
      sql: ${TABLE}.survey_log__c ;;
    }

    dimension: survey_sent {
      type: yesno
      sql: ${TABLE}.survey_sent__c ;;
    }

    dimension: taas_resource {
      type: string
      sql: ${TABLE}.taas_resource__c ;;
    }

    dimension: taas_resource_handle {
      type: string
      sql: ${TABLE}.taas_resource_handle ;;
    }

    dimension_group: week_end {
      type: time
      timeframes: [
        raw,
        time,
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
      sql: ${TABLE}.week_end_date__c ;;
    }

    dimension_group: week_start {
      type: time
      timeframes: [
        raw,
        time,
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
      sql: ${TABLE}.week_start_date__c ;;
    }

    measure: count {
      type: count
      drill_fields: [id, name]
    }

    drill_fields: [id]
}
