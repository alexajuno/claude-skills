# Task Management

## Taskwarrior (Source of Truth)

All task operations go through Taskwarrior CLI.

### Common Commands

| Action | Command |
|--------|---------|
| Add task | `task add "description" [due:YYYY-MM-DD] [priority:H\|M\|L] [project:name] [+tag]` |
| List all | `task list` |
| Due today | `task due:today list` |
| Overdue | `task +OVERDUE list` |
| Complete | `task <id> done` |
| Modify | `task <id> modify [field:value]` |
| Delete | `task <id> delete` |
| Annotate | `task <id> annotate "note"` |
| By project | `task project:name list` |
| High priority | `task priority:H list` |

### Priority Levels
- **H** — Must do, time-sensitive or blocking
- **M** — Should do, important but not urgent
- **L** — Nice to do, can wait

### Projects
Group related tasks: `task add "thing" project:work`, `project:personal`, `project:learning`, etc.

## Google Tasks (Phone Notification Relay)

Google Tasks is ONLY used to push deadline reminders to the phone. It is NOT the source of truth.

### When to Sync

Sync a task to Google Tasks when:
- It has a due date
- The user explicitly asks for a phone reminder
- It's high priority with a deadline

### How to Sync

Use Google Workspace MCP to create a Google Task:
- Title: task description
- Due date: task due date
- Notes: "Synced from Taskwarrior"

### What NOT to Sync
- Tasks without due dates
- Low priority tasks (unless user asks)
- Completed tasks (delete from Google Tasks when done in Taskwarrior)
