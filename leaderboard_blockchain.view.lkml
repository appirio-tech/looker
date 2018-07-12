view: leaderboard_blockchain {
  derived_table: {
    sql: -- use existing challenge_stats in looker_pdt.LR$QHY53IIP7DTWBXYUSV84D_challenge_stats
      -- use existing challenge_groups in looker_pdt.LR$QHFX5NFZM40OH5AU6AB4C_challenge_groups
      SELECT
        challenge_stats.winner_handle  AS "challenge_stats.winner_handle",
        challenge_stats.winner_id  AS "challenge_stats.winner_id",
        challenge_stats.photo_url  AS "challenge_stats.photo_url",
        COUNT(DISTINCT challenge_stats.project_id ) AS "challenge_stats.count",
        SUM(CASE WHEN challenge_stats.placed between 1 and 3 THEN 500 WHEN challenge_stats.placed between 4 and 10 THEN 350 ELSE 100 END) AS "challenge_stats.points"
      FROM looker_pdt.LR$QHY53IIP7DTWBXYUSV84D_challenge_stats AS challenge_stats
      LEFT JOIN looker_pdt.LR$QHFX5NFZM40OH5AU6AB4C_challenge_groups AS challenge_groups ON challenge_stats.project_id = challenge_groups.challenge_id
      LEFT JOIN tcs_dw.project_technology  AS challenge_technology ON challenge_stats.project_id = challenge_technology.project_id
      WHERE (((challenge_stats.posting_date ) >= (TIMESTAMP '2018-05-01')
        AND (challenge_stats.posting_date ) < (TIMESTAMP '2018-07-31')))
        AND (challenge_technology.name ILIKE 'Blockchain')
        AND challenge_stats.placed >= 1
      GROUP BY 1,2,3
      ORDER BY 5 DESC
      --LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: challenge_stats_winner_handle {
    type: string
    sql: ${TABLE}."challenge_stats.winner_handle" ;;
  }

  dimension: challenge_stats_winner_id {
    type: number
    sql: ${TABLE}."challenge_stats.winner_id" ;;
  }

  dimension: challenge_stats_photo_url {
    type: string
    sql: ${TABLE}."challenge_stats.photo_url" ;;
  }

  dimension: challenge_stats_count {
    type: number
    sql: ${TABLE}."challenge_stats.count" ;;
  }

  dimension: sum {
    type: number
    sql: ${TABLE}.sum ;;
  }

  set: detail {
    fields: [challenge_stats_winner_handle, challenge_stats_winner_id, challenge_stats_photo_url, challenge_stats_count, sum]
  }
}
