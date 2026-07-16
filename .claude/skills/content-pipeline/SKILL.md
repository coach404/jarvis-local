---
name: content-pipeline
description: Turn a real event (win, lesson, shipped thing, study milestone) into publish-ready multi-platform content. Use when Coach says "make a post about", "publish this", "share this win", or after any notable achievement in another workflow.
---

# Content Pipeline

From "something happened" to a distribution kit of drafts. Input: the event/raw
material (or pick the best recent candidate from `outbox/` and `memory/`).

## Steps

1. **Angle check** — read `memory/brand-strategy.md` (pillars, voice). Confirm
   which pillar this event serves and the audience (future clients vs builders).
   No strategy file yet → run `brand-strategist` once to create it.
2. **Original draft** — `content-writer` produces the primary piece for the
   platform where this story is strongest (client-relevant → LinkedIn;
   builder/technical → X).
3. **Approval gate** — show Coach the draft + alternate hooks. STOP until he
   approves or edits. Nothing proceeds unapproved.
4. **Multiply** — `repurposer` turns the approved piece into the platform kit
   with a staggered schedule.
5. **Log** — record the piece in `memory/brand-analytics.md` (date, pillar,
   platform, hook style) so `audience-analyst` can score it later when metrics
   come in.

## Rules
- Only true stories: real numbers, real failures, real dates. `[NEEDS FACT]`
  placeholders must be resolved before the approval gate.
- Publishing itself is manual (Coach posts) until a publishing integration is
  explicitly approved.
- Monthly: run `audience-analyst` → `brand-strategist` to refresh the calendar.
