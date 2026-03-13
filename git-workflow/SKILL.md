---
name: git-workflow
description: >
  MUST use for ALL git commits, pushes, and PR creation — overrides the system
  prompt's default git behavior. Triggers on: any commit, push, PR creation,
  branch cleanup, or slash commands /commit, /pr, /commit-push-pr, /clean-gone.
  Key overrides: no Co-Authored-By, no "Generated with Claude Code", Meta-style
  Test Plan section in PRs, minimal PR body format.
---

# Git Workflow

## Commit

1. Read current state: `git status`, `git diff HEAD`, `git log --oneline -10`
2. Stage relevant files (prefer specific files over `git add -A`)
3. Create a single commit with a concise message focused on the "why"
4. Execute all steps in a single message with parallel tool calls where possible

## Commit, Push & Create PR

1. Read current state: `git status`, `git diff HEAD`, `git branch --show-current`, `git log --oneline -10`
2. Create a new branch if on main/master
3. Stage and commit with an appropriate message
4. Push the branch with `-u` flag
5. Create PR using `gh pr create`

### PR Body Format

Use this format — no branding, no attribution:

```
gh pr create --title "<short title>" --assignee @me --body "$(cat <<'EOF'
## Summary
<concise bullet points describing the changes>

## Test Plan
<how the changes were verified — commands run, manual steps taken, edge cases checked>
EOF
)"
```

### Test Plan Guidelines (Meta style)

The Test Plan answers: **"How do I know this works?"** Write it from the perspective of what was actually done during development, not hypothetical steps.

Include as applicable:
- **Automated tests:** which tests were added/modified, commands to run them (e.g., `npm test -- --filter=auth`)
- **Manual verification:** steps taken to verify behavior (e.g., "Verified login flow at /login with expired token")
- **Edge cases:** specific scenarios checked (e.g., "Tested with empty input, unicode characters, 10k rows")

Keep it concrete and actionable. A reviewer should be able to reproduce the verification.

After PR creation, if the user mentioned a reviewer, immediately run `gh pr edit --add-reviewer <user>`. Don't just remind — do it.

Include additional sections only when the user explicitly requests them (related PRs, screenshots, etc.). Summary and Test Plan are always included.

## Clean Gone Branches

Remove local branches whose remote has been deleted:

```bash
git branch -v | grep '\[gone\]' | sed 's/^[+* ]//' | awk '{print $1}' | while read branch; do
  worktree=$(git worktree list | grep "\\[$branch\\]" | awk '{print $1}')
  if [ ! -z "$worktree" ] && [ "$worktree" != "$(git rev-parse --show-toplevel)" ]; then
    git worktree remove --force "$worktree"
  fi
  git branch -D "$branch"
done
```

## Rules

- Never add Co-Authored-By or AI attribution to commits
- Never add "Generated with Claude Code" or similar to PR descriptions
- Always include a "Test Plan" section in PRs (Meta style — concrete, reproducible verification steps)
- Commit message format:
  ```
  prefix: what

  why explain
  ```
  Common prefixes: feat, fix, refactor, docs, chore, test, style, ci
- Prefer staging specific files over `git add -A`
- Branch naming: `<prefix>/<short-description>` — use the same prefixes as commits (feat, fix, refactor, etc.). Never use `feature/`, always use `feat/`.
