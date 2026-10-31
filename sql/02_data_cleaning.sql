-- 02_data_cleaning.sql
-- SQL-based cleaning and standardization tasks

-- Example: standardize text case in artist and track names
UPDATE artists
SET artist_name = INITCAP(TRIM(artist_name));

UPDATE tracks
SET track_name = INITCAP(TRIM(track_name));

-- Example: remove invalid or blank data from user names
UPDATE users
SET user_name = COALESCE(NULLIF(TRIM(user_name), ''), 'Unknown User');

-- Example: convert milliseconds to minutes view
CREATE OR REPLACE VIEW track_duration_minutes AS
SELECT
    track_id,
    track_name,
    ROUND(duration_ms / 60000.0, 2) AS duration_minutes
FROM tracks;

-- Example: identify duplicates in listening records
SELECT
    user_id,
    track_id,
    played_at,
    COUNT(*) AS duplicate_count
FROM listening_history
GROUP BY user_id, track_id, played_at
HAVING COUNT(*) > 1;

-- Example: clean invalid timestamps by filtering to valid records
SELECT *
FROM listening_history
WHERE played_at IS NOT NULL;
