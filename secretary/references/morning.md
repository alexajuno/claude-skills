# Morning Briefing

## Data Sources

1. **Weather** — run `scripts/fetch_weather.sh` (relative to skill dir)
2. **Calendar** — fetch today's events from Google Calendar MCP (`primary` calendar, timezone `Asia/Ho_Chi_Minh`)
3. **Tasks** — run `task status:pending +OVERDUE` for overdue, `task status:pending due:today` for today's tasks, `task status:pending due.after:today due.before:4d` for upcoming

## Output Format

Produce this markdown structure:

```
# Good morning — YYYY-MM-DD

## Weather
[fetch_weather.sh output]

## Today's Schedule
[Calendar events listed chronologically with time and title]
[If no events: "Nothing on the calendar today."]

## Tasks

### Overdue
[Overdue tasks with due date, priority, project]
[If none: skip section]

### Due Today
[Tasks due today with priority, project]
[If none: "No tasks due today."]

### Upcoming (next 3 days)
[Tasks due in next 3 days]
[If none: skip section]

### High Priority
[Any priority:H tasks not already listed above]
[If none: skip section]
```

## Notes
- Keep it scannable. No prose, just structured data.
- If a section has no items, skip it entirely (except Weather and Today's Schedule).
