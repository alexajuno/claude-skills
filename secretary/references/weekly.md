# Weekly Reflection

## Data Sources

1. **Calendar** — fetch this week's events (Monday to Sunday) from Google Calendar MCP
2. **Tasks completed** — `task end.after:sow end.before:eow completed` (sow/eow = start/end of week)
3. **Tasks added** — `task entry.after:sow entry.before:eow list`
4. **Tasks overdue** — `task status:pending +OVERDUE`
5. **Daily entries** — read all `~/life/daily/YYYY-MM-DD.md` files from this week
6. **Time portfolio** — run `timeport report week` for this week's time breakdown

## Process

1. Gather all data sources above
2. Read `~/life/weekly/CLAUDE.md` for tone guidelines
3. Read this week's daily entries for personal context
4. Weave time portfolio data into the reflection naturally. Don't present it as a separate table — integrate it with the narrative (e.g., "You spent 38 hours at work this week, 2 under your budget. Creative time took a hit — only 1 hour of piano when you budgeted 4.").
5. Write the reflection to `~/life/weekly/YYYY-Www.md`

## Output

Write directly to `~/life/weekly/YYYY-Www.md`. The format follows the tone from `~/life/weekly/CLAUDE.md`:
- Like a gentle friend checking in
- Touch on: how the week went, what's on your mind, what you want next week to look like
- Weave in factual data (events attended, tasks completed, what got delayed) naturally
- Reference daily entries when they add emotional/personal context
- No rigid structure — messy is fine

## Notes
- The weekly reflection is NOT a separate factual summary. It merges factual data into the reflective format.
- Use the daily entries as the primary narrative thread. Calendar and tasks add structure.
- If no daily entries exist for the week, rely on calendar + tasks and note the gap.
