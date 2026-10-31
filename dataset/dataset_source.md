# Dataset Source

## Overview
This project uses a Spotify-style listening dataset designed to mimic real-world streaming analytics. It contains listening records, track metadata, and artist information that support SQL analysis and AI-driven recommendations.

## Example Data Fields
The dataset may contain columns such as:
- user_id
- track_name
- artist_name
- album_name
- genre
- duration_ms
- popularity
- played_at
- country

## Why This Dataset Works
This structure is suitable for:
- user engagement analytics
- top-track and top-artist analysis
- genre performance tracking
- recommendations and personalization analysis

## Data Quality Considerations
During processing, the data may require:
- removal of null values
- duplicate handling
- time normalization
- standardization of artist and track names
- conversion of duration into readable units

## Use in the Project
This dataset is used to:
- create PostgreSQL tables
- clean and transform data
- run analytics queries
- generate actionable business insights with AI
