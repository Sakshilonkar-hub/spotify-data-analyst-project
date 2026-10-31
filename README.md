# Project proof

This file documents the validation items included in the project repository.

## Data cleaning proof
- Raw dataset exists: `data/raw/spotify_listening_data.csv`
- Cleaned dataset exists: `data/cleaned/spotify_cleaned_data.csv`
- Cleaning logic is defined in `scripts/clean_spotify_data.py`
- Data quality checks include removing null values, duplicate records, and invalid timestamps

## SQL analysis proof
- SQL schema exists: `sql/schema.sql`
- Query examples exist: `sql/analytics_queries.sql`
- Summary exports generated: `results/top_tracks_summary.csv` and `results/artist_performance_summary.csv`

## AI workflow proof
- AI logic exists: `scripts/ai_workflow.py`
- AI output exists: `results/ai_insights.txt`
- Workflow converts SQL output into summarized recommendations

## Screenshot proof
- Overview screenshot: `assets/screenshots/spotify-overview.svg`
- Data cleaning screenshot: `assets/screenshots/data-cleaning.svg`
- AI workflow screenshot: `assets/screenshots/ai-insights.svg`

## Interpretation
The repository contains a complete end-to-end Spotify analytics project with proof artifacts showing that the task was implemented and documented.
