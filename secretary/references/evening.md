# Evening Recap

## Data Sources

1. **Calendar** — fetch today's events from Google Calendar MCP
2. **Completed tasks** — run `task end:today completed`
3. **Pending/overdue** — run `task status:pending +OVERDUE` and `task status:pending due:today`
4. **Tomorrow** — fetch tomorrow's events from Google Calendar MCP, run `task status:pending due:tomorrow`

## Output Format

```
# Evening recap — YYYY-MM-DD

## Today
### Events
[Calendar events that happened today]
[If none: "No events today."]

### Completed
[Tasks marked done today]
[If none: "No tasks completed today."]

### Still Pending
[Overdue + due-today tasks not completed]
[If none: skip section]

## Tomorrow
### Schedule
[Tomorrow's calendar events]
[If none: "Nothing scheduled tomorrow."]

### Due
[Tasks due tomorrow]
[If none: "No tasks due tomorrow."]
```

## Notes
- Tone: brief, factual. Not reflective — that's for weekly.
- End with tomorrow's preview so the user sleeps knowing what's ahead.

## Time Tracking

After showing completed tasks and pending items, add a time tracking step:

1. Run `timeport sync --date today` to sync today's calendar
2. Run `timeport report today` to show the day's time breakdown
3. Show the output to the user
4. Ask: "Anything to correct?" — if yes, run `timeport correct` commands
