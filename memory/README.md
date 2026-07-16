# memory/

Durable knowledge the agents read before working and update after.

Convention: one topic per file, markdown, newest entries appended with a date.

Expected files (created by the agents as they run):
- `brand-strategy.md` — positioning, pillars, voice (owner: brand-strategist)
- `brand-analytics.md` — published pieces + performance (owner: audience-analyst)
- `sat-progress.md`, `ielts-progress.md`, `programming-path.md` — per-subject
  progress (owners: the coaches)
- `study-log.md`, `quiz-log.md` — session logs (owners: study-session skill, quiz-master)
- `pipeline.md` — client pursuits and their status (owner: client-discovery skill)

Anything containing confidential client data belongs in `memory/private/`
(gitignored).
