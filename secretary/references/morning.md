# Morning Briefing

## Data Sources

1. **Weather** — run `scripts/fetch_weather.sh` (relative to skill dir)
2. **Calendar** — fetch today's events from Google Calendar MCP (`primary` calendar, timezone `Asia/Ho_Chi_Minh`)
3. **Tasks** — run `task status:pending +OVERDUE` for overdue, `task status:pending due:today` for today's tasks, `task status:pending due.after:today due.before:4d` for upcoming
