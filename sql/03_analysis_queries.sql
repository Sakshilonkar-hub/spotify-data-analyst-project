-- 03_analysis_queries.sql
-- Core analytical queries for Spotify music engagement insights

-- 1. Top tracks by listening count
SELECT
    t.track_name,
    a.artist_name,
    COUNT(*) AS play_count
FROM listening_history lh
JOIN tracks t ON t.track_id = lh.track_id
JOIN artists a ON a.artist_id = t.artist_id
GROUP BY t.track_name, a.artist_name
ORDER BY play_count DESC
LIMIT 10;

-- 2. Top artists by total listening time
SELECT
    a.artist_name,
    ROUND(SUM(lh.ms_played) / 60000.0, 2) AS total_minutes_listened
FROM listening_history lh
JOIN tracks t ON t.track_id = lh.track_id
JOIN artists a ON a.artist_id = t.artist_id
GROUP BY a.artist_name
ORDER BY total_minutes_listened DESC
LIMIT 10;

-- 3. Most active users
SELECT
    u.user_name,
    COUNT(*) AS total_plays,
    ROUND(SUM(lh.ms_played) / 60000.0, 2) AS total_minutes
FROM listening_history lh
JOIN users u ON u.user_id = lh.user_id
GROUP BY u.user_name
ORDER BY total_plays DESC
LIMIT 10;

-- 4. Listening activity by day of week
SELECT
    EXTRACT(DOW FROM played_at) AS day_of_week,
    COUNT(*) AS plays
FROM listening_history
GROUP BY EXTRACT(DOW FROM played_at)
ORDER BY day_of_week;

-- 5. Popularity vs energy correlation
SELECT
    CORR(t.energy, t.popularity) AS energy_popularity_correlation,
    CORR(t.valence, t.popularity) AS valence_popularity_correlation
FROM tracks t;
