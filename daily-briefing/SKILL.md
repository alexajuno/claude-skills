---
name: weather
description: Fetch current weather and 3-day forecast for user's configured location. Use when user asks about weather, temperature, forecast, "what's the weather", "how cold is it", "do I need a jacket", or mentions location changes like "I'm in thanhhoa" or "I'm back in hanoi". Also triggers on "start a new day" or "daily briefing".
---

# Weather

Fetch real-time weather from Open-Meteo API based on user's configured location.

## Fetching Weather

Run `scripts/fetch_weather.sh` to get current conditions and 3-day forecast. Parse the JSON output and present conversationally:

- Current: temperature, feels like, humidity, wind, conditions
- 3-day forecast: high/low, conditions, rain probability
- Use WMO weather codes: 0=clear, 1-3=partly cloudy, 45/48=fog, 51-67=rain, 71-86=snow, 95-99=thunderstorm

Keep it brief — just the useful info, no tables.

## Changing Location

When user says "I'm in [place]" or asks to change location, run:

```bash
scripts/set_location.sh <key>
```

Available keys are defined in `~/.config/location.json`. Current locations:
- `hanoi` — Hanoi (default)
- `thanhhoa` — Kim Tan, Thach Thanh, Thanh Hoa

To add a new location, edit `~/.config/location.json` and add a new entry under `locations` with `lat`, `lon`, and `name`.
