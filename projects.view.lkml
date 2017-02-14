view: connect_project {
  sql_table_name: public.projects ;;

  dimension: directprojectid {
    primary_key: yes
    type: number
    sql: ${TABLE}.directprojectid ;;
  }

  measure: actualprice {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.actualprice ;;
  }

  dimension: billingaccountid {
    type: number
    value_format_name: id
    sql: ${TABLE}.billingaccountid ;;
  }

  dimension: bookmarks {
    type: string
    sql: ${TABLE}.bookmarks ;;
  }

  dimension: challengeeligibility {
    type: string
    sql: ${TABLE}.challengeeligibility ;;
  }

  dimension_group: createdat {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.createdat ;;
  }

  dimension: createdby {
    type: number
    sql: ${TABLE}.createdby ;;
  }

  dimension_group: deletedat {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.deletedat ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: details {
    type: string
    sql: ${TABLE}.details ;;
  }

#  dimension: refcode {
#    sql: json_extract_path_text(${TABLE}.details, 'utm', 'code') ;;
#  }

  measure: estimatedprice {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.estimatedprice ;;
  }

  dimension: external {
    type: string
    sql: ${TABLE}.external ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: status {
    case: {
      when: {
        sql: ${TABLE}.status = 'draft' ;;
        label: "1: Draft"
      }
      when: {
        sql: ${TABLE}.status = 'in_review' ;;
        label: "2: In Review"
      }
      when: {
        sql: ${TABLE}.status = 'reviewed' ;;
        label: "3: Reviewed"
      }
      when: {
        sql: ${TABLE}.status = 'active' ;;
        label: "4: Active"
      }
      when: {
        sql: ${TABLE}.status = 'completed' ;;
        label: "5: Completed"
      }
      when: {
        sql: ${TABLE}.status = 'cancelled' ;;
        label: "6: Cancelled"
      }
      when: {
        sql: ${TABLE}.status = 'paused' ;;
        label: "7: Paused"
      }
      else: "8: Unknown"
    }
  }

    dimension: type {
      type: string
      sql: ${TABLE}.type ;;
    }

  dimension_group: updatedat {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updatedat ;;
  }

  dimension: updatedby {
    type: number
    sql: ${TABLE}.updatedby ;;
  }

  dimension: utm {
    type: string
    sql: ${TABLE}.utm ;;
  }

  measure: count {
    type: count
    drill_fields: [directprojectid, name, project_members.count]
  }
}
