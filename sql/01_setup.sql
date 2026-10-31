-- 01_setup.sql
-- PostgreSQL setup for Spotify data analytics project

CREATE TABLE IF NOT EXISTS artists (
    artist_id SERIAL PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL,
    popularity INT,
    followers INT,
    genres TEXT[]
);

CREATE TABLE IF NOT EXISTS albums (
    album_id SERIAL PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL,
    artist_id INT REFERENCES artists(artist_id),
    release_date DATE,
    total_tracks INT,
    album_type VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS tracks (
    track_id SERIAL PRIMARY KEY,
    track_name VARCHAR(255) NOT NULL,
    artist_id INT REFERENCES artists(artist_id),
    album_id INT REFERENCES albums(album_id),
    duration_ms INT,
    popularity INT,
    danceability NUMERIC(5,4),
    energy NUMERIC(5,4),
    valence NUMERIC(5,4),
    tempo NUMERIC(7,3),
    genre VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(255),
    country VARCHAR(100),
    signup_date DATE
);

CREATE TABLE IF NOT EXISTS listening_history (
    history_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    track_id INT REFERENCES tracks(track_id),
    played_at TIMESTAMP NOT NULL,
    ms_played INT,
    platform VARCHAR(50),
    device_type VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS playlists (
    playlist_id SERIAL PRIMARY KEY,
    playlist_name VARCHAR(255) NOT NULL,
    owner_id INT REFERENCES users(user_id),
    public_flag BOOLEAN
);

CREATE TABLE IF NOT EXISTS playlist_tracks (
    playlist_id INT REFERENCES playlists(playlist_id),
    track_id INT REFERENCES tracks(track_id),
    added_at TIMESTAMP,
    PRIMARY KEY (playlist_id, track_id)
);

CREATE INDEX IF NOT EXISTS idx_listening_user_id ON listening_history(user_id);
CREATE INDEX IF NOT EXISTS idx_listening_track_id ON listening_history(track_id);
CREATE INDEX IF NOT EXISTS idx_listening_played_at ON listening_history(played_at);
