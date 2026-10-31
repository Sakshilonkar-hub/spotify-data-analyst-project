# AI Workflow

## Goal
The AI component transforms raw SQL output into readable, business-ready narrative insights.

## Process
1. Run a SQL query against the PostgreSQL database.
2. Export the result set into a JSON or table format.
3. Pass the data to an LLM with a business-focused prompt.
4. Ask the model to summarize:
   - top trends
   - user behavior patterns
   - recommended actions
   - strategic opportunities

## Example Prompt
```text
You are a Spotify data analyst. Review the listening data and provide:
- the main trends
- the strongest-performing tracks and artists
- recommendations for playlist strategy
- a short executive summary for business stakeholders
```

## Why This Matters
SQL explains what happened. AI explains why it matters.

This project combines both layers to create a realistic data analyst workflow used in modern analytics teams.
