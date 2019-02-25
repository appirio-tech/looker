view: challenge_user_payments {
  derived_table: {
    sql: select project_id,
         user_id,
         submit_ind,
         placed,
         payment,
         case when submit_ind = 1 then 'submitter' else 'registrant' end as "Role"
      from project_result
union all
select p.project_id,
       r.reviewer_id,
       null,
       null,
       p.review_cost,
       'reviewer' as role
      from project p
      left outer join submission_review r on p.project_id = r.project_id
union all
select project_id,
       copilot,
       null,
       null,
       copilot_cost,
       'copilot' as role
      from project
union all
select project_id,
       user_id,
       submit_ind,
       placement,
       prize_amount,
       case when submit_ind = 1 then 'submitter' else 'registrant' end as "Role"
      from design_project_result

  ;;
  }

  dimension: challenge_id {
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: submit_ind {
    type: number
    sql: ${TABLE}.submit_ind ;;
  }

  dimension: placed {
    type: number
    sql: ${TABLE}.placed ;;
  }

  measure: payment {
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.payment ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

}
