# Spotify Data Analyst Project

A complete portfolio-ready analytics project built around Spotify listening behavior, PostgreSQL, SQL, and AI-driven insight generation.

## Project Overview
This project analyzes music listening trends using a Spotify-style dataset. The workflow includes:
- Data collection and documentation
- SQL schema creation and database setup
- Data cleaning and transformation
- Analytical queries for insights
- AI-based business summary generation
- Structured documentation and project proof files

## Business Use Case
A music streaming platform wants to understand:
- which tracks and artists drive engagement
- when users are most active
- which genres and moods perform best
- how AI can turn SQL results into executive insights

## Repository Structure
```text
spotify-data-analyst-project/
├── README.md
├── LICENSE
├── .gitignore
├── dataset/
│   └── dataset_source.md
├── sql/
│   ├── 01_setup.sql
│   ├── 02_data_cleaning.sql
│   └── 03_analysis_queries.sql
├── docs/
│   ├── AI_WORKFLOW.md
│   └── BUSINESS_INSIGHTS.md
├── screenshots/
│   └── dashboard.svg
└── .github/
    └── workflows/
        └── ci.yml
```

## Tech Stack
- PostgreSQL
- SQL
- Python (optional for ETL scripts)
- Pandas
- AI/LLM integration for summaries
- GitHub for project documentation and version control

## Setup Instructions

### 1. Start PostgreSQL
Use Docker or install PostgreSQL locally.

```bash
docker run --name spotify-db -e POSTGRES_DB=spotify_data -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres:15
```

### 2. Create database schema
```bash
psql -h localhost -U postgres -d spotify_data -f sql/01_setup.sql
```

### 3. Run data cleaning scripts or SQL
```bash
psql -h localhost -U postgres -d spotify_data -f sql/02_data_cleaning.sql
```

### 4. Run analysis queries
```bash
psql -h localhost -U postgres -d spotify_data -f sql/03_analysis_queries.sql
```

## Dataset
The project uses a Spotify-style listening dataset with information such as:
- track name
- artist name
- album name
- popularity score
- duration
- playback timestamp
- user ID
- genre

Dataset documentation is located in:
- `dataset/dataset_source.md`

## SQL Workflow
The `sql/` folder contains:
- `01_setup.sql` — table creation and primary keys
- `02_data_cleaning.sql` — cleaning logic and standardization
- `03_analysis_queries.sql` — queries for trends, ranking, and engagement analysis

## AI Workflow
The AI part of the project focuses on turning raw SQL results into business-friendly summaries.

Workflow:
1. Query PostgreSQL for music metrics
2. Export results in a structured format
3. Pass data to an LLM for analysis
4. Generate recommendations and executive summaries

For full details, see:
- `docs/AI_WORKFLOW.md`

## Business Insights
This project is designed to answer questions like:
- Which songs lead to the most engagement?
- Which artists receive the most listening time?
- When are users most active?
- Which content should be recommended next?

See:
- `docs/BUSINESS_INSIGHTS.md`

## Screenshot / Dashboard Preview
A dashboard-style overview is included in:
- `screenshots/dashboard.svg`

## Example Insights
- Upbeat pop tracks show the highest engagement
- Users tend to listen more during evening hours
- Popularity is often aligned with energy and mood-driven tracks
- Personalized playlist curation is a high-value recommendation opportunity

## Project Goals
- Build a practical SQL + analytics portfolio project
- Demonstrate data cleaning and transformation skills
- Show analytical thinking with Spotify-style metrics
- Integrate AI into a real business analytics workflow

## License
This project is licensed under the MIT License. See `LICENSE` for details.

## Author
Sakshilonkar-hub
