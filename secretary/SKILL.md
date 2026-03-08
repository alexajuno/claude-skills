---
name: secretary
description: Personal secretary for daily schedule, task management, and reflections. Provides morning briefings (weather, calendar, tasks), evening recaps, weekly reflections, and full task management via Taskwarrior. Triggers on "/secretary", "/secretary morning", "/secretary evening", "/secretary weekly", "/secretary tasks", "morning briefing", "evening recap", "weekly reflection", "my tasks", "what's on today", "what do I have today", "task dashboard", or any request about schedule/tasks/briefing.
---

# Secretary

Personal secretary — schedule, tasks, and reflections.

## Subcommands

| Command | Mode | Reference |
|---------|------|-----------|
| `/secretary` or `/secretary morning` | Morning briefing | [morning.md](references/morning.md) |
| `/secretary evening` | Evening recap | [evening.md](references/evening.md) |
| `/secretary weekly` | Weekly reflection | [weekly.md](references/weekly.md) |
| `/secretary tasks` | Task dashboard | [task-management.md](references/task-management.md) |
| `/secretary time` | Time portfolio | [time.md](references/time.md) |

## Routing

1. Parse the argument (default: `morning`)
2. Read the corresponding reference file
3. Follow its data-gathering and output instructions exactly

## Tools Required

- **Bash** — run `task` (Taskwarrior) commands and `scripts/fetch_weather.sh`
- **Google Calendar MCP** — `mcp__google-calendar__list-events` for schedule data
- **Google Workspace MCP** — `mcp__google-workspace__create_task`, `mcp__google-workspace__list_tasks` for phone notification sync
- **Read** — daily entries from `~/life/daily/` (weekly mode)
- **Write** — weekly reflection to `~/life/weekly/` (weekly mode)

## Scheduling

Set up via `/scheduler:schedule-add`:
- Morning briefing: daily at chosen time
- Evening recap: daily at chosen time
- Weekly reflection: Sunday evening at chosen time
