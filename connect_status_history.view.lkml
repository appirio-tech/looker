 view: connect_status_history {
  derived_table: {
    sql_create:
      create table ${SQL_TABLE_NAME}
      AS
       select
        id,
        project_id,
        status,
        created_at as status_start_date,
        cancel_reason,
        updated_by,
        lead(created_at, 1) over (partition by project_id order by created_at) as status_end_date,
        datediff(hours,status_start_date,status_end_date) as duration

      from connect_project_status_history
      order by project_id, status_start_date;;

      sql_trigger_value: select max(id) from connect_project_status_history;;

    }

    dimension: id {
      type: number
      primary_key: yes
      description: "Connect Project History Table ID"
      value_format_name: id
      sql: ${TABLE}.id ;;
    }

    dimension: project_id {
      type: number
      hidden: yes
      description: "Connect Project Id"
      value_format_name: id
      sql: ${TABLE}.project_id ;;
    }

    dimension: status {
      type: string
      description: "Connect Project Status"
      sql: ${TABLE}.status ;;
    }

    dimension_group: status_start {
      type: time
      description: "Date when the project entered the Status"
      sql: ${TABLE}.status_start_date ;;
      timeframes: [time, date, week, month]
    }

    dimension: cancel_reason {
      type: string
      description: "If the project was cancelled the reason for cancellation"
      sql: ${TABLE}.cancel_reason ;;
    }

    dimension: updated_by {
      type: number
      value_format_name: id
      description: "User Id of the user who modified the status"
      sql: ${TABLE}.updated_by ;;
    }

    dimension_group: status_end {
      type: time
      description: "Date when the project exited the Status"
      sql: ${TABLE}.status_end_date ;;
      timeframes: [time, date, week, month]
    }

    measure: duration_hours {
      type: sum_distinct
      description: "Status Duration (in Hours)"
      sql: ${TABLE}.duration ;;
    }

    measure: duration {
      type: sum_distinct
      description: "Status Duration (in Days)"
      sql: ${TABLE}.duration / 24 ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    set: detail {
      fields: [
        id,
        project_id,
        status_start_date,
        status_end_date,
        cancel_reason,
        updated_by,
        duration,
        duration_hours
      ]
    }
  }
