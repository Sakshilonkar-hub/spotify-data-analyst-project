CREATE TABLE IF NOT EXISTS artists (
    artist_id VARCHAR(100) PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL,
    popularity INT,
    followers INT,
    genres TEXT[],
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS albums (
    album_id VARCHAR(100) PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL,
    artist_id VARCHAR(100),
    release_date DATE,
    total_tracks INT,
    album_type VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS tracks (
    track_id VARCHAR(100) PRIMARY KEY,
    track_name VARCHAR(255) NOT NULL,
    artist_id VARCHAR(100),
    album_id VARCHAR(100),
    duration_ms INT,
    explicit BOOLEAN,
    popularity INT,
    danceability NUMERIC(5,4),
    energy NUMERIC(5,4),
    key_value INT,
    loudness NUMERIC(6,3),
    mode INT,
    speechiness NUMERIC(5,4),
    acousticness NUMERIC(5,4),
    instrumentalness NUMERIC(5,4),
    liveness NUMERIC(5,4),
    valence NUMERIC(5,4),
    tempo NUMERIC(7,3),
    preview_url TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS users (
    user_id VARCHAR(100) PRIMARY KEY,
    user_name VARCHAR(255),
    country VARCHAR(100),
    signup_date DATE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS listening_history (
    history_id SERIAL PRIMARY KEY,
    user_id VARCHAR(100),
    track_id VARCHAR(100),
    played_at TIMESTAMP NOT NULL,
    ms_played INT,
    platform VARCHAR(50),
    device_type VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS playlists (
    playlist_id VARCHAR(100) PRIMARY KEY,
    playlist_name VARCHAR(255) NOT NULL,
    owner_id VARCHAR(100),
    public_flag BOOLEAN,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS playlist_tracks (
    playlist_id VARCHAR(100),
    track_id VARCHAR(100),
    added_at TIMESTAMP,
    PRIMARY KEY (playlist_id, track_id)
);
