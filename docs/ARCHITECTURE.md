# JARVIS Architecture — Personal Agent Operating System

## Design principle

**One agent, one task, mastered.** No generalists below the orchestrator. Every
specialist has a single job, a defined method, a quality bar, and an explicit
"NOT my job" boundary that routes work to a sibling. The orchestrator (Jarvis,
defined in `CLAUDE.md`) decomposes requests, fans out to specialists in
parallel, and fans back in through a synthesizer before anything reaches Coach.

This is the Claude Code subagent model: definitions are versioned markdown in
this repo; execution happens wherever Claude runs (Claude Code, claude.ai,
future runtime) with Coach's connected tools (Apollo, Gmail, Calendar, Drive,
web search).

```
                          ┌─────────────────┐
                          │  JARVIS (CLAUDE.md)  Chief of Staff
                          └──────┬──────────┘
        ┌──────────────┬─────────┴────────┬───────────────┐
   GROWTH TEAM     LEARNING TEAM      BRAND TEAM       OPS TEAM
   market-analyst  study-planner      brand-strategist day-planner
   pain-point-miner sat-coach         content-writer   inbox-triage
   prospect-scout  ielts-coach        repurposer
   client-analyst  programming-mentor audience-analyst
   offer-doctor    quiz-master
   insight-synth.  note-distiller
```

## Teams and flows

### Growth (business as medicine: diagnose → prescribe)
`market-analyst` (market map) ∥ `pain-point-miner` (verbatim pains) ∥
`prospect-scout` (qualified leads) → `client-analyst` (dossier on chosen target)
→ `insight-synthesizer` (one ≤400-word decision brief) → `offer-doctor`
(the offer + pricing). Codified as the **/client-discovery** skill.

### Learning (SAT, IELTS, programming/IT/ML)
`study-planner` (backwards plan) → per-subject master (`sat-coach` /
`ielts-coach` / `programming-mentor`) → `quiz-master` (mandatory exit testing)
with `note-distiller` digesting raw material into notes + flashcards.
Codified as **/study-session**.

### Brand (everything Coach does becomes public proof-of-work)
`brand-strategist` (pillars + calendar) → `content-writer` (one piece, his
voice) → human approval gate → `repurposer` (platform kit) → `audience-analyst`
(metrics → next month's strategy). Codified as **/content-pipeline**.

### Ops (the daily glue)
`inbox-triage` ∥ `day-planner` → composed morning brief. Codified as
**/daily-briefing**.

## Cross-cutting rules

1. **Fan-out is parallel, fan-in is mandatory.** Multi-agent research always
   terminates in a synthesizer; raw dumps never reach Coach.
2. **Draft-only outbound.** No agent sends email, publishes, or contacts anyone.
   Human approval gates are written into the skills, not left to memory.
3. **Honest failure.** `INSUFFICIENT DATA: <gap>` beats fabrication, always.
4. **State lives in the repo:**
   - `memory/` — durable knowledge (brand strategy, study progress, client pipeline)
   - `outbox/` — dated deliverables (briefs, plans, drafts)
   Agents read relevant state before working and append after — that's what makes
   sessions compound instead of restart.
5. **Least privilege.** Research agents get web + files; coaches get files only;
   ops agents get read + draft on Gmail/Calendar. Nothing gets send/publish.
6. **Flywheel.** Wins from any team are candidates for /content-pipeline — the
   work produces the brand, the brand produces clients, clients produce work.

## Repo layout

```
CLAUDE.md               orchestrator (routing, quality bar, memory rules)
.claude/agents/*.md     18 specialists (frontmatter + focused system prompt)
.claude/skills/*/SKILL.md  4 chained workflows
memory/                 durable state (gitignored where sensitive)
outbox/                 dated outputs
docs/                   AUDIT, ARCHITECTURE, ROADMAP
backend/                FastAPI stub — future local runtime/API (Phase 3)
```
