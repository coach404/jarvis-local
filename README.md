# jarvis-local — Personal Agent Operating System

A team of AI specialists that work like personal staff: each agent masters
exactly ONE task, an orchestrator (Jarvis) routes and assembles, and chained
workflows cover the real jobs of daily life — winning clients, studying for
SAT/IELTS/programming, and building a public personal brand.

## What's inside

- **`CLAUDE.md`** — Jarvis, the Chief of Staff: routing rules, quality bar, memory.
- **`.claude/agents/`** — 22 single-task specialists in 5 teams:
  - **Growth**: market-analyst · pain-point-miner · prospect-scout ·
    client-analyst · offer-doctor · insight-synthesizer
  - **Wealth**: idea-scout · idea-validator · venture-builder · money-strategist
  - **Learning**: study-planner · sat-coach · ielts-coach · programming-mentor ·
    quiz-master · note-distiller
  - **Brand**: brand-strategist · content-writer · repurposer · audience-analyst
  - **Ops**: day-planner · inbox-triage
- **`.claude/skills/`** — chained workflows: `/client-discovery`, `/idea-engine`,
  `/study-session`, `/content-pipeline`, `/daily-briefing`, `/second-brain`
- **`memory/`** & **`outbox/`** — durable state and dated deliverables
- **`docs/`** — [AUDIT](docs/AUDIT.md) · [ARCHITECTURE](docs/ARCHITECTURE.md) ·
  [ROADMAP](docs/ROADMAP.md)
- **`backend/`** — FastAPI stub, grows into the agent runtime in Phase 4

## How to use

Open this repo in Claude Code (or connect it on claude.ai). The orchestrator
loads from `CLAUDE.md`; agents and skills are picked up automatically. Start
your day with `/daily-briefing`; hunt clients with `/client-discovery <niche>`;
study with `/study-session`; publish with `/content-pipeline`.

## Principles

1. One agent = one task, mastered.
2. Fan-out research in parallel; fan-in through a synthesizer — always.
3. Draft-only outbound: no agent sends, publishes, or contacts anyone.
4. State compounds in the repo (`memory/`, `outbox/`) — sessions never start from zero.
