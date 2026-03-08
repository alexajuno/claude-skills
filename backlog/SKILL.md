---
name: backlog
description: Manage project backlog items using the `backlog` CLI. Use when the user mentions backlog, tasks to track, todo items for a project, adding/checking/completing backlog items, triaging work, or reviewing what needs to be done. Triggers on phrases like "check backlog", "add to backlog", "what's in the backlog", "mark done", "show backlog item", "triage", "what should I work on next", or any reference to project task tracking via the backlog tool.
---

# Backlog Management

Manage project backlogs via the `backlog` CLI. See [references/cli-reference.md](references/cli-reference.md) for full command reference.

## Quick Reference

```
backlog list                          # list open items
backlog list -a                       # include completed/wontdo
backlog list -s <section> -p <prio>   # filter
backlog show <id>                     # item details
backlog add "Title" -p high -e S -s feat -n "Notes"
backlog edit <id> -p medium -n "Updated notes"
backlog done <id>                     # mark completed
backlog wontdo <id> -n "Reason"       # mark won't do
backlog link <id> ./path/to/file      # attach file/URL
backlog sections                      # list sections
```

## Workflow Guidance

### When user asks "what should I work on" or checks backlog
1. Run `backlog list` to show current items
2. If items lack priority/effort, suggest triaging: "Some items are missing priority — want me to help triage?"
3. Recommend high-priority, low-effort items first (quick wins)

### When user completes a task
1. Run `backlog done <id>`
2. If the work produced relevant files, suggest linking: `backlog link <id> <path>`
3. Show remaining open items

### When adding items from conversation context
- Extract actionable items from discussion
- Suggest appropriate section, priority, effort based on context
- Confirm with user before adding

### Triage workflow
When asked to triage or review the backlog:
1. `backlog list` to see all open items
2. For each item missing priority/effort, show it and ask the user
3. Suggest grouping related items into sections
4. Flag stale items (old, no activity) for review — ask if still relevant

### Linking related work
When implementing a backlog item, link relevant files:
```
backlog link <id> ./src/feature.ts -l "Implementation"
backlog link <id> https://github.com/repo/pull/123 -l "PR"
```

## Important
- Always run `backlog list` first to understand current state before any operation
- Use `backlog show <id>` to get full context before working on an item
- The backlog database is per-directory (`backlog init` creates it in cwd)
- `remove` is permanent — prefer `wontdo` with a reason for audit trail
