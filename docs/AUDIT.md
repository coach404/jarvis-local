# Repo Audit — jarvis-local

Date: 2026-07-16 · Auditor: Claude (L99 Architect pass) · Baseline commit: `7c97751`

Scored against the current market bar for personal agentic systems: Claude Code
subagent architectures, Claude Agent SDK apps, Mastra/LangGraph/CrewAI production
setups, and OSS reference repos (awesome-llm-apps, open-saas, n8n starter kits).

## Scorecard (0–10 per dimension)

| # | Dimension | Score | What exists | Market bar |
|---|-----------|-------|-------------|------------|
| 1 | Agent architecture | **0/10** | Nothing — no agents, no orchestrator, no prompts | Orchestrator + single-responsibility specialists, defined hand-offs, escalation rules |
| 2 | Skills / workflows | **0/10** | None | Repeatable multi-step workflows codified as skills/commands, invocable on demand or on schedule |
| 3 | Memory & context | **0/10** | No CLAUDE.md, no user profile, no persistent state | Project memory (CLAUDE.md), per-domain context files, retrieval store for long-term facts |
| 4 | Tool / connector layer | **1/10** | `.env.example` hints at intent only | MCP servers + connectors mapped per agent, least-privilege tool grants |
| 5 | Backend | **1/10** | FastAPI `/health` stub (7 lines) | Typed API, agent runtime endpoints, streaming, auth, persistence |
| 6 | Testing & CI | **0/10** | No tests, no CI | Unit + eval tests for agents (prompt regression), GitHub Actions on PR |
| 7 | Docs | **1/10** | 5-line README referencing a frontend that doesn't exist | Architecture doc, agent catalog, runbooks, onboarding |
| 8 | Security & config | **2/10** | `.gitignore` + `.env.example` exist (good instinct) | Secret hygiene, permission tiers per agent, audit trail for outbound actions |
| 9 | Stack currency | **1/10** | Comments point to `ggml-model.bin`, 2048 ctx — a llama.cpp-era stack, outdated | Claude Agent SDK / modern models, 200k ctx, hybrid local+cloud |
| 10 | Product clarity | **2/10** | "Local-first desktop agentic assistant" — a direction, not a spec | Clear jobs-to-be-done, team map, measurable outcomes per agent |

**Total: 8/100.** This is an empty lot with a sign that says "house coming soon."
Nothing to salvage or refactor — which is actually the good news: we build the
right architecture from zero with no legacy drag.

## Key findings

1. **The valuable asset isn't in the repo.** The owner already runs 20+ operator
   skills (agent-architect, ai-agent-orchestrator, idea-to-launch, pain-point-miner,
   prompt-master, millionaire-revenue-finder, ATime brand pack) and 70+ connected
   plugins (Apollo, Gmail, Calendar, Drive, marketing/sales/productivity suites).
   The repo ignores all of it. The fix is to make the repo the **operating system
   that routes work to those capabilities**, not another chatbot backend.
2. **Local-LLM-first was the wrong 2023 bet.** `ggml` + 2048 context can't run a
   master-level specialist. Correct architecture: agent definitions live here
   (portable, versioned, reviewable), execution runs on Claude Code / claude.ai
   where the connectors already are. Local models become an optional privacy tier
   later, not the foundation.
3. **No division of labor.** The stated goal is "a team of workers, each a master
   of ONE task." That maps exactly to the Claude Code subagent model: an
   orchestrator (CLAUDE.md) + `.claude/agents/*` specialists + `.claude/skills/*`
   playbooks that chain them. That layer is 100% missing and is what this branch adds.

## Verdict

Score today: **8/100**. Target after Phase 1 (this branch): agent OS layer in place
(architecture, orchestrator, 4 teams / 18 specialists, 4 chained workflows, docs)
— the dimensions 1, 2, 3, 7, 10 move to market bar. Phases 2–4 (see ROADMAP.md)
address runtime, evals/CI, and automation.
