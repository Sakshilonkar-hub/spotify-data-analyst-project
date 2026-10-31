SELECT track_name, artist_name, COUNT(*) AS play_count
FROM listening_history lh
JOIN tracks t ON t.track_id = lh.track_id
JOIN artists a ON a.artist_id = t.artist_id
GROUP BY track_name, artist_name
ORDER BY play_count DESC
LIMIT 10;

SELECT artist_name, ROUND(SUM(ms_played) / 60000.0, 2) AS minutes_listened
FROM listening_history lh
JOIN tracks t ON t.track_id = lh.track_id
JOIN artists a ON a.artist_id = t.artist_id
GROUP BY artist_name
ORDER BY minutes_listened DESC
LIMIT 10;

SELECT EXTRACT(DOW FROM played_at) AS day_of_week, COUNT(*) AS plays
FROM listening_history
GROUP BY EXTRACT(DOW FROM played_at)
ORDER BY day_of_week;

SELECT CORR(tempo, popularity) AS tempo_popularity_correlation,
       CORR(energy, popularity) AS energy_popularity_correlation
FROM tracks;
