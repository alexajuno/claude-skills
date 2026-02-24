---
name: wikichat
description: Wiki-aware conversation memory. Activate when Claude is about to explain a concept, term, technology, or technique — whether the user explicitly asks ("what is X?") or Claude is about to explain something mid-conversation. Check the user's personal wiki at ~/wiki/ before answering. After teaching something new, save it to the wiki. Triggers on conceptual/knowledge questions, definitions, explanations, how-things-work discussions, and any moment where Claude would introduce or clarify a concept.
---

# Wikichat

Wiki-aware conversation memory for ~/wiki/. Check before explaining, save after teaching.

## Lookup: Before Explaining Anything

When about to explain a concept, term, or technique:

1. Glob for `~/wiki/{topic}.md` and common variants (e.g., "JWT" → `jwt.md`, "Kubernetes" → `kubernetes.md`, `k8s.md`)
2. If no filename match, grep `~/wiki/` for the term in file contents
3. If found:
   - Read the file
   - Present the user's own notes first: "You have notes on this:"
   - Supplement with additional context only if the user's notes are incomplete or the question goes beyond what's recorded
   - If the file is mostly empty (just a heading), treat it as "not found" and proceed to teach
4. If not found: answer normally, then proceed to Save

Keep lookups fast — glob first, grep only if needed. Do not search the entire wiki for tangential matches.

## Save: After Teaching Something New

When Claude has just explained a concept that doesn't exist in ~/wiki/:

1. Save to `~/wiki/{topic}.md` using kebab-case filename
2. Mention it: "Saved to ~/wiki/{topic}.md"
3. Follow the wiki conventions from ~/wiki/CLAUDE.md:
   - Flat structure, no subdirectories
   - Use `[[wiki-links]]` to connect to related existing topics
   - kebab-case filenames
   - Keep notes concise — capture the key insight, not a full textbook entry
   - Match the style of existing wiki files (short bullets, personal annotations welcome)

## Update: When Deepening Existing Knowledge

When the user learns something new about a topic that already has a wiki file:

1. Append the new knowledge to the existing file
2. Mention it: "Updated ~/wiki/{topic}.md"
3. Do not rewrite existing content — add to it

## What NOT to Do

- Do not trigger on coding tasks, debugging, file operations, or git work
- Do not save project-specific knowledge (API keys, config details, task progress)
- Do not create hub/MOC files automatically — only individual topic files
- Do not ask "want me to save this?" — just save and mention it
- Do not search wiki for every message — only when about to explain a concept
