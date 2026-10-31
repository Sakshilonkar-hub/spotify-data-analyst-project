import pandas as pd
from pathlib import Path

CLEANED_PATH = Path("data/cleaned/spotify_cleaned_data.csv")
TOP_TRACKS_PATH = Path("results/top_tracks_summary.csv")
ARTIST_PATH = Path("results/artist_performance_summary.csv")
TOP_TRACKS_PATH.parent.mkdir(parents=True, exist_ok=True)


def main():
    df = pd.read_csv(CLEANED_PATH)

    top_tracks = (
        df.groupby(["track_name", "artist_name"], as_index=False)
        .size()
        .rename(columns={"size": "play_count"})
        .sort_values("play_count", ascending=False)
        .head(10)
    )
    top_tracks.to_csv(TOP_TRACKS_PATH, index=False)

    artist_performance = (
        df.groupby(["artist_name"], as_index=False)
        .agg(play_count=("track_name", "size"), minutes_listened=("duration_minutes", "sum"))
        .sort_values(["play_count", "minutes_listened"], ascending=False)
        .head(10)
    )
    artist_performance.to_csv(ARTIST_PATH, index=False)

    print(f"Top tracks saved to {TOP_TRACKS_PATH}")
    print(f"Artist summaries saved to {ARTIST_PATH}")


if __name__ == "__main__":
    main()
