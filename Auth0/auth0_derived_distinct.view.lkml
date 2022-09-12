view: auth0_derived_distinct {
  derived_table: {
    sql: select distinct(
        select count (distinct user_name) from spectrum.auth0 where type = 's'  and client_name <> ''  and client_name = 'Account-App-New-Flow' and user_name not like '%topcoder.com%' and user_name not like '%wipro.com%' and month = EXTRACT(month FROM CURRENT_DATE)) as current_month,
        (select count (distinct user_name) from spectrum.auth0 where type = 's'  and client_name <> ''  and client_name = 'Account-App-New-Flow' and user_name not like '%topcoder.com%' and user_name not like '%wipro.com%' and EXTRACT( week FROM (date + '1 day'::interval)) = EXTRACT( week FROM (current_date + '1 day'::interval)) and year >= EXTRACT(year FROM (current_date))) as current_week,
         (select count (distinct user_name) from spectrum.auth0 where type = 's'  and client_name <> ''  and client_name = 'Account-App-New-Flow' and user_name not like '%topcoder.com%' and user_name not like '%wipro.com%' and EXTRACT( week FROM (date + '1 day'::interval)) >= (EXTRACT( week FROM (current_date + '1 day'::interval))-1) and year >= EXTRACT(year FROM (current_date))) as two_week,
          (select count (distinct user_name) from spectrum.auth0 where type = 's'  and client_name <> ''  and client_name = 'Account-App-New-Flow' and user_name not like '%topcoder.com%' and user_name not like '%wipro.com%' and EXTRACT( week FROM (date + '1 day'::interval)) >= (EXTRACT( week FROM (current_date + '1 day'::interval))-2) and year >= EXTRACT(year FROM (current_date))) as three_week,
           (select count (distinct user_name) from spectrum.auth0 where type = 's'  and client_name <> ''  and client_name = 'Account-App-New-Flow' and user_name not like '%topcoder.com%' and user_name not like '%wipro.com%' and EXTRACT( week FROM (date + '1 day'::interval)) >= (EXTRACT( week FROM (current_date + '1 day'::interval))-3) and year >= EXTRACT(year FROM (current_date))) as four_week,

      (select count (distinct user_name) from spectrum.auth0 where type = 's'  and client_name <> ''  and client_name = 'Account-App-New-Flow' and user_name not like '%topcoder.com%' and user_name not like '%wipro.com%' and day = EXTRACT(day FROM (current_date)) and month >= EXTRACT(month FROM (current_date)) and year >= EXTRACT(year FROM (current_date))) as current_day,
      (select count (distinct user_name) from spectrum.auth0 where type = 's'  and client_name <> ''  and client_name = 'Account-App-New-Flow' and user_name not like '%topcoder.com%' and user_name not like '%wipro.com%' and day >= EXTRACT(day FROM (current_date)-1) and month >= EXTRACT(month FROM (current_date)) and year >= EXTRACT(year FROM (current_date))) as two_day,
      (select count (distinct user_name) from spectrum.auth0 where type = 's'  and client_name <> ''  and client_name = 'Account-App-New-Flow' and user_name not like '%topcoder.com%' and user_name not like '%wipro.com%' and day >= EXTRACT(day FROM (current_date)-2) and month >= EXTRACT(month FROM (current_date)) and year >= EXTRACT(year FROM (current_date))) as three_day,
      (select count (distinct user_name) from spectrum.auth0 where type = 's'  and client_name <> ''  and client_name = 'Account-App-New-Flow' and user_name not like '%topcoder.com%' and user_name not like '%wipro.com%' and day >= EXTRACT(day FROM (current_date)-3) and  month >= EXTRACT(month FROM (current_date)) and year >= EXTRACT(year FROM (current_date))) as four_day,
      (select count (distinct user_name) from spectrum.auth0 where type = 's'  and client_name <> ''  and client_name = 'Account-App-New-Flow' and user_name not like '%topcoder.com%' and user_name not like '%wipro.com%' and day >= EXTRACT(day FROM (current_date)-4) and  month >= EXTRACT(month FROM (current_date)) and year >= EXTRACT(year FROM (current_date))) as five_day
      from spectrum.auth0
      ;;

  }

  measure: current_month {
    type: sum
    sql: ${TABLE}.current_month ;;
    group_label: "Month"
  }

  measure: current_week {
    type: sum
    sql: ${TABLE}.current_week ;;
    group_label: "Week"
  }


  measure: two_week {
    type: sum
    sql: ${TABLE}.two_week ;;
    group_label: "Week"
  }


  measure: three_week {
    type: sum
    sql: ${TABLE}.three_week ;;
    group_label: "Week"
  }

  measure: four_week {
    type: sum
    sql: ${TABLE}.four_week ;;
    group_label: "Week"
  }


  measure: current_day {
    type: sum
    sql: ${TABLE}.current_day ;;
    group_label: "Day"
  }


  measure: two_day {
    type: sum
    sql: ${TABLE}.two_day ;;
    group_label: "Day"
  }



  measure: three_day {
    type: sum
    sql: ${TABLE}.three_day ;;
    group_label: "Day"
  }

  measure: four_day {
    type: sum
    sql: ${TABLE}.four_day ;;
    group_label: "Day"
  }

  measure: five_day {
    type: sum
    sql: ${TABLE}.five_day ;;
    group_label: "Day"
  }



}
