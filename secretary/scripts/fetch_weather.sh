#!/usr/bin/env bash
# Fetch current weather and 3-day forecast for Hanoi from Open-Meteo API
# Usage: fetch_weather.sh
# Output: formatted weather summary to stdout

set -euo pipefail

LAT=21.0285
LON=105.8542
TIMEZONE="Asia%2FHo_Chi_Minh"

API="https://api.open-meteo.com/v1/forecast?latitude=${LAT}&longitude=${LON}&timezone=${TIMEZONE}"
API="${API}&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m"
API="${API}&daily=temperature_2m_max,temperature_2m_min,weather_code,precipitation_probability_max"
API="${API}&forecast_days=3"

DATA=$(curl -sf "$API")

if [ -z "$DATA" ]; then
  echo "Weather: unavailable (API error)"
  exit 0
fi

python3 -c "
import json, sys
d = json.loads(sys.stdin.read())
c = d['current']
daily = d['daily']

codes = {0:'Clear',1:'Mostly clear',2:'Partly cloudy',3:'Overcast',
         45:'Foggy',48:'Fog',51:'Light drizzle',53:'Drizzle',55:'Heavy drizzle',
         61:'Light rain',63:'Rain',65:'Heavy rain',71:'Light snow',73:'Snow',
         75:'Heavy snow',80:'Light showers',81:'Showers',82:'Heavy showers',
         95:'Thunderstorm',96:'Thunderstorm+hail',99:'Severe thunderstorm'}

wc = codes.get(c['weather_code'], 'Unknown')
print(f\"**Now:** {c['temperature_2m']}°C, feels like {c['apparent_temperature']}°C · {wc} · Humidity {c['relative_humidity_2m']}% · Wind {c['wind_speed_10m']} km/h\")
print()
print('| Date | High | Low | Conditions | Rain |')
print('|------|------|-----|------------|------|')
for i in range(len(daily['time'])):
    dc = codes.get(daily['weather_code'][i], 'Unknown')
    rain = daily['precipitation_probability_max'][i]
    print(f\"| {daily['time'][i]} | {daily['temperature_2m_max'][i]}°C | {daily['temperature_2m_min'][i]}°C | {dc} | {rain}% |\")
" <<< "$DATA"
