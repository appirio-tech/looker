view: executive_board {
  derived_table: {
    sql:SELECT  date,

          (SELECT count(*) FROM tcs_dw.project  as challenge
       LEFT JOIN tcs_dw.client_project_dim  AS client_project_dim ON client_project_dim.client_project_id = challenge.client_project_id
LEFT JOIN tcs_dw.sfdc_account  AS sfdc_account ON (CASE
         when client_project_dim.subscription_opportunity_subcontracting_end_customer__c is not null
               then client_project_dim.subscription_opportunity_subcontracting_end_customer__c
         when client_project_dim.subscription_subcontracting_end_customer__c is not null
               then client_project_dim.subscription_subcontracting_end_customer__c

        when client_project_dim.subscription_account__c is not null
               then client_project_dim.subscription_account__c
        when client_project_dim.sfdc_account is not null
               then client_project_dim.sfdc_account
    else NULL
    END) = sfdc_account.id

where date_trunc('day', posting_date) <= c.date and date_trunc('day', scheduled_end_date) >= c.date and task_ind = 0 and challenge.client_project_id != 80000062 and status_desc not in ('Draft', 'Deleted', 'New', 'Inactive') AND  sfdc_account.name <> '[topcoder] copilots' and sfdc_account.name  <>  'Topcoder') as Count_of_Challenges_Posted,

          (SELECT count(*) FROM tcs_dw.project  as challenge
       LEFT JOIN tcs_dw.client_project_dim  AS client_project_dim ON client_project_dim.client_project_id = challenge.client_project_id
LEFT JOIN tcs_dw.sfdc_account  AS sfdc_account ON (CASE
         when client_project_dim.subscription_opportunity_subcontracting_end_customer__c is not null
               then client_project_dim.subscription_opportunity_subcontracting_end_customer__c
         when client_project_dim.subscription_subcontracting_end_customer__c is not null
               then client_project_dim.subscription_subcontracting_end_customer__c

        when client_project_dim.subscription_account__c is not null
               then client_project_dim.subscription_account__c
        when client_project_dim.sfdc_account is not null
               then client_project_dim.sfdc_account
    else NULL
    END) = sfdc_account.id where date_trunc('day', posting_date) = c.date and  task_ind = 0 and challenge.client_project_id != 80000062 and status_desc not in ('Draft', 'Deleted', 'New', 'Inactive')AND  sfdc_account.name  <>  '[topcoder] copilots' AND  sfdc_account.name  <>  'Topcoder')   as Newly_Posted,


          (SELECT count(*) FROM tcs_dw.project  as challenge
       LEFT JOIN tcs_dw.client_project_dim  AS client_project_dim ON client_project_dim.client_project_id = challenge.client_project_id
LEFT JOIN tcs_dw.sfdc_account  AS sfdc_account ON (CASE
         when client_project_dim.subscription_opportunity_subcontracting_end_customer__c is not null
               then client_project_dim.subscription_opportunity_subcontracting_end_customer__c
         when client_project_dim.subscription_subcontracting_end_customer__c is not null
               then client_project_dim.subscription_subcontracting_end_customer__c

        when client_project_dim.subscription_account__c is not null
               then client_project_dim.subscription_account__c
        when client_project_dim.sfdc_account is not null
               then client_project_dim.sfdc_account
    else NULL
    END) = sfdc_account.id where date_trunc('day', posting_date) <= c.date and date_trunc('day', registration_end_date) >= c.date and  task_ind = 0 and challenge.client_project_id != 80000062 and status_desc not in ('Draft', 'Deleted', 'New', 'Inactive')AND  sfdc_account.name  <>  '[topcoder] copilots' and  sfdc_account.name  <>  'Topcoder')  as Count_of_Challenges_Open_For_Registration,

(SELECT count(*) FROM heapdata.pageviews p left join heapdata.users  u on  p.user_id = u.user_id  where date_trunc('day', time) = c.date and  (u._email not like '%wipro.com%' AND u._email not like '%appirio.com%' AND u._email not like '%topcoder.com%') ) as Pageviews,

(SELECT count(*) FROM heapdata.pageviews p left join heapdata.users  u on  p.user_id = u.user_id  where date_trunc('day', time) = c.date and  p.domain = 'www.topcoder.com' and (u._email not like '%wipro.com%' AND u._email not like '%appirio.com%' AND u._email not like '%topcoder.com%') ) as Topcoder.com_Pageviews


(SELECT count(*)  FROM coder WHERE status = 'A' and email not like '%wipro.com%' AND email not like '%appirio.com%' AND email not like '%topcoder.com%'  and  date_trunc('day', create_date) = c.date) as Active_Members,

(SELECT count(*)  FROM coder WHERE status = 'U' and email not like '%wipro.com%' AND email not like '%appirio.com%' AND email not like '%topcoder.com%'  and  date_trunc('day', create_date) = c.date) as Inactive_Members,

(SELECT count(*)  FROM coder WHERE (status = 'U' or status = 'A') and email not like '%wipro.com%' AND email not like '%appirio.com%' AND email not like '%topcoder.com%' and date_trunc('day', create_date) = c.date)  as Total_Members,

           (select count(distinct user_id) from (select dpr.project_id , dpr.user_id , dpr.inquire_timestamp, p.client_project_id from tcs_dw.design_project_result dpr left join tcs_dw.project p on dpr.project_id = p.project_id where p.client_project_id != 80000062 and p.task_ind = 0

union

 select pr.project_id , pr.user_id , pr.inquire_timestamp, p.client_project_id from tcs_dw.project_result pr left join tcs_dw.project p on pr.project_id = p.project_id where p.client_project_id != 80000062 and p.task_ind = 0 ) as challenge_registration_union where date_trunc('day', inquire_timestamp) = c.date) as non_topgear_distinct_challenge_registrants,

           (select count(distinct user_id) from (select dpr.project_id , dpr.user_id , dpr.inquire_timestamp, p.client_project_id, dpr.submit_ind from tcs_dw.design_project_result dpr left join tcs_dw.project p on dpr.project_id = p.project_id where p.client_project_id != 80000062 and p.task_ind = 0

union

 select pr.project_id , pr.user_id , pr.inquire_timestamp, p.client_project_id , pr.submit_ind from tcs_dw.project_result pr left join tcs_dw.project p on pr.project_id = p.project_id where p.client_project_id != 80000062  and p.task_ind = 0) as challenge_submission_union where date_trunc('day', inquire_timestamp) = c.date and submit_ind = 1) as non_topgear_challenge_submissions,

(select count(distinct registrant_handle from (SELECT
       p.project_id + pr.user_id + random() as challenge_stats_pkey,
       p.project_id,
       p.component_id,
       p.component_name,
       p.exclude_from_TCO,
       p.tco_track,
       p.num_registrations,
       p.num_submissions,
       p.num_valid_submissions,
       p.avg_raw_score,
       p.avg_final_score,
       p.phase_id,
       p.phase_desc,
       p.category_id,
       p.category_desc,
       p.posting_date,
       p.submitby_date,
       p.complete_date as complete_date,
       p.review_phase_id,
       p.review_phase_name,
       p.status_id,
       p.status_desc,
       CASE
          WHEN p.status_desc = 'Cancelled - Requirements Infeasible' THEN 'Dismissed'
          WHEN p.status_desc = 'Cancelled - Client Request' THEN 'Dismissed'
          WHEN p.status_desc = 'Cancelled - Failed Review' THEN 'Cancelled'
          WHEN p.status_desc = 'Cancelled - Failed Screening' THEN 'Cancelled'
          WHEN p.status_desc = 'Cancelled - Zero Submissions' THEN 'Cancelled'
          ELSE 'Completed'
       END AS Fulfilled,
       p.level_id,
       p.rating_date,
       p.viewable_category_ind,
       p.num_submissions_passed_review,
       p.winner_id,
       winner.handle AS winner_handle,
       p.stage_id,
       p.digital_run_ind,
       p.suspended_ind,
       p.project_category_id,
       p.project_category_name,
       p.tc_direct_project_id,
       direct_project.name AS project_name,
       --direct_project.billing_project_id AS billing_account_id,
       client_project.project_name as billing_account_name,
       client_project.customer_number,
       client_project.client_name,
       p.admin_fee,
       p.contest_prizes_total,
       p.client_project_id  AS billing_account_id,
       p.start_date_calendar_id,
       p.duration,
       p.fulfillment,
       p.last_modification_date,
       p.first_place_prize,
       p.num_checkpoint_submissions,
       p.num_valid_checkpoint_submissions,
       p.total_prize,
       p.checkpoint_start_date,
       p.checkpoint_end_date,
       p.challenge_manager AS challenge_manager_id,
       challenge_manager.handle AS challenge_manager,
       p.challenge_creator AS challenge_creator_id,
       challenge_creator.handle AS challenge_creator,
       p.copilot AS copilot_id,
       challenge_copilot.handle AS challenge_copilot,
       p.challenge_launcher AS challenge_launcher_id,
       challenge_launcher.handle AS challenge_launcher_handle,
       p.registration_end_date,
       p.scheduled_end_date,
       p.checkpoint_prize_amount,
       p.checkpoint_prize_number,
       p.dr_points,
       p.reliability_cost,
       p.review_cost,
       p.forum_id,
       p.submission_viewable,
       p.is_private,
       p.actual_total_prize,
       p.copilot_cost,
       p.estimated_reliability_cost,
       p.estimated_review_cost,
       p.estimated_copilot_cost,
       p.estimated_admin_fee,
       pr.user_id AS registrant_id,
       challenge_registrant.handle AS registrant_handle,
       pr.submit_ind,
       pr.valid_submission_ind,
       pr.raw_score,
       pr.final_score,
       pr.inquire_timestamp,
       pr.submit_timestamp,
       pr.review_complete_timestamp,
       pr.payment,
       pr.old_rating,
       pr.new_rating,
       pr.old_reliability,
       pr.new_reliability,
       pr.placed,
       pr.rating_ind,
       pr.passed_review_ind,
       pr.points_awarded,
       pr.final_points,
       pr.potential_points,
       pr.reliable_submission_ind,
       pr.num_appeals,
       pr.num_successful_appeals,
       pr.old_rating_id,
       pr.new_rating_id,
       pr.num_ratings,
       pr.rating_order,
       c.photo_url,
       p.task_ind,
       p.effort_offshore_days,
       p.effort_onshore_days,
       p.technology_list,
       p.tco_flag,
       member_profile.photo_url AS member_photo_url,
      --added on 20th Dec
      null as prize_type_id,
       null as total_placements
FROM tcs_dw.project p LEFT OUTER JOIN tcs_dw.project_result pr ON p.project_id = pr.project_id
     LEFT OUTER JOIN tcs_dw.direct_project_dim direct_project ON p.tc_direct_project_id = direct_project.direct_project_id
     LEFT OUTER JOIN tcs_dw.client_project_dim client_project ON p.client_project_id = client_project.billing_project_id
     LEFT OUTER JOIN tcs_dw.coder c ON pr.user_id = c.coder_id
     LEFT OUTER JOIN tcs_dw.coder winner ON p.winner_id = winner.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_manager ON p.challenge_manager = challenge_manager.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_creator ON p.challenge_creator = challenge_creator.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_launcher ON p.challenge_launcher = challenge_launcher.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_copilot ON p.copilot = challenge_copilot.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_registrant ON pr.user_id = challenge_registrant.coder_id
     LEFT OUTER JOIN tcs_dw.member_profile member_profile ON pr.user_id = member_profile.user_id
LEFT JOIN tcs_dw.sfdc_account  AS sfdc_account ON (CASE
         when client_project.subscription_opportunity_subcontracting_end_customer__c is not null
               then client_project.subscription_opportunity_subcontracting_end_customer__c
         when client_project.subscription_subcontracting_end_customer__c is not null
               then client_project.subscription_subcontracting_end_customer__c

        when client_project.subscription_account__c is not null
               then client_project.subscription_account__c
        when client_project.sfdc_account is not null
               then client_project.sfdc_account
    else NULL
    END) = sfdc_account.id

     Where p.client_project_id != 80000062  and p.task_ind = 0 AND  sfdc_account.name <> '[topcoder] copilots' and sfdc_account.name  <>  'Topcoder'

UNION
SELECT
       p.project_id + pr.user_id + random() as challenge_stats_pkey,
       p.project_id,
       p.component_id,
       p.component_name,
       p.exclude_from_TCO,
       p.tco_track,
       p.num_registrations,
       p.num_submissions,
       p.num_valid_submissions,
       p.avg_raw_score,
       p.avg_final_score,
       p.phase_id,
       p.phase_desc,
       p.category_id,
       p.category_desc,
       p.posting_date,
       p.submitby_date,
       p.complete_date as complete_date,
       p.review_phase_id,
       p.review_phase_name,
       p.status_id,
       p.status_desc,
       CASE
          WHEN p.status_desc = 'Completed' THEN 'Completed'
          WHEN p.status_desc = 'Cancelled - Failed Review' THEN 'Cancelled'
          WHEN p.status_desc = 'Cancelled - Failed Screening' THEN 'Cancelled'
          WHEN p.status_desc = 'Cancelled - Zero Submissions' THEN 'Cancelled'
          ELSE 'Cancelled-Client Request'
       END AS Fulfilled,
       p.level_id,
       p.rating_date,
       p.viewable_category_ind,
       p.num_submissions_passed_review,
       p.winner_id,
       winner.handle AS winner_handle,
       p.stage_id,
       p.digital_run_ind,
       p.suspended_ind,
       p.project_category_id,
       p.project_category_name,
       p.tc_direct_project_id,
       direct_project.name AS project_name,
       --direct_project.billing_project_id AS billing_account_id,
       client_project.project_name as billing_account_name,
       client_project.customer_number,
       client_project.client_name,
       p.admin_fee,
       p.contest_prizes_total,
       p.client_project_id  AS billing_account_id,
       p.start_date_calendar_id,
       p.duration,
       p.fulfillment,
       p.last_modification_date,
       p.first_place_prize,
       p.num_checkpoint_submissions,
       p.num_valid_checkpoint_submissions,
       p.total_prize,
       p.checkpoint_start_date,
       p.checkpoint_end_date,
       p.challenge_manager AS challenge_manager_id,
       challenge_manager.handle AS challenge_manager,
       p.challenge_creator AS challenge_creator_id,
       challenge_creator.handle AS challenge_creator,
       p.copilot AS copilot_id,
       challenge_copilot.handle AS challenge_copilot,
       p.challenge_launcher AS challenge_launcher_id,
       challenge_launcher.handle AS challenge_launcher_handle,
       p.registration_end_date,
       p.scheduled_end_date,
       p.checkpoint_prize_amount,
       p.checkpoint_prize_number,
       p.dr_points,
       p.reliability_cost,
       p.review_cost,
       p.forum_id,
       p.submission_viewable,
       p.is_private,
       p.actual_total_prize,
       p.copilot_cost,
       p.estimated_reliability_cost,
       p.estimated_review_cost,
       p.estimated_copilot_cost,
       p.estimated_admin_fee,
       pr.user_id AS registrant_id,
       challenge_registrant.handle AS registrant_handle,
       pr.submit_ind,
       pr.valid_submission_ind,
       null AS raw_score,
       null AS final_score,
       pr.inquire_timestamp,
       pr.submit_timestamp,
       pr.review_complete_timestamp,
       pr.prize_amount AS payment,
       null AS old_rating,
       null AS new_rating,
       null AS old_reliability,
       null AS new_reliability,
       pr.placement AS placed,
       null AS rating_ind,
       null AS passed_review_ind,
       null AS points_awarded,
       null AS final_points,
       null AS potential_points,
       null AS reliable_submission_ind,
       null AS num_appeals,
       null AS num_successful_appeals,
       null AS old_rating_id,
       null AS new_rating_id,
       null AS num_ratings,
       null AS rating_order,
       c.photo_url,
       p.task_ind,
       p.effort_offshore_days,
       p.effort_onshore_days,
       p.technology_list,
       p.tco_flag,
       member_profile.photo_url AS member_photo_url,
      --added on 20th Dec
      pr.prize_type_id,
       pr.total_placements
FROM tcs_dw.project p LEFT OUTER JOIN
     tcs_dw.design_project_result pr ON p.project_id = pr.project_id
     LEFT OUTER JOIN tcs_dw.direct_project_dim direct_project ON p.tc_direct_project_id = direct_project.direct_project_id
     LEFT OUTER JOIN tcs_dw.client_project_dim client_project ON p.client_project_id = client_project.billing_project_id
     LEFT OUTER JOIN tcs_dw.coder c ON pr.user_id = c.coder_id
     LEFT OUTER JOIN tcs_dw.coder winner ON p.winner_id = winner.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_manager ON p.challenge_manager = challenge_manager.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_creator ON p.challenge_creator = challenge_creator.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_launcher ON p.challenge_launcher = challenge_launcher.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_copilot ON p.copilot = challenge_copilot.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_registrant ON pr.user_id = challenge_registrant.coder_id
     LEFT OUTER JOIN tcs_dw.member_profile member_profile ON pr.user_id = member_profile.user_id
     LEFT JOIN tcs_dw.sfdc_account  AS sfdc_account ON (CASE
         when client_project.subscription_opportunity_subcontracting_end_customer__c is not null
               then client_project.subscription_opportunity_subcontracting_end_customer__c
         when client_project.subscription_subcontracting_end_customer__c is not null
               then client_project.subscription_subcontracting_end_customer__c

        when client_project.subscription_account__c is not null
               then client_project.subscription_account__c
        when client_project.sfdc_account is not null
               then client_project.sfdc_account
    else NULL
    END) = sfdc_account.id

    Where p.client_project_id != 80000062  and p.task_ind = 0 AND  sfdc_account.name <> '[topcoder] copilots' and sfdc_account.name  <>  'Topcoder') as union_stats where date_trunc('day',posting_date) = c.date) as Count_Distinct_Registrants,

(select count(distinct registrant_handle) from (SELECT
       p.project_id + pr.user_id + random() as challenge_stats_pkey,
       p.project_id,
       p.component_id,
       p.component_name,
       p.exclude_from_TCO,
       p.tco_track,
       p.num_registrations,
       p.num_submissions,
       p.num_valid_submissions,
       p.avg_raw_score,
       p.avg_final_score,
       p.phase_id,
       p.phase_desc,
       p.category_id,
       p.category_desc,
       p.posting_date,
       p.submitby_date,
       p.complete_date as complete_date,
       p.review_phase_id,
       p.review_phase_name,
       p.status_id,
       p.status_desc,
       CASE
          WHEN p.status_desc = 'Cancelled - Requirements Infeasible' THEN 'Dismissed'
          WHEN p.status_desc = 'Cancelled - Client Request' THEN 'Dismissed'
          WHEN p.status_desc = 'Cancelled - Failed Review' THEN 'Cancelled'
          WHEN p.status_desc = 'Cancelled - Failed Screening' THEN 'Cancelled'
          WHEN p.status_desc = 'Cancelled - Zero Submissions' THEN 'Cancelled'
          ELSE 'Completed'
       END AS Fulfilled,
       p.level_id,
       p.rating_date,
       p.viewable_category_ind,
       p.num_submissions_passed_review,
       p.winner_id,
       winner.handle AS winner_handle,
       p.stage_id,
       p.digital_run_ind,
       p.suspended_ind,
       p.project_category_id,
       p.project_category_name,
       p.tc_direct_project_id,
       direct_project.name AS project_name,
       --direct_project.billing_project_id AS billing_account_id,
       client_project.project_name as billing_account_name,
       client_project.customer_number,
       client_project.client_name,
       p.admin_fee,
       p.contest_prizes_total,
       p.client_project_id  AS billing_account_id,
       p.start_date_calendar_id,
       p.duration,
       p.fulfillment,
       p.last_modification_date,
       p.first_place_prize,
       p.num_checkpoint_submissions,
       p.num_valid_checkpoint_submissions,
       p.total_prize,
       p.checkpoint_start_date,
       p.checkpoint_end_date,
       p.challenge_manager AS challenge_manager_id,
       challenge_manager.handle AS challenge_manager,
       p.challenge_creator AS challenge_creator_id,
       challenge_creator.handle AS challenge_creator,
       p.copilot AS copilot_id,
       challenge_copilot.handle AS challenge_copilot,
       p.challenge_launcher AS challenge_launcher_id,
       challenge_launcher.handle AS challenge_launcher_handle,
       p.registration_end_date,
       p.scheduled_end_date,
       p.checkpoint_prize_amount,
       p.checkpoint_prize_number,
       p.dr_points,
       p.reliability_cost,
       p.review_cost,
       p.forum_id,
       p.submission_viewable,
       p.is_private,
       p.actual_total_prize,
       p.copilot_cost,
       p.estimated_reliability_cost,
       p.estimated_review_cost,
       p.estimated_copilot_cost,
       p.estimated_admin_fee,
       pr.user_id AS registrant_id,
       challenge_registrant.handle AS registrant_handle,
       pr.submit_ind,
       pr.valid_submission_ind,
       pr.raw_score,
       pr.final_score,
       pr.inquire_timestamp,
       pr.submit_timestamp,
       pr.review_complete_timestamp,
       pr.payment,
       pr.old_rating,
       pr.new_rating,
       pr.old_reliability,
       pr.new_reliability,
       pr.placed,
       pr.rating_ind,
       pr.passed_review_ind,
       pr.points_awarded,
       pr.final_points,
       pr.potential_points,
       pr.reliable_submission_ind,
       pr.num_appeals,
       pr.num_successful_appeals,
       pr.old_rating_id,
       pr.new_rating_id,
       pr.num_ratings,
       pr.rating_order,
       c.photo_url,
       p.task_ind,
       p.effort_offshore_days,
       p.effort_onshore_days,
       p.technology_list,
       p.tco_flag,
       member_profile.photo_url AS member_photo_url,
      --added on 20th Dec
      null as prize_type_id,
       null as total_placements
FROM tcs_dw.project p LEFT OUTER JOIN tcs_dw.project_result pr ON p.project_id = pr.project_id
     LEFT OUTER JOIN tcs_dw.direct_project_dim direct_project ON p.tc_direct_project_id = direct_project.direct_project_id
     LEFT OUTER JOIN tcs_dw.client_project_dim client_project ON p.client_project_id = client_project.billing_project_id
     LEFT OUTER JOIN tcs_dw.coder c ON pr.user_id = c.coder_id
     LEFT OUTER JOIN tcs_dw.coder winner ON p.winner_id = winner.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_manager ON p.challenge_manager = challenge_manager.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_creator ON p.challenge_creator = challenge_creator.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_launcher ON p.challenge_launcher = challenge_launcher.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_copilot ON p.copilot = challenge_copilot.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_registrant ON pr.user_id = challenge_registrant.coder_id
     LEFT OUTER JOIN tcs_dw.member_profile member_profile ON pr.user_id = member_profile.user_id
LEFT JOIN tcs_dw.sfdc_account  AS sfdc_account ON (CASE
         when client_project.subscription_opportunity_subcontracting_end_customer__c is not null
               then client_project.subscription_opportunity_subcontracting_end_customer__c
         when client_project.subscription_subcontracting_end_customer__c is not null
               then client_project.subscription_subcontracting_end_customer__c

        when client_project.subscription_account__c is not null
               then client_project.subscription_account__c
        when client_project.sfdc_account is not null
               then client_project.sfdc_account
    else NULL
    END) = sfdc_account.id
    left join challenge_groups on challenge_groups.challenge_id = p.project_id

     Where p.client_project_id != 80000062  and p.task_ind = 0 AND  sfdc_account.name <> '[topcoder] copilots' and sfdc_account.name  <>  'Topcoder' and submit_ind = 1

UNION
SELECT
       p.project_id + pr.user_id + random() as challenge_stats_pkey,
       p.project_id,
       p.component_id,
       p.component_name,
       p.exclude_from_TCO,
       p.tco_track,
       p.num_registrations,
       p.num_submissions,
       p.num_valid_submissions,
       p.avg_raw_score,
       p.avg_final_score,
       p.phase_id,
       p.phase_desc,
       p.category_id,
       p.category_desc,
       p.posting_date,
       p.submitby_date,
       p.complete_date as complete_date,
       p.review_phase_id,
       p.review_phase_name,
       p.status_id,
       p.status_desc,
       CASE
          WHEN p.status_desc = 'Completed' THEN 'Completed'
          WHEN p.status_desc = 'Cancelled - Failed Review' THEN 'Cancelled'
          WHEN p.status_desc = 'Cancelled - Failed Screening' THEN 'Cancelled'
          WHEN p.status_desc = 'Cancelled - Zero Submissions' THEN 'Cancelled'
          ELSE 'Cancelled-Client Request'
       END AS Fulfilled,
       p.level_id,
       p.rating_date,
       p.viewable_category_ind,
       p.num_submissions_passed_review,
       p.winner_id,
       winner.handle AS winner_handle,
       p.stage_id,
       p.digital_run_ind,
       p.suspended_ind,
       p.project_category_id,
       p.project_category_name,
       p.tc_direct_project_id,
       direct_project.name AS project_name,
       --direct_project.billing_project_id AS billing_account_id,
       client_project.project_name as billing_account_name,
       client_project.customer_number,
       client_project.client_name,
       p.admin_fee,
       p.contest_prizes_total,
       p.client_project_id  AS billing_account_id,
       p.start_date_calendar_id,
       p.duration,
       p.fulfillment,
       p.last_modification_date,
       p.first_place_prize,
       p.num_checkpoint_submissions,
       p.num_valid_checkpoint_submissions,
       p.total_prize,
       p.checkpoint_start_date,
       p.checkpoint_end_date,
       p.challenge_manager AS challenge_manager_id,
       challenge_manager.handle AS challenge_manager,
       p.challenge_creator AS challenge_creator_id,
       challenge_creator.handle AS challenge_creator,
       p.copilot AS copilot_id,
       challenge_copilot.handle AS challenge_copilot,
       p.challenge_launcher AS challenge_launcher_id,
       challenge_launcher.handle AS challenge_launcher_handle,
       p.registration_end_date,
       p.scheduled_end_date,
       p.checkpoint_prize_amount,
       p.checkpoint_prize_number,
       p.dr_points,
       p.reliability_cost,
       p.review_cost,
       p.forum_id,
       p.submission_viewable,
       p.is_private,
       p.actual_total_prize,
       p.copilot_cost,
       p.estimated_reliability_cost,
       p.estimated_review_cost,
       p.estimated_copilot_cost,
       p.estimated_admin_fee,
       pr.user_id AS registrant_id,
       challenge_registrant.handle AS registrant_handle,
       pr.submit_ind,
       pr.valid_submission_ind,
       null AS raw_score,
       null AS final_score,
       pr.inquire_timestamp,
       pr.submit_timestamp,
       pr.review_complete_timestamp,
       pr.prize_amount AS payment,
       null AS old_rating,
       null AS new_rating,
       null AS old_reliability,
       null AS new_reliability,
       pr.placement AS placed,
       null AS rating_ind,
       null AS passed_review_ind,
       null AS points_awarded,
       null AS final_points,
       null AS potential_points,
       null AS reliable_submission_ind,
       null AS num_appeals,
       null AS num_successful_appeals,
       null AS old_rating_id,
       null AS new_rating_id,
       null AS num_ratings,
       null AS rating_order,
       c.photo_url,
       p.task_ind,
       p.effort_offshore_days,
       p.effort_onshore_days,
       p.technology_list,
       p.tco_flag,
       member_profile.photo_url AS member_photo_url,
      --added on 20th Dec
      pr.prize_type_id,
       pr.total_placements
FROM tcs_dw.project p LEFT OUTER JOIN
     tcs_dw.design_project_result pr ON p.project_id = pr.project_id
     LEFT OUTER JOIN tcs_dw.direct_project_dim direct_project ON p.tc_direct_project_id = direct_project.direct_project_id
     LEFT OUTER JOIN tcs_dw.client_project_dim client_project ON p.client_project_id = client_project.billing_project_id
     LEFT OUTER JOIN tcs_dw.coder c ON pr.user_id = c.coder_id
     LEFT OUTER JOIN tcs_dw.coder winner ON p.winner_id = winner.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_manager ON p.challenge_manager = challenge_manager.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_creator ON p.challenge_creator = challenge_creator.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_launcher ON p.challenge_launcher = challenge_launcher.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_copilot ON p.copilot = challenge_copilot.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_registrant ON pr.user_id = challenge_registrant.coder_id
     LEFT OUTER JOIN tcs_dw.member_profile member_profile ON pr.user_id = member_profile.user_id
     LEFT JOIN tcs_dw.sfdc_account  AS sfdc_account ON (CASE
         when client_project.subscription_opportunity_subcontracting_end_customer__c is not null
               then client_project.subscription_opportunity_subcontracting_end_customer__c
         when client_project.subscription_subcontracting_end_customer__c is not null
               then client_project.subscription_subcontracting_end_customer__c

        when client_project.subscription_account__c is not null
               then client_project.subscription_account__c
        when client_project.sfdc_account is not null
               then client_project.sfdc_account
    else NULL
    END) = sfdc_account.id

left join challenge_groups on challenge_groups.challenge_id = p.project_id

    Where p.client_project_id != 80000062  and p.task_ind = 0 AND  sfdc_account.name <> '[topcoder] copilots' and sfdc_account.name  <>  'Topcoder' and submit_ind = 1 ) as union_stats where date_trunc('day',posting_date) = c.date) as Count_Distinct_Submitters,


(select count(distinct winner_handle) from (SELECT
       p.project_id + pr.user_id + random() as challenge_stats_pkey,
       p.project_id,
       p.component_id,
       p.component_name,
       p.exclude_from_TCO,
       p.tco_track,
       p.num_registrations,
       p.num_submissions,
       p.num_valid_submissions,
       p.avg_raw_score,
       p.avg_final_score,
       p.phase_id,
       p.phase_desc,
       p.category_id,
       p.category_desc,
       p.posting_date,
       p.submitby_date,
       p.complete_date as complete_date,
       p.review_phase_id,
       p.review_phase_name,
       p.status_id,
       p.status_desc,
       CASE
          WHEN p.status_desc = 'Cancelled - Requirements Infeasible' THEN 'Dismissed'
          WHEN p.status_desc = 'Cancelled - Client Request' THEN 'Dismissed'
          WHEN p.status_desc = 'Cancelled - Failed Review' THEN 'Cancelled'
          WHEN p.status_desc = 'Cancelled - Failed Screening' THEN 'Cancelled'
          WHEN p.status_desc = 'Cancelled - Zero Submissions' THEN 'Cancelled'
          ELSE 'Completed'
       END AS Fulfilled,
       p.level_id,
       p.rating_date,
       p.viewable_category_ind,
       p.num_submissions_passed_review,
       p.winner_id,
       winner.handle AS winner_handle,
       p.stage_id,
       p.digital_run_ind,
       p.suspended_ind,
       p.project_category_id,
       p.project_category_name,
       p.tc_direct_project_id,
       direct_project.name AS project_name,
       --direct_project.billing_project_id AS billing_account_id,
       client_project.project_name as billing_account_name,
       client_project.customer_number,
       client_project.client_name,
       p.admin_fee,
       p.contest_prizes_total,
       p.client_project_id  AS billing_account_id,
       p.start_date_calendar_id,
       p.duration,
       p.fulfillment,
       p.last_modification_date,
       p.first_place_prize,
       p.num_checkpoint_submissions,
       p.num_valid_checkpoint_submissions,
       p.total_prize,
       p.checkpoint_start_date,
       p.checkpoint_end_date,
       p.challenge_manager AS challenge_manager_id,
       challenge_manager.handle AS challenge_manager,
       p.challenge_creator AS challenge_creator_id,
       challenge_creator.handle AS challenge_creator,
       p.copilot AS copilot_id,
       challenge_copilot.handle AS challenge_copilot,
       p.challenge_launcher AS challenge_launcher_id,
       challenge_launcher.handle AS challenge_launcher_handle,
       p.registration_end_date,
       p.scheduled_end_date,
       p.checkpoint_prize_amount,
       p.checkpoint_prize_number,
       p.dr_points,
       p.reliability_cost,
       p.review_cost,
       p.forum_id,
       p.submission_viewable,
       p.is_private,
       p.actual_total_prize,
       p.copilot_cost,
       p.estimated_reliability_cost,
       p.estimated_review_cost,
       p.estimated_copilot_cost,
       p.estimated_admin_fee,
       pr.user_id AS registrant_id,
       challenge_registrant.handle AS registrant_handle,
       pr.submit_ind,
       pr.valid_submission_ind,
       pr.raw_score,
       pr.final_score,
       pr.inquire_timestamp,
       pr.submit_timestamp,
       pr.review_complete_timestamp,
       pr.payment,
       pr.old_rating,
       pr.new_rating,
       pr.old_reliability,
       pr.new_reliability,
       pr.placed,
       pr.rating_ind,
       pr.passed_review_ind,
       pr.points_awarded,
       pr.final_points,
       pr.potential_points,
       pr.reliable_submission_ind,
       pr.num_appeals,
       pr.num_successful_appeals,
       pr.old_rating_id,
       pr.new_rating_id,
       pr.num_ratings,
       pr.rating_order,
       c.photo_url,
       p.task_ind,
       p.effort_offshore_days,
       p.effort_onshore_days,
       p.technology_list,
       p.tco_flag,
       member_profile.photo_url AS member_photo_url,
      --added on 20th Dec
      null as prize_type_id,
       null as total_placements
FROM tcs_dw.project p LEFT OUTER JOIN tcs_dw.project_result pr ON p.project_id = pr.project_id
     LEFT OUTER JOIN tcs_dw.direct_project_dim direct_project ON p.tc_direct_project_id = direct_project.direct_project_id
     LEFT OUTER JOIN tcs_dw.client_project_dim client_project ON p.client_project_id = client_project.billing_project_id
     LEFT OUTER JOIN tcs_dw.coder c ON pr.user_id = c.coder_id
     LEFT OUTER JOIN tcs_dw.coder winner ON p.winner_id = winner.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_manager ON p.challenge_manager = challenge_manager.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_creator ON p.challenge_creator = challenge_creator.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_launcher ON p.challenge_launcher = challenge_launcher.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_copilot ON p.copilot = challenge_copilot.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_registrant ON pr.user_id = challenge_registrant.coder_id
     LEFT OUTER JOIN tcs_dw.member_profile member_profile ON pr.user_id = member_profile.user_id
LEFT JOIN tcs_dw.sfdc_account  AS sfdc_account ON (CASE
         when client_project.subscription_opportunity_subcontracting_end_customer__c is not null
               then client_project.subscription_opportunity_subcontracting_end_customer__c
         when client_project.subscription_subcontracting_end_customer__c is not null
               then client_project.subscription_subcontracting_end_customer__c

        when client_project.subscription_account__c is not null
               then client_project.subscription_account__c
        when client_project.sfdc_account is not null
               then client_project.sfdc_account
    else NULL
    END) = sfdc_account.id

     Where p.client_project_id != 80000062  and p.task_ind = 0 AND  sfdc_account.name <> '[topcoder] copilots' and sfdc_account.name  <>  'Topcoder'

UNION
SELECT
       p.project_id + pr.user_id + random() as challenge_stats_pkey,
       p.project_id,
       p.component_id,
       p.component_name,
       p.exclude_from_TCO,
       p.tco_track,
       p.num_registrations,
       p.num_submissions,
       p.num_valid_submissions,
       p.avg_raw_score,
       p.avg_final_score,
       p.phase_id,
       p.phase_desc,
       p.category_id,
       p.category_desc,
       p.posting_date,
       p.submitby_date,
       p.complete_date as complete_date,
       p.review_phase_id,
       p.review_phase_name,
       p.status_id,
       p.status_desc,
       CASE
          WHEN p.status_desc = 'Completed' THEN 'Completed'
          WHEN p.status_desc = 'Cancelled - Failed Review' THEN 'Cancelled'
          WHEN p.status_desc = 'Cancelled - Failed Screening' THEN 'Cancelled'
          WHEN p.status_desc = 'Cancelled - Zero Submissions' THEN 'Cancelled'
          ELSE 'Cancelled-Client Request'
       END AS Fulfilled,
       p.level_id,
       p.rating_date,
       p.viewable_category_ind,
       p.num_submissions_passed_review,
       p.winner_id,
       winner.handle AS winner_handle,
       p.stage_id,
       p.digital_run_ind,
       p.suspended_ind,
       p.project_category_id,
       p.project_category_name,
       p.tc_direct_project_id,
       direct_project.name AS project_name,
       --direct_project.billing_project_id AS billing_account_id,
       client_project.project_name as billing_account_name,
       client_project.customer_number,
       client_project.client_name,
       p.admin_fee,
       p.contest_prizes_total,
       p.client_project_id  AS billing_account_id,
       p.start_date_calendar_id,
       p.duration,
       p.fulfillment,
       p.last_modification_date,
       p.first_place_prize,
       p.num_checkpoint_submissions,
       p.num_valid_checkpoint_submissions,
       p.total_prize,
       p.checkpoint_start_date,
       p.checkpoint_end_date,
       p.challenge_manager AS challenge_manager_id,
       challenge_manager.handle AS challenge_manager,
       p.challenge_creator AS challenge_creator_id,
       challenge_creator.handle AS challenge_creator,
       p.copilot AS copilot_id,
       challenge_copilot.handle AS challenge_copilot,
       p.challenge_launcher AS challenge_launcher_id,
       challenge_launcher.handle AS challenge_launcher_handle,
       p.registration_end_date,
       p.scheduled_end_date,
       p.checkpoint_prize_amount,
       p.checkpoint_prize_number,
       p.dr_points,
       p.reliability_cost,
       p.review_cost,
       p.forum_id,
       p.submission_viewable,
       p.is_private,
       p.actual_total_prize,
       p.copilot_cost,
       p.estimated_reliability_cost,
       p.estimated_review_cost,
       p.estimated_copilot_cost,
       p.estimated_admin_fee,
       pr.user_id AS registrant_id,
       challenge_registrant.handle AS registrant_handle,
       pr.submit_ind,
       pr.valid_submission_ind,
       null AS raw_score,
       null AS final_score,
       pr.inquire_timestamp,
       pr.submit_timestamp,
       pr.review_complete_timestamp,
       pr.prize_amount AS payment,
       null AS old_rating,
       null AS new_rating,
       null AS old_reliability,
       null AS new_reliability,
       pr.placement AS placed,
       null AS rating_ind,
       null AS passed_review_ind,
       null AS points_awarded,
       null AS final_points,
       null AS potential_points,
       null AS reliable_submission_ind,
       null AS num_appeals,
       null AS num_successful_appeals,
       null AS old_rating_id,
       null AS new_rating_id,
       null AS num_ratings,
       null AS rating_order,
       c.photo_url,
       p.task_ind,
       p.effort_offshore_days,
       p.effort_onshore_days,
       p.technology_list,
       p.tco_flag,
       member_profile.photo_url AS member_photo_url,
      --added on 20th Dec
      pr.prize_type_id,
       pr.total_placements
FROM tcs_dw.project p LEFT OUTER JOIN
     tcs_dw.design_project_result pr ON p.project_id = pr.project_id
     LEFT OUTER JOIN tcs_dw.direct_project_dim direct_project ON p.tc_direct_project_id = direct_project.direct_project_id
     LEFT OUTER JOIN tcs_dw.client_project_dim client_project ON p.client_project_id = client_project.billing_project_id
     LEFT OUTER JOIN tcs_dw.coder c ON pr.user_id = c.coder_id
     LEFT OUTER JOIN tcs_dw.coder winner ON p.winner_id = winner.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_manager ON p.challenge_manager = challenge_manager.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_creator ON p.challenge_creator = challenge_creator.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_launcher ON p.challenge_launcher = challenge_launcher.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_copilot ON p.copilot = challenge_copilot.coder_id
     LEFT OUTER JOIN tcs_dw.coder challenge_registrant ON pr.user_id = challenge_registrant.coder_id
     LEFT OUTER JOIN tcs_dw.member_profile member_profile ON pr.user_id = member_profile.user_id
     LEFT JOIN tcs_dw.sfdc_account  AS sfdc_account ON (CASE
         when client_project.subscription_opportunity_subcontracting_end_customer__c is not null
               then client_project.subscription_opportunity_subcontracting_end_customer__c
         when client_project.subscription_subcontracting_end_customer__c is not null
               then client_project.subscription_subcontracting_end_customer__c

        when client_project.subscription_account__c is not null
               then client_project.subscription_account__c
        when client_project.sfdc_account is not null
               then client_project.sfdc_account
    else NULL
    END) = sfdc_account.id

    Where p.client_project_id != 80000062  and p.task_ind = 0 AND  sfdc_account.name <> '[topcoder] copilots' and sfdc_account.name  <>  'Topcoder') as union_stats where date_trunc('day',posting_date) = c.date) as Count_Distinct_Winners



    FROM calendar c
    WHERE c.date < getdate() and c.date > '2017-01-01'
    GROUP BY 1
    Order by 1 desc
    ;;

 }

  dimension_group: event_date {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter
    ]
    sql: ${TABLE}.date ;;
  }


  measure: Count_of_Challenges_Posted {
    type: sum
    sql: ${TABLE}.Count_of_Challenges_Posted ;;
    group_label: "Challenges"
  }

  measure: Newly_Posted {
    type: sum
    sql: ${TABLE}.Newly_Posted ;;
    group_label: "Challenges"
  }

  measure: Count_of_Challenges_Open_For_Registration{
    type: sum
    sql: ${TABLE}.Count_of_Challenges_Open_For_Registration ;;
    group_label: "Challenges"
  }

  measure: Pageviews{
    type: sum
    sql: ${TABLE}.Pageviews ;;
    group_label: "Website"
  }

  measure: Topcoder.com_Pageviews{
    type: sum
    sql: ${TABLE}.Topcoder.com_Pageviews ;;
    group_label: "Website"
  }

  measure: Active_Members{
    type: sum
    sql: ${TABLE}.Active_Members ;;
    group_label: "Members"
  }

  measure: Inactive_Members{
    type: sum
    sql: ${TABLE}.Inactive_Members ;;
    group_label: "Members"
  }

  measure: Total_Members{
    type: sum
    sql: ${TABLE}.Total_Members ;;
    group_label: "Members"
  }

  measure: Count_Distinct_Registrants{
    type: sum
    sql: ${TABLE}.Count_Distinct_Registrants ;;
    group_label: "Challenges"
  }


  measure: Count_Distinct_Submitters{
    type: sum
    sql: ${TABLE}.Count_Distinct_Submitters ;;
    group_label: "Challenges"
  }


  measure: Count_Distinct_Winners{
    type: sum
    sql: ${TABLE}.Count_Distinct_Winners ;;
    group_label: "Challenges"
  }

}
