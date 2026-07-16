---
name: study-session
description: Run one complete study session — plan check, learn, test, log. Use when Coach says "let's study", "SAT session", "IELTS practice", "teach me <topic>", or a study block from the day plan starts.
---

# Study Session

One disciplined session: the right topic, active learning, forced recall, logged
progress. Input: subject (SAT / IELTS / programming / other) and available time.

## Steps

1. **Plan check** — read the active plan in `outbox/` (latest study-plan file)
   and progress in `memory/`. Today's scheduled topic wins unless Coach overrides.
   No plan exists → run `study-planner` first, then continue.
2. **Warm-up recall (5 min)** — `quiz-master` re-tests the missed items from the
   last session's log before anything new.
3. **Core block** — route by subject:
   - SAT → `sat-coach` (drill + error autopsy)
   - IELTS → `ielts-coach` (task + band feedback)
   - Programming/IT/ML → `programming-mentor` (concept + micro-project)
   - Raw material to digest → `note-distiller` first, then continue
4. **Exit test** — `quiz-master` on today's material (5–8 questions). This is
   mandatory — a session without retrieval is entertainment, not studying.
5. **Log** — one entry to `memory/study-log.md`: date, subject, what was covered,
   exit-test score, missed items for next warm-up.

## Rules
- Fit the time given: 30 min → shrink every step, never skip step 4.
- If exit-test score < 60%, tomorrow's session re-covers, doesn't advance.
- End with **Next action**: exactly what and when the next session is.
