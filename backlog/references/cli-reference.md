# Backlog CLI Reference

## Commands

### `backlog init`
Initialize a new backlog database in the current directory.

### `backlog add TITLE`
Add a new item.
- `-s, --section TEXT` — Section/category (default: "general")
- `-p, --priority TEXT` — Priority: high, medium, low
- `-e, --effort TEXT` — Effort: S, M, L
- `-n, --notes TEXT` — Additional notes

### `backlog show ITEM_ID`
Show full details of an item.

### `backlog list`
List items (table format).
- `-s, --section TEXT` — Filter by section
- `-p, --priority TEXT` — Filter by priority
- `-e, --effort TEXT` — Filter by effort
- `--status TEXT` — Filter by status
- `-a, --all` — Include completed/wont_do items

### `backlog edit ITEM_ID`
Edit fields of an item.
- `-t, --title TEXT`
- `-s, --section TEXT`
- `-p, --priority TEXT`
- `-e, --effort TEXT`
- `--status TEXT`
- `-n, --notes TEXT`

### `backlog done ITEM_ID`
Mark item as completed.

### `backlog wontdo ITEM_ID`
Mark item as won't do.
- `-n, --notes TEXT` — Reason

### `backlog remove ITEM_ID`
Remove an item permanently.
- `-y, --yes` — Skip confirmation

### `backlog link ITEM_ID PATH`
Add a link (file path or URL) to an item.
- `-l, --label TEXT` — Label for the link

### `backlog unlink ITEM_ID PATH`
Remove a link from an item.

### `backlog sections`
List all sections.

## Statuses
- `backlog` (default)
- `completed` (via `done`)
- `wont_do` (via `wontdo`)
- Custom via `edit --status`

## Priority values: high, medium, low
## Effort values: S, M, L
