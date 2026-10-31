import pandas as pd
from pathlib import Path

RAW_PATH = Path("data/raw/spotify_listening_data.csv")
CLEANED_PATH = Path("data/cleaned/spotify_cleaned_data.csv")
CLEANED_PATH.parent.mkdir(parents=True, exist_ok=True)


def clean_data(df: pd.DataFrame) -> pd.DataFrame:
    df = df.dropna(subset=["track_name", "artist_name", "played_at"]).copy()
    df = df.drop_duplicates()
    df["track_name"] = df["track_name"].str.strip().str.title()
    df["artist_name"] = df["artist_name"].str.strip().str.title()
    df["album_name"] = df["album_name"].fillna("Unknown Album").str.strip().str.title()
    df["genre"] = df["genre"].fillna("Unknown Genre").str.strip().str.title()
    df["duration_minutes"] = (df["duration_ms"] / 60000).round(2)
    df["played_at"] = pd.to_datetime(df["played_at"], errors="coerce")
    df = df.dropna(subset=["played_at"]).reset_index(drop=True)
    return df


def main():
    df = pd.read_csv(RAW_PATH)
    cleaned = clean_data(df)
    cleaned.to_csv(CLEANED_PATH, index=False)
    print(f"Saved cleaned data to {CLEANED_PATH} ({len(cleaned)} rows)")


if __name__ == "__main__":
    main()
