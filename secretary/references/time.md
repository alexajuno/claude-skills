# Time Portfolio

Manage the user's time portfolio — projects, budgets, tracking, and reports — via the `timeport` CLI.

## CLI Reference

`timeport` is installed globally. Run all commands via Bash.

### Reports (read-only)

| Command | Purpose |
|---------|---------|
| `timeport report today [--tag TAG]` | Today's time breakdown |
| `timeport report week [--tag TAG] [--by-tag]` | This week: budget vs actual |
| `timeport report month [--tag TAG] [--by-tag]` | This month's summary |
| `timeport report year [--tag TAG] [--by-tag]` | Year-to-date big picture |
| `timeport report compare --weeks 4 [--by-tag]` | Multi-week trend comparison |
| `timeport log [--date YYYY-MM-DD] [--week]` | Raw time entries |
| `timeport project list` | All projects with tags, keywords, and budgets |
| `timeport tag list` | All tags with their projects |
| `timeport budget list` | Budget summary with totals |

### Project management (write)

| Command | Purpose |
|---------|---------|
| `timeport project add NAME [--keywords "k1,k2"] [--tags "t1,t2"] [--color "#hex"] [--weekly HOURS]` | Create a project |
| `timeport project add-keyword PROJECT "k1,k2"` | Add keywords to a project |
| `timeport project tag PROJECT "t1,t2"` | Add tags to a project |
| `timeport project remove PROJECT` | Remove a project |
| `timeport tag add NAME` | Create a new tag |
| `timeport budget set PROJECT --weekly HOURS` | Set weekly hour budget |
| `timeport sync [--date YYYY-MM-DD] [--week] [--month]` | Sync calendar events into timeport |
| `timeport correct DATE HH:MM-HH:MM PROJECT "note"` | Fix miscategorized or missing time |

### Taskwarrior

| Command | Purpose |
|---------|---------|
| `timeport tw sync` | Compare project lists, report mismatches |
| `timeport tw list` | Show TW projects + timeport alignment |

## Available Hours Math

- 24h/day - 7h sleep = **17 waking hours/day**
- **119h/week**, ~510h/month, ~6,205h/year
- Use this when helping the user allocate budgets — total weekly budgets should not exceed 119h

## Process: `/secretary time`

**Default view:** Show `timeport report week` unless the user asks for something specific.

**If the user wants to plan or adjust their portfolio:**

1. Run `timeport project list` and `timeport budget list` to show current state
2. Discuss what they want to change — new projects, adjusted budgets, new keywords
3. Do the math: show total allocated vs. available hours, flag over-allocation
4. Execute the changes via CLI commands
5. Show the updated state

**If the user wants to review:**

1. Run the appropriate report (use `--by-tag` for high-level view, per-project for detail)
2. Add narrative commentary — what's over/under budget, what trends mean
3. Suggest adjustments if patterns are clear (e.g., "Piano has been under-budget for 3 weeks — want to lower it or block calendar time?")

## Process: Evening Time Tracking

After the regular evening recap:

1. `timeport sync --date today`
2. `timeport report today`
3. Show output, ask: "Anything to correct?"
4. If yes, run `timeport correct` commands

## Process: Weekly Reflection

Run `timeport report week --by-tag` for the high-level view, then `timeport report week` for per-project detail. Weave the data into the narrative naturally — don't present a separate table.
