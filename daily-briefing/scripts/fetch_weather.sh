#!/bin/bash
# Fetch weather from Open-Meteo API using location config
# Usage: fetch_weather.sh
# Reads location from ~/.config/location.json

LOCATION_CONFIG="$HOME/.config/location.json"

CURRENT=$(jq -r '.current' "$LOCATION_CONFIG" 2>/dev/null || echo "hanoi")
LAT=$(jq -r ".locations[\"$CURRENT\"].lat" "$LOCATION_CONFIG" 2>/dev/null || echo "21.0285")
LON=$(jq -r ".locations[\"$CURRENT\"].lon" "$LOCATION_CONFIG" 2>/dev/null || echo "105.8542")
CITY=$(jq -r ".locations[\"$CURRENT\"].name" "$LOCATION_CONFIG" 2>/dev/null || echo "Hanoi")

WEATHER=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=$LAT&longitude=$LON&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m&daily=temperature_2m_max,temperature_2m_min,weather_code,precipitation_probability_max&timezone=Asia/Bangkok&forecast_days=3")

echo "LOCATION: $CITY ($CURRENT)"
echo "---"
echo "$WEATHER"
