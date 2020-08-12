view: member_max_rating {
  derived_table: {
    sql:  select  user_id,
                  rating,
                  track,
                  sub_track
          from tcs_dw.member_stats as ms1
          where rating = (select max(ms2.rating) from tcs_dw.member_stats ms2 where ms1.user_id = ms2.user_id)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    description: "User_id"
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: rating {
    description: "Maximum rating of the member across all tracks"
    type: number
    sql: ${TABLE}.rating ;;
  }

  dimension: track {
    description: "Track for which the user has maximum rating"
    type: string
    sql: ${TABLE}.track ;;
  }

  dimension: sub_track {
    description: "Sub track for which the user has maximum rating"
    type: string
    sql: ${TABLE}.sub_track ;;
  }

  set: detail {
    fields: [user_id, rating, track, sub_track]
  }

  }
