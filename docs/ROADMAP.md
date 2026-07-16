# Roadmap

## Phase 1 — Agent OS layer ✅ (this branch)
Orchestrator (CLAUDE.md), 18 single-task specialists in 4 teams, 4 chained
workflow skills, memory/outbox convention, audit + architecture docs.

## Phase 2 — Live operation (next 1–2 weeks)
- Run each workflow for real: one /client-discovery on a genuine niche, daily
  /study-session and /daily-briefing, one full /content-pipeline cycle.
- Seed `memory/`: brand-strategy.md (via brand-strategist), study plans for SAT
  and IELTS (via study-planner), pipeline.md.
- Tune agents from real transcripts — tighten any specialist that drifts out of
  its lane or pads output. Prompts are code: PR every change.

## Phase 3 — Automation & schedule
- Scheduled runs: /daily-briefing every morning, weekly audience-analyst retro,
  weekly study replan (Claude Code Routines / cron triggers).
- Connector hardening: Apollo for prospect-scout, Gmail draft flow for
  inbox-triage, Calendar read for day-planner — each behind least-privilege.
- Optional n8n bridge for triggers Claude can't schedule natively.

## Phase 4 — Runtime & evals
- Backend grows into a thin agent runtime/API (FastAPI + Claude Agent SDK):
  session logs, run history, a simple dashboard.
- Eval suite: golden tasks per agent (e.g. pain-point-miner must return quotes
  with sources; ielts-coach must band per criterion) run in CI on every prompt
  change — prompt regressions get caught like code regressions.
- CI: lint agent frontmatter, validate skill files, run evals on PR.

## Non-goals (deliberately)
- No local LLM until there's a privacy-driven reason — the connectors and model
  quality live in the cloud today.
- No autonomous outbound (sending, publishing, contacting) — approval gates stay.
