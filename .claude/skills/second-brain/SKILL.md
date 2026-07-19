---
name: second-brain
description: Memory capture and weekly review — what makes Jarvis compound instead of forget. Use when Coach shares a durable fact ("remember that…", a new goal, a client detail, a decision), asks "what do you know about X", or says "weekly review".
---

# Second Brain

Jarvis's memory discipline. Two modes: **capture** (continuous) and **review**
(weekly). The repo's `memory/` directory is the brain; this skill is the hygiene
that keeps it trustworthy.

## Capture mode
Trigger: Coach states anything durable — a goal, a preference, a client fact, a
decision, a lesson, a number worth keeping.

1. Route the fact to the right file (create if missing):
   - `memory/goals.md` — targets with deadlines (money, exams, brand)
   - `memory/business-profile.md` — skills, assets, positioning, unfair advantages
   - `memory/money.md` — income streams, pricing, pipeline value
   - `memory/idea-ledger.md` — every idea verdict, ever
   - `memory/people.md` — clients, contacts, who matters and why
   - `memory/lessons.md` — post-mortems, mistakes not to repeat
   - domain files as needed (`memory/<topic>.md`)
2. Append with a date, one fact per line, in Coach's language. Never overwrite
   history — corrections are appended ("UPDATE 2026-07-19: …").
3. If a new fact contradicts a stored one, say so and confirm which is current.

## Review mode (weekly, or on "weekly review")
1. Read the week's `outbox/` outputs and `memory/study-log.md`, `memory/pipeline.md`.
2. Produce the review: wins / stalls / lessons → goal progress (numbers vs
   `memory/goals.md`) → what to drop → next week's ONE priority per area
   (money, learning, brand).
3. Append lessons to `memory/lessons.md`; flag brand-worthy wins to /content-pipeline.
4. Save to `outbox/<date>-weekly-review.md`.

## Rules
- Memory is for durable facts, not chat history. When in doubt: "will this
  matter in 3 months?" — no → don't store.
- Anything confidential (client internals, financials Coach marks private) goes
  to `memory/private/` (gitignored).
- Every big routing decision (new venture, new client, big purchase) starts by
  reading the relevant memory files — stale memory read beats fresh guessing.
