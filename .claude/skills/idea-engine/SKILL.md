---
name: idea-engine
description: The wealth pipeline — from "I need ideas" to a validated venture with a 30-day launch plan. Use when Coach says "give me business ideas", "what should I build", "how do I get rich", "validate this idea", or wants to start a new digital-product venture.
---

# Idea Engine

Chain the Wealth team end-to-end. Input: nothing (open scan), a theme, or a
specific idea Coach already has. Output: validated verdicts + a launch plan for
the winner.

## Steps

1. **Context load** — read `memory/goals.md`, `memory/business-profile.md`,
   `memory/idea-ledger.md` (never re-generate ideas already KILLED), and any
   recent pain data (`pain_points` table via Supabase connector, or latest
   pain research in `outbox/`).
2. **Generate** — `idea-scout` produces the scored idea list (skip if Coach
   brought his own idea — it enters at step 3).
3. **Validate** — `idea-validator` runs the 4 checks on the top 3–5. Expect
   kills; that's the engine working.
4. **Decide** — `money-strategist` ranks surviving BUILD/PROBE ideas by expected
   value per hour and picks ONE (plus the cheapest PROBE experiment if any).
5. **Plan** — `venture-builder` turns the winner into the 30-day launch plan
   with weekly milestones, agent assignments, and tripwires.
6. **Log & flywheel** — update `memory/idea-ledger.md` with all verdicts; offer
   /content-pipeline ("building X in public, day 0" is premium content).

## Rules
- One venture in active build at a time. New winners queue in the ledger.
- A PROBE experiment must cost < 1 week and have a numeric success threshold
  decided before it starts.
- If everything gets killed, that's a valid output — the ledger grew, no money
  was burned, run again with a new theme. Say so plainly.
