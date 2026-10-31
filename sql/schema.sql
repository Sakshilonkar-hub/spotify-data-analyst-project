version: "3.9"

services:
  db:
    image: postgres:15
    container_name: spotify_db
    restart: always
    environment:
      POSTGRES_DB: spotify_data
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
    ports:
      - "5432:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres -d spotify_data"]
      interval: 10s
      timeout: 5s
      retries: 5

volumes:
  pgdata:
